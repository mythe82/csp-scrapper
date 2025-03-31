# ☁️ Cloud CSP Scrapper

AWS, Azure, GCP의 **주간 업데이트 뉴스레터**를 자동으로 크롤링, 요약, 번역하여 메일로 보내주는 자동화 도구입니다.

---

## 📄 주요 기능

✅ Azure, AWS, GCP 주간 업데이트 수집  
✅ 영어 요약 → 한국어 번역  
✅ HTML 뉴스레터 이메일 발송  
✅ Docker 기반 배포  
✅ 주간 자동 실행 지원 (Crontab)

---

## 🚀 설치 및 실행
### 1. 클론
```bash
git clone https://github.com/mooa-lee/csp-scrapper.git
cd csp-scrapper
```

📄 .gitignore
기본적으로 민감 정보와 불필요한 데이터는 Git에 제외됩니다.
```bash
/app/output/
*.env
*.pyc
__pycache__/
*.log
```

### 2. 환경변수 설정
```bash
cp app/.env.example app/.env
vi app/.env
```

⚙️ .env 환경 변수 예시
```bash
SMTP_SERVER=smtp.gmail.com
SMTP_PORT=587
SENDER=youremail@gmail.com
EMAIL_PASSWORD=yourpassword
RECEIVERS=email1@example.com,email2@example.com
```

SMTP, 이메일 수신자 등 정보를 .env에 입력

### 3. Docker 빌드 & 실행
```bash
docker build -t csp-scrapper .
docker run --rm --env-file ./app/.env -v $(pwd)/app/output:/app/output csp-scrapper
```
### (선택) Docker Compose 사용
```bash
docker-compose up --build
```

### 4. 실행 방법
📌 빌드 + 실행

최초 1회:
```bash
docker-compose up --build
```
📌 실행만 (이미 build 되어있다면)
```bash
docker-compose up
```
📌 백그라운드 실행 (권장)
```bash
docker-compose up -d
```
📌 중지
```bash
docker-compose down
```

🕒 서버에서 주간 자동 실행

리눅스 서버에서 크론탭 설정
```bash
crontab -e

0 9 * * MON cd /home/ubuntu/csp-scrapper && docker run --rm --env-file ./app/.env -v $(pwd)/app/output:/app/output csp-scrapper
```

📥 Output

모든 크롤링 데이터는 /app/output/ 폴더에 주간별로 저장됩니다.

예시: app/output/cloud_updates_week_2025-03-30.json

🛠️ 필요 환경

    Python 3.11+

    Docker

    Playwright

    SMTP 계정
