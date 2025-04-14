#!/bin/bash

echo "📦 Updating all submodules..."
git submodule update --init --recursive

echo "🔄 Pulling latest commits from submodules..."
git submodule foreach git pull origin main

echo "✅ All submodules are up to date."
