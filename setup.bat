@echo off
title Python and Lyrics PPT Generator Setup

REM Change to the directory where this batch file is located
cd /d "%~dp0"

echo ============================================
echo    Python and Lyrics PPT Generator
echo            Setup
echo ============================================

net session >nul 2>&1
if errorlevel 1 (
    echo ERROR: Administrator privileges required
    echo Right-click this file and select "Run as administrator"
    pause
    exit /b 1
)

echo [1/4] Checking Python...
python --version >nul 2>&1
if not errorlevel 1 (
    echo Python is already installed
    goto install_packages
)

echo Python not found. Starting download...

echo [2/4] Downloading Python 3.11...
set PYTHON_URL=https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe
set TEMP_DIR=%TEMP%\python_install
set PYTHON_EXE=%TEMP_DIR%\python.exe

if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%"

powershell -Command "Invoke-WebRequest -Uri '%PYTHON_URL%' -OutFile '%PYTHON_EXE%'" >nul 2>&1

if not exist "%PYTHON_EXE%" (
    echo Download failed. Please check internet connection.
    pause
    exit /b 1
)

echo [3/4] Installing Python...
"%PYTHON_EXE%" /quiet InstallAllUsers=1 PrependPath=1 Include_pip=1

timeout /t 10 /nobreak >nul

python --version >nul 2>&1
if errorlevel 1 (
    echo Python installation failed. Please restart and try again.
    pause
    exit /b 1
)

:install_packages
echo [4/4] Installing required packages...
python -m pip install --upgrade pip --quiet
python -m pip install python-pptx==0.6.23 --quiet

if errorlevel 1 (
    echo Package installation failed
    pause
    exit /b 1
)

if not exist "source" mkdir source

echo ============================================
echo         Setup Complete!
echo ============================================
echo.
echo How to use:
echo 1. Put text files in source folder (format: 01.Title.txt)
echo 2. Run start.bat
echo.
echo Test now? (Y/N)
set /p choice=
if /i "%choice%"=="Y" (
    call start.bat
)

pause