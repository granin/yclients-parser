#!/bin/bash

# Prepare Git Deployment Script
# This script prepares the clean production copy for Git deployment

echo "🚀 Подготовка к развертыванию через Git..."

CLEAN_DIR="../pavel-repo-production"

if [ ! -d "$CLEAN_DIR" ]; then
    echo "❌ Чистая копия не найдена: $CLEAN_DIR"
    exit 1
fi

cd "$CLEAN_DIR"

# Initialize git repository
echo "📦 Инициализация Git репозитория..."
git init

# Create .gitignore if it doesn't exist
if [ ! -f ".gitignore" ]; then
    echo "📋 Создание .gitignore..."
    cat > .gitignore << 'EOF'
# Environment files
.env
.env.local

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
venv/
env/
ENV/

# Logs
logs/
*.log

# Data exports
data/export/*.csv
data/export/*.json

# Browser data
.cache/
browser_cache/

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Playwright
test-results/
playwright-report/
playwright/.cache/
EOF
fi

# Stage all files
echo "📂 Подготовка файлов для commit..."
git add .

# Create initial commit
echo "📝 Создание первого commit..."
git commit -m "🚀 Первый релиз YClients парсера

✅ Особенности:
- 4-шаговая навигация YClients (Service → Court → Date → Prices)  
- Реальные данные без демо-данных
- Автоматическое планирование (каждые 10 минут)
- Интеграция с Supabase
- Поддержка TimeWeb VDS
- Playwright автоматизация браузера

📊 Статистика:
- Поддержка 5 площадок Pavel
- 22 теста (все проходят)
- Русская документация
- Production ready

🔧 Компоненты:
- src/parser/yclients_parser.py - Главный Playwright парсер  
- src/parser/parser_router.py - Система маршрутизации
- lightweight_parser.py - Основная точка входа
- Полная документация на русском языке

🎯 Готов к развертыванию на TimeWeb VDS"

echo "✅ Git репозиторий подготовлен"
echo ""

# Display repository status
echo "📊 Статус репозитория:"
git status --porcelain | wc -l | xargs echo "Файлов в staging area:"
echo ""

# Display file structure
echo "📂 Структура проекта:"
find . -type f -name "*.py" -o -name "*.md" -o -name "*.txt" -o -name "*.sh" | head -20
echo "..."
echo ""

echo "🎯 Следующие шаги:"
echo "1. Создайте репозиторий на GitHub/GitLab"  
echo "2. Добавьте remote: git remote add origin <URL>"
echo "3. Push: git push -u origin main"
echo "4. Deploy на TimeWeb VDS"
echo ""

echo "💡 Команды для развертывания:"
echo "cd $CLEAN_DIR"
echo "git remote add origin <ваш-git-url>"
echo "git branch -M main"
echo "git push -u origin main"
echo ""

echo "🔗 После создания репозитория используйте инструкции в РАЗВЕРТЫВАНИЕ.md"