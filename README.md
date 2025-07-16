# ChatboongProxy

**ChatboongProxy**는 Google Gemini API (`https://generativelanguage.googleapis.com`)에 대한 보안 강화된 Node.js 리버스 프록시 서버입니다. 토큰 기반 인증 시스템을 제공하며, EU/영국 서버에서만 실행되도록 지리적 제한을 두고 있습니다.

## 주요 기능

- **리버스 프록시**: Google Gemini API에 대한 안전한 프록시 서버
- **Cloudflare Turnstile 인증**: 봇 방지 및 스팸 차단
- **토큰 기반 인증**: 발급된 토큰을 통한 API 접근 제어
- **지리적 제한**: EU/영국 서버에서만 실행 가능

## 시스템 요구사항

- **운영 체제**: Ubuntu, AlmaLinux, Rocky Linux, Oracle Linux
- **Node.js**: 22.x 이상
- **서버 위치**: EU 국가 또는 영국
