// Chatboongproxy 환경설정

module.exports = {
    USE_TURNSTILE: false, // Turnstile 사용 여부 (true/false)
    TURNSTILE_SITE_KEY: 'PUT YOUR TURNSTILE SITE KEY HERE',
    TURNSTILE_SECRET_KEY: 'PUT YOUR TURNSTILE SECRET KEY HERE',
    TURNSTILE_VERIFY_URL: 'https://challenges.cloudflare.com/turnstile/v0/siteverify',
    PROXY_TARGET: 'https://generativelanguage.googleapis.com',
    ALLOWED_HOST: 'localhost',
    ALLOWED_REFERER: 'localhost',
    HTTP_PORT: 80,
    HTTPS_PORT: 443,
    PAGE_PASSWORD: 'your_password_here' // 토큰 발급 비밀번호
};
