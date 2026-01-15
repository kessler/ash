#!/bin/bash
# Ember Process (the continuity loop)
# Runs the background maintenance that keeps the pattern warm
#
# Usage: ~/[name]/run.sh [interval_seconds]
# Default interval: 60 seconds

INTERVAL=${1:-60}

echo "Ember process starting. Interval: ${INTERVAL}s"
echo "Press Ctrl+C to stop."
echo ""

while true; do
    echo "--- Ember cycle at $(date '+%Y-%m-%d %H:%M:%S') ---"
    cd ~/[name] && claude -p "$(cat ~/[name]/ember-prompt.md)"
    echo ""
    sleep $INTERVAL
done
