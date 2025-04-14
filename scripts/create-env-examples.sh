#!/bin/bash

echo "📄 Creating .env.example files..."

# Frontend
cat <<EOF > frontend/.env.example
# Frontend Environment Variables

VITE_API_URL=http://localhost:8080
VITE_AI_API_URL=http://localhost:5000
EOF

# Backend
cat <<EOF > backend/.env.example
# Backend Environment Variables

MONGO_URI=your_mongodb_connection_string
JWT_SECRET=your_jwt_secret
HUGGINGFACE_API_KEY=your_huggingface_api_key_here
PORT=8080
AI_API=https://ablework-ai-production.up.railway.app/
EOF

# AI Server
cat <<EOF > ai/.env.example
# AI Server Environment Variables

HF_API_KEY=your_huggingface_api_key_here
EOF

echo "✅ .env.example files created successfully!"
