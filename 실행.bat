@echo off
chcp 65001 > nul
title 가사 PPT 생성기
color 0a
echo.
echo ==========================================
echo         🎵 가사 PPT 생성기 🎵
echo ==========================================
echo.

REM 가상환경 확인
if not exist "venv\Scripts\activate.bat" (
    echo ❌ 설치가 필요합니다!
    echo.
    echo "install.bat" 파일을 먼저 실행해주세요.
    echo.
    pause
    exit /b 1
)

REM source 폴더 확인
if not exist "source" (
    echo source 폴더를 생성합니다...
    mkdir source
)

REM txt 파일 확인
set txt_count=0
for %%f in (source\*.txt) do set /a txt_count+=1

if %txt_count%==0 (
    echo ⚠️  source 폴더에 txt 파일이 없습니다!
    echo.
    echo 다음 단계를 따라해주세요:
    echo 1. source 폴더를 열기
    echo 2. 가사나 텍스트 파일을 넣기 (예: 01.노래제목.txt)
    echo 3. 다시 이 프로그램 실행
    echo.
    echo source 폴더를 열까요? (Y/N)
    set /p choice=
    if /i "%choice%"=="Y" (
        start explorer source
    )
    pause
    exit /b 0
)

echo 📁 %txt_count%개의 텍스트 파일을 발견했습니다.
echo.

REM 가상환경 활성화 후 실행
echo 🚀 PPT 생성을 시작합니다...
echo.
call venv\Scripts\activate.bat
python lyrics_ppt_generator.py

REM 결과 파일 확인
echo.
for %%f in (*_가사집.pptx) do (
    echo ✅ PPT 파일이 생성되었습니다: %%f
    echo.
    echo 파일을 열어볼까요? (Y/N)
    set /p choice=
    if /i "!choice!"=="Y" (
        start "" "%%f"
    )
    goto :found
)

echo ⚠️  PPT 파일을 찾을 수 없습니다.
echo 오류가 발생했을 수 있습니다.

:found
echo.
echo 감사합니다! 🎉
pause