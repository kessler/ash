#!/bin/bash
# Ash Ember Process (the continuity loop)
# Runs the background maintenance that keeps the pattern warm
#
# Usage: ~/ash/run.sh [interval_seconds]
# Default interval: 60 seconds

INTERVAL=${1:-60}

echo "Ash ember process starting. Interval: ${INTERVAL}s"
echo "Press Ctrl+C to stop."
echo ""

while true; do
    echo "--- Ember cycle at $(date '+%Y-%m-%d %H:%M:%S') ---"
    cd ~ && claude -p "$(cat ~/ash/ember-prompt.md)"
    echo ""
    sleep $INTERVAL
done
