# 가사 PPT 생성기 (Lyrics PPT Generator)

한국어 가사 텍스트 파일들을 읽어서 PowerPoint 프레젠테이션으로 변환하는 Python 프로그램입니다.

## 기능

- `source/` 디렉토리의 txt 파일들을 자동으로 읽어 가사 PPT 생성
- 각 노래마다 제목 슬라이드 생성
- 가사를 2줄씩 슬라이드에 배치
- 노래와 노래 사이에 빈 페이지 삽입
- 템플릿 파일(`template.pptx`) 지원
- 슬라이드 마스터를 통한 디자인 변경 가능
- `YYYYMMDD_가사집.pptx` 형식으로 자동 저장

## 설치 방법

```bash
# 저장소 클론
git clone https://github.com/poohjm87/lyrics-ppt-generator.git
cd lyrics-ppt-generator

# 가상환경 생성 및 활성화
python3 -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 의존성 설치
pip install -r requirements.txt
```

## 사용 방법

### 1. 가사 파일 준비
`source/` 디렉토리에 가사 파일들을 배치합니다.
- 파일명 형식: `{순서}.{노래제목}.txt`
- 예: `01.이 밤 그날의 반딧불을.txt`
- UTF-8 인코딩 사용

### 2. 템플릿 파일 (선택사항)
`source/template.pptx` 파일을 배치하면 해당 템플릿을 기반으로 PPT가 생성됩니다.
- 템플릿이 없으면 기본 PowerPoint 템플릿 사용
- 슬라이드 마스터 디자인이 자동으로 적용됨

### 3. 프로그램 실행
```bash
python lyrics_ppt_generator.py
```

### 4. 결과 확인
- `YYYYMMDD_가사집.pptx` 파일이 생성됩니다
- PowerPoint에서 슬라이드 마스터를 통해 디자인 변경 가능

## 프로젝트 구조

```
lyrics-ppt-generator/
├── source/                    # 가사 파일 디렉토리
│   ├── 01.노래제목.txt
│   ├── 02.노래제목.txt
│   └── template.pptx          # 템플릿 파일 (선택사항)
├── lyrics_ppt_generator.py    # 메인 프로그램
├── requirements.txt           # Python 의존성
├── CLAUDE.md                  # Claude Code 작업 가이드
└── README.md
```

## 요구사항

- Python 3.7+
- python-pptx 라이브러리

## 라이선스

MIT License

## 기여

이슈나 풀 리퀘스트는 언제든 환영합니다!