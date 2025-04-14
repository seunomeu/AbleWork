.PHONY: init update dev frontend backend ai

# Init: clone & init submodules
init:
	@echo "🔧 Initializing submodules..."
	git submodule update --init --recursive

# Pull latest for each submodule
update:
	@echo "📦 Updating submodules..."
	git submodule foreach git pull origin main

# Run dev server for all
dev: frontend backend ai

frontend:
	@echo "🚀 Starting frontend..."
	cd frontend && npm install && npm run dev

backend:
	@echo "🚀 Starting backend..."
	cd backend && npm install && npm run dev

ai:
	@echo "🧠 Starting AI server..."
	cd ai && python -m venv venv && venv\Scripts\activate && pip install -r requirements.txt && python main.py
