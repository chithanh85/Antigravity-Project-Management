@echo off
SETLOCAL EnableDelayedExpansion

echo.
echo  ================================================
echo   🚀 Antigravity PM - One-Click Setup (Windows)
echo  ================================================
echo.

:: Check for Node.js
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo  ❌ Error: Node.js is not installed. Please install it from https://nodejs.org/
    pause
    exit /b 1
)

echo  📦 Installing dependencies...
call npm install

if %ERRORLEVEL% neq 0 (
    echo  ❌ Error: npm install failed.
    pause
    exit /b 1
)

echo.
echo  🔧 Initializing APM Ecosystem...
call npm run apm-init

if %ERRORLEVEL% neq 0 (
    echo  ❌ Error: APM initialization failed.
    pause
    exit /b 1
)

echo.
echo  ================================================
echo   ✅ Setup Complete!
echo   Docs: docs/knowledge.md
echo   Instruction: INSTRUCTION.md
echo  ================================================
echo.
pause
