#!/bin/bash

# ==================================================================================
# Node.js, PM2 및 Chatboongproxy 자동 설정 스크립트
# 이 스크립트는 Debian/Ubuntu 기반 시스템에서 다음을 수행합니다:
# 1. Node.js 22.x 및 npm 설치
# 2. PM2 (프로세스 관리자) 설치
# 3. Chatboongproxy 리포지토리 복제
# 4. 인증서 생성 스크립트 실행
# ==================================================================================

# 스크립트 실행 중 오류가 발생하면 즉시 중단합니다.
set -e

echo "전체 자동 설정을 시작합니다..."
echo "========================================="

# --- 1. 필수 패키지 설치 (curl, git) ---
echo "[1/6] 필수 패키지(curl, git)를 확인하고 설치합니다..."
sudo apt-get update
# curl 설치 확인
if ! command -v curl &> /dev/null; then
    echo "'curl'이 설치되어 있지 않습니다. 지금 설치합니다..."
    sudo apt-get install -y curl
else
    echo "'curl'이 이미 설치되어 있습니다."
fi
# git 설치 확인
if ! command -v git &> /dev/null; then
    echo "'git'이 설치되어 있지 않습니다. 지금 설치합니다..."
    sudo apt-get install -y git
else
    echo "'git'이 이미 설치되어 있습니다."
fi

# --- 2. Node.js 및 npm 설치 ---
echo "[2/6] NodeSource 저장소를 추가하고 Node.js 22.x를 설치합니다..."
curl -fsSL https://deb.nodesource.com/setup_22.x -o nodesource_setup.sh
sudo -E bash nodesource_setup.sh
rm nodesource_setup.sh # 다운로드한 설정 스크립트 파일은 삭제합니다.
sudo apt-get install -y nodejs
echo "Node.js와 npm이 성공적으로 설치되었습니다."
node -v
npm -v

# --- 3. PM2 설치 ---
echo "[3/6] Node.js 프로세스 관리자인 PM2를 전역으로 설치합니다..."
sudo npm install pm2 -g
echo "PM2가 성공적으로 설치되었습니다."

# --- 4. GitHub 리포지토리 복제 ---
REPO_DIR="Chatboongproxy"
if [ -d "$REPO_DIR" ]; then
    echo "[4/6] '$REPO_DIR' 디렉토리가 이미 존재합니다. 복제를 건너뜁니다."
else
    echo "[4/6] 'Chatboongproxy' 리포지토리를 복제합니다..."
    git clone https://github.com/Hakjeong/Chatboongproxy
fi

# --- 5. 리포지토리 디렉토리로 이동 ---
echo "[5/6] '$REPO_DIR' 디렉토리로 이동합니다..."
cd $REPO_DIR

# --- 6. 인증서 생성 스크립트 실행 ---
CERT_SCRIPT="generate-cert.sh"
if [ -f "$CERT_SCRIPT" ]; then
    echo "[6/6] '$CERT_SCRIPT' 스크립트를 실행합니다..."
    chmod +x $CERT_SCRIPT # 스크립트에 실행 권한을 부여합니다.
    sudo ./$CERT_SCRIPT   # 스크립트를 실행합니다.
else
    echo "[6/6] 오류: '$CERT_SCRIPT' 스크립트를 찾을 수 없습니다!"
    exit 1
fi

echo "========================================="
echo "모든 설정 과정이 성공적으로 완료되었습니다."
echo "현재 위치: $(pwd)"

cd Chatboongproxy
