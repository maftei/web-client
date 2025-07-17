#!/bin/bash

echo "Scaffolding web-client structure..."

# Create folders
mkdir -p public src/{assets,components,pages}

# Create .env
cat <<EOF > .env
# VITE environment variables go here
VITE_API_URL=http://localhost:3000
EOF

# Create .gitignore
cat <<EOF > .gitignore
node_modules
dist
.env
.DS_Store
EOF

# Create App.jsx
cat <<EOF > src/App.jsx
import React from 'react';

function App() {
  return (
    <div>
      <h1>Hello from DevOps2025 Web Client</h1>
    </div>
  );
}

export default App;
EOF

# Create index.html
cat <<EOF > public/index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>DevOps2025 Web Client</title>
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/App.jsx"></script>
  </body>
</html>
EOF

# Create package.json
cat <<EOF > package.json
{
  "name": "web-client",
  "version": "1.0.0",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  },
  "devDependencies": {
    "vite": "^4.0.0"
  }
}
EOF

# Create vite.config.js
cat <<EOF > vite.config.js
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 5173
  }
})
EOF

# Create docker-compose.yml
cat <<EOF > docker-compose.yml
version: '3.8'
services:
  web-client:
    build: .
    ports:
      - "3000:80"
    restart: unless-stopped
EOF

echo "✅ Done scaffolding. Now run:"
echo "  npm install"
echo "  npm run dev"

