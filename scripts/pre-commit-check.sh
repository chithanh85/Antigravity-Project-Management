#!/bin/bash
# Universal pre-commit check script
# Auto-detects project type and runs appropriate linters/tests

set -e

echo "🔍 Running pre-commit checks..."

# Markdown linting (always run if .md files are staged)
STAGED_MD=$(git diff --cached --name-only --diff-filter=ACM | grep '\.md$' || true)
if [ -n "$STAGED_MD" ]; then
  echo "📝 Linting markdown files..."
  npx markdownlint-cli $STAGED_MD || exit 1
fi

# Node.js/TypeScript checks
if [ -f "package.json" ]; then
  echo "📦 Detected Node.js project"
  
  # Determine package manager
  if [ -f "pnpm-lock.yaml" ]; then
    PKG_MGR="pnpm"
  elif [ -f "yarn.lock" ]; then
    PKG_MGR="yarn"
  else
    PKG_MGR="npm"
  fi
  
  # Run lint if script exists
  if grep -q '"lint"' package.json || grep -q '"lint-all"' package.json; then
    echo "  🔧 Running lint..."
    $PKG_MGR run lint-all 2>/dev/null || $PKG_MGR run lint || exit 1
  fi
  
  # Run format check if script exists
  if grep -q '"format:check"' package.json; then
    echo "  💅 Checking format..."
    $PKG_MGR run format:check || exit 1
  fi
  
  # Run tests if script exists (skip if CI-only)
  if grep -q '"test"' package.json && ! grep -q '"test".*"echo' package.json; then
    echo "  🧪 Running tests..."
    $PKG_MGR test || exit 1
  fi
fi

# Python checks
if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
  STAGED_PY=$(git diff --cached --name-only --diff-filter=ACM | grep '\.py$' || true)
  
  if [ -n "$STAGED_PY" ]; then
    echo "🐍 Detected Python project"
    
    # Check if pylint is available
    if command -v pylint &> /dev/null; then
      echo "  🔧 Running pylint..."
      pylint $STAGED_PY || exit 1
    fi
    
    # Check if black is available
    if command -v black &> /dev/null; then
      echo "  💅 Checking format with black..."
      black --check $STAGED_PY || exit 1
    fi
    
    # Run pytest if available
    if command -v pytest &> /dev/null; then
      echo "  🧪 Running pytest..."
      pytest || exit 1
    fi
  fi
fi

# Go checks
if [ -f "go.mod" ]; then
  STAGED_GO=$(git diff --cached --name-only --diff-filter=ACM | grep '\.go$' || true)
  
  if [ -n "$STAGED_GO" ]; then
    echo "🔵 Detected Go project"
    
    # Run golangci-lint if available
    if command -v golangci-lint &> /dev/null; then
      echo "  🔧 Running golangci-lint..."
      golangci-lint run ./... || exit 1
    fi
    
    # Run go fmt check
    echo "  💅 Checking format..."
    UNFORMATTED=$(gofmt -l $STAGED_GO)
    if [ -n "$UNFORMATTED" ]; then
      echo "❌ The following files are not formatted:"
      echo "$UNFORMATTED"
      exit 1
    fi
    
    # Run tests
    echo "  🧪 Running go test..."
    go test ./... || exit 1
  fi
fi

echo "✅ All pre-commit checks passed!"
