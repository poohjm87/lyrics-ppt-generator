@echo off
title Lyrics PPT Generator (Safe Mode)

REM Change to the directory where this batch file is located
cd /d "%~dp0"

echo ============================================
echo    Lyrics PPT Generator (Safe Mode)
echo ============================================
echo This version automatically saves to your Documents folder
echo if write permissions are not available in current directory.
echo ============================================

python --version >nul 2>&1
if errorlevel 1 (
    echo Python is not installed.
    echo Please run setup.bat first.
    pause
    exit /b 1
)

if not exist "source" (
    echo Creating source folder...
    mkdir "source"
    echo Please put text files in source folder.
    pause
    exit /b 1
)

dir source\*.txt >nul 2>&1
if errorlevel 1 (
    echo No text files found in source folder.
    echo Please add text files with format: 01.Title.txt
    pause
    exit /b 1
)

echo Converting files to PPT...
echo Output will be saved to Documents folder if needed...
python lyrics_ppt_generator.py

if errorlevel 1 (
    echo Error occurred during conversion.
    echo Check the error messages above.
) else (
    echo.
    echo ============================================
    echo         Conversion Completed!
    echo ============================================
    echo Check for the generated PPT file.
    echo If not in current folder, check your Documents folder.
)

pause