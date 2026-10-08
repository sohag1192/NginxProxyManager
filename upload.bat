@echo off
setlocal enableextensions enabledelayedexpansion

echo ========================================
echo   🚀 Auto Uploading Changes to GitHub
echo ========================================

:: Stage all changes
git add .

:: Set commit message (parameter or default)
set "COMMIT_MSG=%~1"
if "%COMMIT_MSG%"=="" (
    set "COMMIT_MSG=Update Nginx Proxy Manager setup, scripts, and documentation"
)

echo.
echo 📌 Staged changes. Committing with message:
echo    "%COMMIT_MSG%"
echo.

git commit -m "%COMMIT_MSG%"

echo.
echo 📤 Pushing changes to remote main branch...
git push origin main

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo   ✅ Upload Completed Successfully!
    echo ========================================
) else (
    echo.
    echo ========================================
    echo   ❌ Upload Failed! Check git authentication.
    echo ========================================
)
