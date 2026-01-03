#!/bin/bash
# APM initialization script
# Creates directory structure and knowledge base

set -e

echo "Initializing APM directories..."

# Create directory structure
DIRS=(
    ".antigravity/0-analysis"
    ".antigravity/1-planning"
    ".antigravity/2-execution"
    "docs"
)

for dir in "${DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        echo "Created: $dir"
    else
        echo "Exists: $dir"
    fi
done

# Create knowledge.md if it doesn't exist
KNOWLEDGE_FILE="docs/knowledge.md"
if [ ! -f "$KNOWLEDGE_FILE" ]; then
    cat > "$KNOWLEDGE_FILE" << 'EOF'
# System Knowledge Base (Self-Learning)

This file acts as the project's long-term memory. It stores lessons learned, anti-patterns, and best practices discovered during execution.
**Agents must READ this file before Planning or Executing.**

## 🚫 Anti-Patterns (Don't Do This)
*   [General] Do not make changes to files outside the current task scope without permission.
*   [General] Do not assume `npm install` will work without checking `package.json` first.

## ✅ Best Practices (Do This)
*   [Code] Always add comments to complex logic.
*   [Tests] Always verify changes with `npm test` or by running the code before marking a task complete.

## ⚠️ Technical Constraints
*   [Env] We are running in a Windows environment (PowerShell 5.1).
    *   **Command Chaining**: Use `;` to run multiple commands (e.g., `cmd1 ; cmd2`). Do NOT use `&&`.
    *   **WSL**: Use `wsl bash -c "command"` for complex Linux operations.
*   [Node] Ensure compatibility with the project's Node version.

---
*Append new lessons below this line.*
EOF
    echo "Created: $KNOWLEDGE_FILE"
else
    echo "Exists: $KNOWLEDGE_FILE"
fi

echo "APM Initialization complete."
