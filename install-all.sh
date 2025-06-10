#!/bin/bash

echo "📦 Installing all dependencies..."
npm install || exit 1
cd server && npm install || exit 1
cd ..

echo "🚀 Starting dev servers..."
npx concurrently "npm run dev" "cd server && npm start"
