'use client';

import { useEffect, useState, ReactElement } from 'react';
import Link from 'next/link';

/**
 * The landing hero's primary CTA, adapted to auth state: a signed-in user
 * sees "Scan a menu" (the core action) instead of the onboarding CTA that a
 * new visitor gets. Reads the same fast `/api/auth/session` the header uses.
 *
 * Defaults to the signed-out CTA until auth resolves — most landing visitors
 * are logged out, so there's no swap for them; a signed-in user briefly sees
 * "Try the web app" before it flips to "Scan a menu."
 */
const CTA_CLASS =
  'rounded-bw-md bg-bite px-bw-6 py-bw-3 text-bw-base font-bold text-white shadow-sm hover:bg-bite-dark';

export function HeroCta() {
  const [signedIn, setSignedIn] = useState<boolean | null>(null);

  useEffect(() => {
    let active = true;
    fetch('/api/auth/session', { credentials: 'same-origin' })
      .then((r) => (r.ok ? r.json() : { signedIn: false }))
      .then((d: { signedIn?: boolean }) => {
        if (active) setSignedIn(Boolean(d.signedIn));
      })
      .catch(() => {
        if (active) setSignedIn(false);
      });
    return () => {
      active = false;
    };
  }, []);

  // Scanning a menu is a conversation now, so the core action for a
  // signed-in user is the chat rather than an upload form.
  if (signedIn) {
    return (
      <Link href="/chat" data-testid="cta-scan" className={CTA_CLASS}>
        Scan a menu →
      </Link>
    );
  }

  return (
    <Link href="/onboarding" data-testid="cta-web" className={CTA_CLASS}>
      Try the web app →
    </Link>
  );
}

function ComingSoonBadge({ label }: { label: string }): ReactElement {
  return (
    <span
      data-testid={`cta-soon-${label.toLowerCase().replace(/\s+/g, '-')}`}
      className="inline-flex items-center gap-bw-2 rounded-bw-md border border-zinc-200 bg-zinc-50 px-bw-4 py-bw-3 text-bw-base font-semibold text-zinc-500"
    >
      {label}
      <span className="rounded-bw-pill bg-zinc-200 px-bw-2 py-bw-0_5 text-bw-xs uppercase tracking-wider">
        Coming soon
      </span>
    </span>
  );
}

/**
 * Shows coming-soon badges and waitlist form to signed-out users only.
 * Signed-in users see the web app as the product, not a future mobile app.
 */
export function MarketingExtras(): ReactElement | null {
  const [signedIn, setSignedIn] = useState<boolean | null>(null);

  useEffect(() => {
    let active = true;
    fetch('/api/auth/session', { credentials: 'same-origin' })
      .then((r) => (r.ok ? r.json() : { signedIn: false }))
      .then((d: { signedIn?: boolean }) => {
        if (active) setSignedIn(Boolean(d.signedIn));
      })
      .catch(() => {
        if (active) setSignedIn(false);
      });
    return () => {
      active = false;
    };
  }, []);

  // Hide coming-soon badges and waitlist for signed-in users
  if (signedIn === true) {
    return null;
  }

  return (
    <>
      <ComingSoonBadge label="iOS app" />
      <ComingSoonBadge label="Android app" />
    </>
  );
}
