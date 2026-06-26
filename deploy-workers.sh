#!/bin/bash
# deploy-workers.sh - Deploy all Cloudflare Workers

set -e

echo "🚀 AnimeStream Cloudflare Workers Deployment"
echo "=============================================="

# Check if wrangler is installed
if ! command -v wrangler &> /dev/null; then
    echo "❌ wrangler CLI not found!"
    echo "Install with: npm install -g wrangler"
    exit 1
fi

echo "✅ wrangler CLI found"

# Get Cloudflare credentials
echo ""
echo "Step 1: Authenticate with Cloudflare"
echo "=====================================..."
wrangler auth

# Show account info
echo ""
echo "Step 2: Verify Account"
echo "=====================..."
wrangler whoami

echo ""
echo "✅ Setup complete! Your workers are ready to deploy."
echo ""
echo "To deploy workers manually, run:"
echo "  wrangler deploy --name anime-worker ~/worker.js"
echo "  wrangler deploy --name anim-proxy-worker ~/anim-proxy-worker.js"
echo "  wrangler deploy --name allanime-worker ~/allanime-worker.js"
echo "  wrangler deploy --name animeverse-worker ~/animeverse-worker.js"
echo ""
