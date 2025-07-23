# 가사 PPT 생성기 (Lyrics PPT Generator)

텍스트 파일을 읽어서 PowerPoint 프레젠테이션으로 자동 변환하는 Python 프로그램입니다. 
가사, 시, 연설문 등 다양한 텍스트 콘텐츠를 슬라이드로 만들 수 있습니다.

## ✨ 주요 기능

- 📁 **자동 파일 처리**: `source/` 디렉토리의 모든 txt 파일을 자동으로 읽어 PPT 생성
- 📄 **스마트 슬라이드 구성**: 각 텍스트 파일마다 제목 슬라이드 + 내용을 2줄씩 배치
- 🎨 **템플릿 지원**: `template.pptx` 파일로 디자인 커스터마이징 가능
- 🖌️ **슬라이드 마스터 호환**: PowerPoint에서 폰트, 색상, 배경 등 자유롭게 변경
- 📅 **자동 파일명**: `YYYYMMDD_가사집.pptx` 형식으로 날짜별 관리
- 🔄 **구분 슬라이드**: 섹션 간 빈 페이지로 명확한 구분

## 🚀 빠른 시작

### Windows 사용자 (초보자용)
1. **"Code" → "Download ZIP"**으로 다운로드
2. **`install.bat`** 더블클릭하여 자동 설치
3. **`실행.bat`** 더블클릭하여 실행

👉 **[Windows 상세 가이드](Windows_사용법.md)** 보기

### 개발자/고급 사용자
```bash
# 저장소 클론
git clone https://github.com/poohjm87/lyrics-ppt-generator.git
cd lyrics-ppt-generator

# 가상환경 생성 및 활성화
python3 -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate

# 의존성 설치
pip install -r requirements.txt

# 실행
python lyrics_ppt_generator.py
```

## 📝 사용 방법

### 텍스트 파일 준비
`source/` 디렉토리에 텍스트 파일들을 배치합니다:

```
source/
├── 01.First Content.txt
├── 02.Second Content.txt
├── 03.Third Content.txt
└── template.pptx (선택사항)
```

**파일명 규칙:**
- `{순서}.{제목}.txt` 형식 사용
- UTF-8 인코딩으로 저장
- 한글 파일명 지원

### 템플릿 사용하기 (선택사항)
`source/template.pptx`에 원하는 PowerPoint 템플릿을 넣으면:
- 해당 템플릿의 디자인으로 PPT 생성
- 슬라이드 마스터 설정이 자동 적용
- 템플릿이 없으면 기본 디자인 사용

### 결과물
- `YYYYMMDD_가사집.pptx` 파일 생성
- PowerPoint에서 열어 슬라이드 마스터로 추가 꾸미기 가능

## 📁 프로젝트 구조

```
lyrics-ppt-generator/
├── source/                    # 텍스트 파일 디렉토리
│   ├── 01.Sample Song.txt     # 샘플 파일 1
│   ├── 02.Demo Content.txt    # 샘플 파일 2
│   └── template.pptx          # 템플릿 파일 (선택사항)
├── lyrics_ppt_generator.py    # 메인 프로그램
├── requirements.txt           # Python 의존성
└── README.md                  # 사용 설명서
```

## 🛠️ 활용 예시

### 가사집 만들기
```
source/01.Amazing Grace.txt
source/02.How Great Thou Art.txt
source/template.pptx  # 교회 디자인 템플릿
```

### 시집 제작
```
source/01.봄날.txt
source/02.여름밤.txt
source/03.가을 편지.txt
```

### 프레젠테이션 자료
```
source/01.회사 소개.txt
source/02.제품 설명.txt
source/template.pptx  # 회사 브랜딩 템플릿
```

## ⚙️ 기술 요구사항

- **Python**: 3.7 이상
- **라이브러리**: python-pptx
- **운영체제**: Windows, macOS, Linux

## 🤝 기여하기

프로젝트 개선에 참여해주세요!

1. Fork 후 새 브랜치 생성
2. 기능 추가 또는 버그 수정
3. Pull Request 제출

### 개선 아이디어
- [ ] 다양한 슬라이드 레이아웃 지원
- [ ] 이미지 삽입 기능
- [ ] PDF 출력 옵션
- [ ] 웹 인터페이스 추가

## 📄 라이선스

MIT License - 자유롭게 사용, 수정, 배포 가능합니다.

---

💡 **문의사항이나 버그 리포트는 [Issues](https://github.com/poohjm87/lyrics-ppt-generator/issues)에 남겨주세요!**