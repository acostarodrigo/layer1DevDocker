#!/bin/bash
set -e

# Initialize IPFS (if not already done)
if [ ! -d "$HOME/.ipfs" ]; then
  ipfs init
fi

# Start IPFS
ipfs daemon &

# Start Docker if not already running
service docker start || true

# Pull Blender image (optional if already done)
docker pull blendergrid/blender || true

# Setup Cosmos SDK node if not initialized
if [ ! -d "$HOME/.janctiond" ]; then
  cd /workspace/janctionLayer1Node
  make install
  make init
  make testnet-add
fi


# Keep the container interactive
exec "$@"
