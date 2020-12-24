#!/usr/bin/env bash
set -e

MODE="MULTI_ROOM_CLIENT"
SNAPSERVER=$SOUND_MULTIROOM_MASTER

# --- ENV VARS ---
# SOUND_MULTIROOM_LATENCY: latency in milliseconds to compensate for speaker hardware sync issues
LATENCY=${SOUND_MULTIROOM_LATENCY:+"--latency $SOUND_MULTIROOM_LATENCY"}

echo "Starting multi-room client..."
echo "Mode: $MODE"
echo "Target snapcast server: $SNAPSERVER"

# Start snapclient
if [[ "$MODE" == "MULTI_ROOM" || "$MODE" == "MULTI_ROOM_CLIENT" ]]; then
  /usr/bin/snapclient --host $SNAPSERVER $LATENCY --logfilter *:notice
else
  echo "Multi-room client disabled. Exiting..."
  exit 0
fi