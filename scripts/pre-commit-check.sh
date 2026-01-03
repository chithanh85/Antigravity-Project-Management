#!/bin/bash
# Universal pre-commit check & auto-fix script
# Auto-detects project type, runs fixers, and re-stages modified files.

set -e

echo "🔍 Running pre-commit checks & auto-fix..."

# Function to re-stage modified files
re_stage_files() {
  local files="$1"
  if [ -n "$files" ]; then
    git add $files
  fi
}

# Markdown linting & fixing
STAGED_MD=$(git diff --cached --name-only --diff-filter=ACM | grep '\.md$' || true)
if [ -n "$STAGED_MD" ]; then
  echo "📝 Fixing markdown files..."
  npx markdownlint-cli --fix $STAGED_MD || true
  re_stage_files "$STAGED_MD"
fi

# Node.js/TypeScript checks & fixing
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
  
  # Run format/fix if script exists
  if grep -q '"format"' package.json; then
    echo "  💅 Auto-formatting..."
    $PKG_MGR run format || exit 1
    # We don't know exactly which files were modified, so we stage all tracked changes
    git add -u
  fi

  # Run lint if script exists
  if grep -q '"lint-all":' package.json; then
    echo "  🔧 Running lint-all..."
    $PKG_MGR run lint-all || exit 1
  elif grep -q '"lint":' package.json; then
    echo "  🔧 Running lint..."
    $PKG_MGR run lint || exit 1
  fi
  
  # Run tests if script exists (skip if CI-only)
  if grep -q '"test"' package.json && ! grep -q '"test".*"echo' package.json; then
    echo "  🧪 Running tests..."
    $PKG_MGR test || exit 1
  fi

  # Security audit & auto-fix
  echo "  🔒 Running Node.js security audit & auto-fix..."
  $PKG_MGR audit fix --audit-level=moderate || $PKG_MGR audit --audit-level=moderate || true
  # Stage changes from audit fix (package.json, lock file)
  git add package.json *-lock.json 2>/dev/null || true

  # Snyk check (if installed)
  if command -v snyk &> /dev/null; then
    echo "  🔒 Running Snyk security scan..."
    snyk test || echo "  ⚠️ Snyk scan failed (maybe missing API token), continuing..."
  fi

  # Security linting
  if grep -q '"lint:security"' package.json; then
    echo "  🔒 Running security linting..."
    $PKG_MGR run lint:security || exit 1
    # Stage changes from eslint fix
    git add -u
  fi
fi

# Python checks & fixing
if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
  STAGED_PY=$(git diff --cached --name-only --diff-filter=ACM | grep '\.py$' || true)
  
  if [ -n "$STAGED_PY" ]; then
    echo "🐍 Detected Python project"
    
    # Check if black is available for auto-formatting
    if command -v black &> /dev/null; then
      echo "  💅 Auto-formatting with black..."
      black $STAGED_PY || exit 1
      re_stage_files "$STAGED_PY"
    fi

    # Check if isort is available
    if command -v isort &> /dev/null; then
      echo "  🔧 Sorting imports with isort..."
      isort $STAGED_PY || exit 1
      re_stage_files "$STAGED_PY"
    fi
    
    # Check if pylint is available
    if command -v pylint &> /dev/null; then
      echo "  🔧 Running pylint..."
      pylint $STAGED_PY || exit 1
    fi
    
    # Run pytest if available
    if command -v pytest &> /dev/null; then
      echo "  🧪 Running pytest..."
      pytest || exit 1
    fi

    # Security checks
    echo "  🔒 Running Python security checks..."
    if command -v bandit &> /dev/null; then
      bandit -r . -x ./node_modules,./.agent,./.antigravity || exit 1
    fi

    if [ -f "requirements.txt" ]; then
      if command -v safety &> /dev/null; then
        safety check || echo "  ⚠️ Safety check failed, continuing..."
      fi
      if command -v pip-audit &> /dev/null; then
        echo "  🔒 Running pip-audit & auto-fix..."
        pip-audit --fix || pip-audit || exit 1
        re_stage_files "requirements.txt"
      fi
    fi
  fi
fi

# Go checks & fixing
if [ -f "go.mod" ]; then
  STAGED_GO=$(git diff --cached --name-only --diff-filter=ACM | grep '\.go$' || true)
  
  if [ -n "$STAGED_GO" ]; then
    echo "🔵 Detected Go project"
    
    # Run gofmt to fix formatting
    echo "  💅 Auto-formatting with gofmt..."
    gofmt -w $STAGED_GO
    re_stage_files "$STAGED_GO"

    # Run golangci-lint if available
    if command -v golangci-lint &> /dev/null; then
      echo "  🔧 Running golangci-lint..."
      golangci-lint run ./... || exit 1
    fi
    
    # Run tests
    echo "  🧪 Running go test..."
    go test ./... || exit 1

    # Security checks
    echo "  🔒 Running Go security checks..."
    if command -v gosec &> /dev/null; then
      gosec ./... || exit 1
    fi
    if command -v govulncheck &> /dev/null; then
      govulncheck ./... || exit 1
    fi
  fi
fi

echo "✅ All checks passed & auto-fixes applied!"
