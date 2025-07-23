@echo off
chcp 65001 > nul
title 가사 PPT 생성기 - 설치
echo.
echo ==========================================
echo         가사 PPT 생성기 설치
echo ==========================================
echo.

REM Python 설치 확인
echo [1/4] Python 설치 확인 중...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python이 설치되어 있지 않습니다.
    echo.
    echo Python을 먼저 설치해주세요:
    echo 1. https://www.python.org/downloads/ 방문
    echo 2. "Download Python" 버튼 클릭
    echo 3. 설치 시 "Add Python to PATH" 체크 필수!
    echo.
    pause
    exit /b 1
)

for /f "tokens=2" %%i in ('python --version 2^>^&1') do set PYTHON_VERSION=%%i
echo ✅ Python %PYTHON_VERSION% 설치됨

REM 가상환경 생성
echo.
echo [2/4] 가상환경 설정 중...
if exist "venv" (
    echo ⚠️  기존 가상환경이 있습니다. 삭제하고 새로 만들까요? (Y/N)
    set /p choice=
    if /i "%choice%"=="Y" (
        echo 기존 가상환경 삭제 중...
        rmdir /s /q venv
    )
)

if not exist "venv" (
    echo 가상환경 생성 중...
    python -m venv venv
    if %errorlevel% neq 0 (
        echo ❌ 가상환경 생성 실패
        pause
        exit /b 1
    )
)
echo ✅ 가상환경 준비 완료

REM 가상환경 활성화 및 패키지 설치
echo.
echo [3/4] 필요한 패키지 설치 중...
call venv\Scripts\activate.bat
pip install --upgrade pip --quiet
pip install -r requirements.txt --quiet
if %errorlevel% neq 0 (
    echo ❌ 패키지 설치 실패
    pause
    exit /b 1
)
echo ✅ 패키지 설치 완료

REM 샘플 실행
echo.
echo [4/4] 샘플 실행 테스트...
python lyrics_ppt_generator.py > nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ 설치 및 테스트 완료!
) else (
    echo ⚠️  설치는 완료되었지만 테스트에서 경고가 있었습니다.
)

echo.
echo ==========================================
echo           설치 완료!
echo ==========================================
echo.
echo 이제 "실행.bat" 파일을 더블클릭하여 사용하세요!
echo.
echo 사용법:
echo 1. source 폴더에 txt 파일 넣기
echo 2. "실행.bat" 더블클릭
echo 3. PPT 파일 생성 확인
echo.
pause