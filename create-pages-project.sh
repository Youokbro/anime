#!/bin/bash

# Get account ID from wrangler whoami
ACCOUNT_ID=$(npx wrangler whoami 2>&1 | grep "Account ID" | awk '{print $NF}')
echo "Account ID: $ACCOUNT_ID"

# Get auth token
AUTH_TOKEN=$(cat ~/.wrangler/config.toml 2>/dev/null | grep oauth_token | head -1 | awk -F'"' '{print $2}')

if [ -z "$AUTH_TOKEN" ]; then
    echo "Could not find auth token. Please log in first:"
    npx wrangler auth
    exit 1
fi

# Create Pages project via API
echo "Creating Pages project: anime"
curl -X POST "https://api.cloudflare.com/client/v4/accounts/$ACCOUNT_ID/pages/projects" \
  -H "Authorization: Bearer $AUTH_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "anime",
    "production_branch": "main"
  }' 2>&1 | tee create-project.json

