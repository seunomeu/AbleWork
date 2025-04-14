#!/bin/bash

# Fungsi: Inisialisasi submodule
function init() {
  echo "🔧 Initializing submodules..."
  git submodule update --init --recursive
}

# Fungsi: Update semua submodule
function update() {
  echo "📦 Updating submodules..."
  git submodule foreach git pull origin main
}

# Fungsi: Jalankan frontend
function frontend() {
  echo "🚀 Starting frontend..."
  cd frontend || exit
  npm install
  npm run dev
  cd ..
}

# Fungsi: Jalankan backend
function backend() {
  echo "🚀 Starting backend..."
  cd backend || exit
  npm install
  npm run dev
  cd ..
}

# Fungsi: Jalankan AI server
function ai() {
  echo "🧠 Starting AI server..."
  cd ai || exit
  python -m venv venv
  source venv/bin/activate  # untuk bash/linux/mac
  pip install -r requirements.txt
  python main.py
  cd ..
}

# Fungsi: Jalankan semua dev server
function dev() {
  frontend &
  backend &
  ai
}

# Routing berdasarkan argumen
case "$1" in
  init)
    init
    ;;
  update)
    update
    ;;
  dev)
    dev
    ;;
  frontend)
    frontend
    ;;
  backend)
    backend
    ;;
  ai)
    ai
    ;;
  *)
    echo "❌ Unknown command: $1"
    echo "Usage: ./dev.sh [init|update|dev|frontend|backend|ai]"
    ;;
esac
