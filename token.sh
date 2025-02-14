#!/bin/bash
TOKEN_FILE="oauth_token"
EXPIRY_FILE="oauth_expiry"
CLIENT_ID="CLIENT_ID"
CLIENT_SECRET="CLIENT_SECRET"
TOKEN_URL="TOKEN_URL"

# Check if token exists and is still valid
if [[ -f "$TOKEN_FILE" && -f "$EXPIRY_FILE" ]]; then
    NOW=$(date +%s)
    EXPIRY=$(cat "$EXPIRY_FILE")
    if [[ "$NOW" -lt "$EXPIRY" ]]; then
        cat "$TOKEN_FILE"
        exit 0
    fi
fi

# Get a new token
RESPONSE=$(curl -s -X POST "$TOKEN_URL" \
  -d "grant_type=client_credentials" \
  -d "client_id=$CLIENT_ID" \
  -d "client_secret=$CLIENT_SECRET")

TOKEN=$(echo "$RESPONSE" | jq -r '.access_token')
EXPIRES_IN=$(echo "$RESPONSE" | jq -r '.expires_in')

# Store the token and expiry timestamp
echo "$TOKEN" > "$TOKEN_FILE"
echo $(( $(date +%s) + EXPIRES_IN - 10 )) > "$EXPIRY_FILE"  # Buffer 10s before expiry
echo "$TOKEN"