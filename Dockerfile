FROM python:3.11-slim

# 시스템 패키지 업데이트 & Playwright 설치
RUN apt-get update && apt-get install -y \
    libnss3 libatk-bridge2.0-0 libgtk-3-0 libxss1 libasound2 \
    fonts-nanum fonts-noto-cjk \
    && fc-cache -fv \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리
WORKDIR /app

# 의존성 복사 및 설치
COPY ./app/requirements.txt ./
RUN pip install --upgrade pip && pip install -r requirements.txt

# Playwright Browser 설치
RUN playwright install --with-deps

# 코드 복사
COPY ./app /app

# 실행 명령어
CMD ["python", "main.py"]
