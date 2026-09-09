/**
 * Health check for service availability. Used by empty states and CTAs
 * to decide whether to promise photo scanning when the assistant (Anthropic API)
 * might not be configured.
 */

export interface HealthStatus {
  assistant_configured: boolean;
}

let cachedHealth: HealthStatus | null = null;
let cachedAt = 0;
const CACHE_TTL = 60_000; // 1 minute

/**
 * Fetch service health (assistant availability). Caches the result for 1 minute
 * to avoid hammering the API from multiple components.
 */
export async function fetchHealth(
  opts: { fetchImpl?: typeof fetch } = {},
): Promise<HealthStatus> {
  const { fetchImpl = fetch } = opts;
  
  const now = Date.now();
  if (cachedHealth && now - cachedAt < CACHE_TTL) {
    return cachedHealth;
  }

  try {
    const res = await fetchImpl('/api/health', { credentials: 'same-origin' });
    if (!res.ok) {
      // If the health endpoint fails, assume services are unavailable
      return { assistant_configured: false };
    }
    const data = (await res.json()) as HealthStatus;
    cachedHealth = data;
    cachedAt = now;
    return data;
  } catch {
    return { assistant_configured: false };
  }
}
