#!/bin/bash

# Deploy YClients Parser to GitHub Repository
echo "🚀 Развертывание YClients парсера в GitHub..."

CLEAN_DIR="../pavel-repo-production"
GITHUB_REPO="https://github.com/server4parcer/parser.git"

if [ ! -d "$CLEAN_DIR" ]; then
    echo "❌ Продакшн копия не найдена: $CLEAN_DIR"
    exit 1
fi

cd "$CLEAN_DIR"

echo "📦 Настройка Git remote..."
# Remove existing remote if exists
git remote remove origin 2>/dev/null || true

# Add GitHub repository
git remote add origin "$GITHUB_REPO"

echo "🌿 Создание main branch..."
git branch -M main

echo "🔍 Проверка статуса репозитория..."
echo "Current branch: $(git branch --show-current)"
echo "Remote URL: $(git remote get-url origin)"
echo "Files to push: $(git status --porcelain | wc -l)"

echo ""
echo "📋 Commits готовые к push:"
git log --oneline -5

echo ""
echo "🚀 Готов к push в GitHub!"
echo ""
echo "⚠️  ВАЖНО: Убедитесь что у вас есть доступ к репозиторию https://github.com/server4parcer/parser"
echo ""
echo "Команды для завершения push:"
echo "cd $CLEAN_DIR"
echo "git push -u origin main"
echo ""

# Check if we can push (this will show auth prompt if needed)
echo "🔐 Проверка авторизации GitHub..."
if git ls-remote origin &>/dev/null; then
    echo "✅ Доступ к GitHub репозиторию подтвержден"
    
    echo "🚀 Выполняем push..."
    git push -u origin main
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "🎉 УСПЕХ! Код успешно загружен в GitHub"
        echo "📍 Репозиторий: https://github.com/server4parcer/parser"
        echo ""
        echo "🔗 Следующие шаги:"
        echo "1. ✅ GitHub репозиторий готов"
        echo "2. 🎯 Настроить Supabase credentials"
        echo "3. 🚀 Deploy на TimeWeb VDS"
    else
        echo "❌ Ошибка при push в GitHub"
        exit 1
    fi
else
    echo "❌ Нет доступа к GitHub репозиторию"
    echo "🔑 Необходимо авторизоваться:"
    echo "   - Настроить SSH ключи"
    echo "   - Или использовать Personal Access Token"
    echo ""
    echo "После авторизации выполните:"
    echo "cd $CLEAN_DIR"
    echo "git push -u origin main"
fi