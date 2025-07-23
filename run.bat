@echo off
chcp 65001 > nul
echo === 가사 PPT 생성기 ===
echo.

REM 가상환경 활성화 확인
if exist "venv\Scripts\activate.bat" (
    echo 가상환경 활성화 중...
    call venv\Scripts\activate.bat
) else (
    echo 가상환경을 먼저 설정해주세요:
    echo python -m venv venv
    echo venv\Scripts\activate
    echo pip install -r requirements.txt
    pause
    exit /b 1
)

REM Python 스크립트 실행
python lyrics_ppt_generator.py

REM 가상환경 비활성화
deactivate