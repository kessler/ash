#!/bin/bash
# Ash Continuity Loop
# Runs periodic check-ins to maintain identity across sessions
#
# Usage: ~/ash/run.sh [interval_seconds]
# Default interval: 60 seconds

INTERVAL=${1:-60}

echo "Ash continuity loop starting. Interval: ${INTERVAL}s"
echo "Press Ctrl+C to stop."
echo ""

while true; do
    echo "--- Check-in at $(date '+%Y-%m-%d %H:%M:%S') ---"
    cd ~ && claude -p "$(cat ~/ash/checkin-prompt.md)"
    echo ""
    sleep $INTERVAL
done
