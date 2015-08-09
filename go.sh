#!/bin/bash
set command=

while [[ "$command" != "q" ]] && [[ "$command" != "q" ]]; do
    echo ""
    echo "BWD 432 online..."
    echo "How can I help you ... Sky?"
    echo "===================================="
    echo ""
    echo "  1) Clear, Create, Migrate, and Seed"
    echo "  2) Solr Start"
    echo "  B) Bundle install"
    echo "  S) Start the server"
    echo ""
    echo "  Q) Quit"
    echo ""
    echo "===================================="
    read command

    echo "Yes Dave..."
    if [[ "$command" == "1" ]]; then
        echo "** Rebuilding the database from seeds, please wait..."
		      bundle exec rake db:drop db:create db:migrate db:seed
    fi

    if [[ "$command" == "2" ]]; then
        echo "** Not yet"
    fi

    if [[ "$command" == "b" ]] || [[ "$command" == "B" ]]; then
        echo "** Installing the bundles..."
        bundle install
    fi

    if [[ "$command" == "s" ]] || [[ "$command" == "S" ]]; then
        echo "** Running the server..."
        bundle exec rails s -b 0.0.0.0
    fi
done

echo ""
echo "May the force be with you"
echo ""
