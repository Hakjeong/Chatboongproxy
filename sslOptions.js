// Self-signed certificate for local development
// In production, use a valid certificate from a CA
const fs = require('fs');
const path = require('path');

module.exports = {
    key: fs.readFileSync(path.join(__dirname, 'cert.key')),
    cert: fs.readFileSync(path.join(__dirname, 'cert.crt')),
};
