#!/usr/bin/env bash

# Launch wayfreeze
wayfreeze &
WAYFREEZE_PID=$!

# Wait so slurp doesnt mess it up
sleep 0.1

# Force close wayfreeze just in case
trap "kill $WAYFREEZE_PID 2>/dev/null" EXIT

# Select zone
GEOMETRY=$(slurp)

# If no selection don't do shit
if [ -n "$GEOMETRY" ]; then
    grim -g "$GEOMETRY" - | wl-copy
fi
