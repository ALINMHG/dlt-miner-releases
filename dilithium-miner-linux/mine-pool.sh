#!/bin/bash
set -euo pipefail

# === EDIT THESE ===
MINER_ADDRESS="PASTE_YOUR_WALLET_ADDRESS_HERE"
POOL_HOST="144.91.105.244:3333"
THREADS=4
# ==================

DIR="$(cd "$(dirname "$0")" && pwd)"
MINER="$DIR/dilithium-miner"

if [ ! -x "$MINER" ]; then
  chmod +x "$MINER" 2>/dev/null || true
fi

if [ ! -x "$MINER" ]; then
  echo "ERROR: dilithium-miner not found in $DIR"
  exit 1
fi

if [ "$MINER_ADDRESS" = "PASTE_YOUR_WALLET_ADDRESS_HERE" ]; then
  echo "ERROR: Edit mine-pool.sh and set MINER_ADDRESS to your wallet."
  exit 1
fi

echo "Pool:    $POOL_HOST"
echo "Miner:   $MINER_ADDRESS"
echo "Threads: $THREADS"
echo

exec "$MINER" --pool "$POOL_HOST" --miner="$MINER_ADDRESS" --threads "$THREADS"
