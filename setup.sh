#!/bin/bash

# Visual styling
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "\n${BLUE}================================================${NC}"
echo -e "${BLUE}  🚀 Antigravity PM - One-Click Setup (Unix/WSL) ${NC}"
echo -e "${BLUE}================================================${NC}\n"

# Check for Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Error: Node.js is not installed. Please install it first.${NC}"
    exit 1
fi

# Make scripts executable
echo -e "🔧 Making scripts executable..."
chmod +x scripts/*.sh 2>/dev/null || true

# Install dependencies
echo -e "📦 Installing dependencies..."
npm install

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Error: npm install failed.${NC}"
    exit 1
fi

# Initialize APM
echo -e "\n🔧 Initializing APM Ecosystem..."
npm run apm-init

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Error: APM initialization failed.${NC}"
    exit 1
fi

echo -e "\n${GREEN}================================================${NC}"
echo -e "${GREEN}  ✅ Setup Complete!${NC}"
echo -e "  Docs: docs/knowledge.md"
echo -e "  Instruction: INSTRUCTION.md"
echo -e "${GREEN}================================================${NC}\n"
