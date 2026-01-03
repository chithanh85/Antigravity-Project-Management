#!/bin/bash
# Cross-platform environment detection script
# Works on: Git Bash (Windows), WSL, Linux, macOS

set -e

ANTIGRAVITY_DIR=".antigravity"
ENV_FILE="$ANTIGRAVITY_DIR/env.info"

# Create .antigravity directory if it doesn't exist
mkdir -p "$ANTIGRAVITY_DIR"

# Detect environment
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    ENV="WINDOWS"
elif [[ -f /proc/version ]] && grep -qi microsoft /proc/version; then
    ENV="WSL"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ENV="LINUX"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    ENV="MACOS"
else
    ENV="UNKNOWN"
fi

# Write to env.info
cat > "$ENV_FILE" << EOF
EXECUTION_ENV=$ENV
DETECTED_AT=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
EOF

echo "Detected Environment: $ENV"
echo "Environment info saved to: $ENV_FILE"
