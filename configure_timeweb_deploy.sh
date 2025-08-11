#!/bin/bash

# Configure TimeWeb deployment with real credentials
echo "🚀 Настройка развертывания для TimeWeb Cloud Apps..."

CLEAN_DIR="../pavel-repo-production"
GITHUB_REPO="https://github.com/server4parcer/parser.git"

if [ ! -d "$CLEAN_DIR" ]; then
    echo "❌ Продакшн копия не найдена: $CLEAN_DIR"
    exit 1
fi

cd "$CLEAN_DIR"

echo "🔧 Создание .env для TimeWeb..."
cat > .env.timeweb << 'EOF'
# TimeWeb Cloud Apps Environment Configuration
# Эти переменные нужно добавить в TimeWeb панели управления

API_HOST=0.0.0.0
API_PORT=8000
API_KEY=timeweb_secure_parser_key_2025

# Supabase Database (REAL CREDENTIALS)
SUPABASE_URL=https://axedyenlcdfrjhwfcokj.supabase.co
SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF4ZWR5ZW5sY2RmcmpoZmNva2oiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTcxNzczMjU3NSwiZXhwIjoyMDMzMzA4NTc1fQ.xQrNXHJt5N3DgQzN8rOGP3qOz1c-LL-7dV7ZgAQe3d0

# Parse URLs (Pavel's venue)
PARSE_URLS=https://n1165596.yclients.com/company/1109937/record-type?o=

# Parsing Settings
PARSE_INTERVAL=600
EOF

echo "🔧 Оптимизация Dockerfile для TimeWeb..."
cat > Dockerfile << 'EOF'
# TimeWeb Cloud Apps optimized Dockerfile
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies for Playwright
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libdrm2 \
    libgtk-3-0 \
    libgbm1 \
    libnss3 \
    libxss1 \
    libxtst6 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Install Playwright browsers
RUN playwright install chromium && \
    playwright install-deps chromium

# Copy application code
COPY . .

# Create necessary directories
RUN mkdir -p logs data/export

# Expose port 8000 for TimeWeb
EXPOSE 8000

# Health check for TimeWeb
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:8000/health || exit 1

# Start application
CMD ["python", "lightweight_parser.py"]
EOF

echo "📋 Создание README для TimeWeb развертывания..."
cat > README_TIMEWEB.md << 'EOF'
# YClients Parser - TimeWeb Cloud Apps Deployment

## 🚀 Quick Deploy на TimeWeb

### 1. Настройка переменных в TimeWeb панели:

```bash
API_HOST=0.0.0.0
API_PORT=8000
API_KEY=timeweb_secure_parser_key_2025
SUPABASE_URL=https://axedyenlcdfrjhwfcokj.supabase.co
SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF4ZWR5ZW5sY2RmcmpoZmNva2oiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTcxNzczMjU3NSwiZXhwIjoyMDMzMzA4NTc1fQ.xQrNXHJt5N3DgQzN8rOGP3qOz1c-LL-7dV7ZgAQe3d0
PARSE_URLS=https://n1165596.yclients.com/company/1109937/record-type?o=
PARSE_INTERVAL=600
```

### 2. GitHub Integration

- Repository: https://github.com/server4parcer/parser
- Branch: main
- Auto-deploy: Enabled

### 3. Проверка после развертывания

```bash
# Health check
curl https://your-app.timeweb.cloud/health

# Parser status  
curl https://your-app.timeweb.cloud/parser/status

# Trigger manual parsing
curl -X POST https://your-app.timeweb.cloud/parser/run
```

### 4. Особенности TimeWeb Cloud Apps

- ✅ Автоматическое развертывание из GitHub
- ✅ Встроенное масштабирование
- ✅ SSL сертификаты
- ✅ Мониторинг и логи
- ⚠️  Только порт 8000
- ⚠️  Нет Docker Compose поддержки
- ⚠️  Переменные только через веб-панель

## 📊 Expected Results

После развертывания система будет:
- ✅ Парсить YClients каждые 10 минут
- ✅ Сохранять данные в Supabase
- ✅ Предоставлять REST API на порту 8000
- ✅ Работать без demo данных
- ✅ Использовать 4-шаговую навигацию Playwright
EOF

# Add files to git
git add .env.timeweb Dockerfile README_TIMEWEB.md

# Commit TimeWeb configuration
git commit -m "⚙️ TimeWeb Cloud Apps configuration

✅ Добавлено:
- .env.timeweb с реальными credentials
- Оптимизированный Dockerfile для TimeWeb
- README_TIMEWEB.md с инструкциями

🔧 Готово к развертыванию:
- Supabase: https://axedyenlcdfrjhwfcokj.supabase.co
- GitHub: https://github.com/server4parcer/parser  
- TimeWeb: Auto-deploy ready

🎯 После push система автоматически развернется на TimeWeb"

echo ""
echo "✅ TimeWeb конфигурация готова!"
echo ""
echo "📋 Файлы созданы:"
echo "  - .env.timeweb (переменные для TimeWeb панели)"
echo "  - Dockerfile (оптимизирован для TimeWeb)"
echo "  - README_TIMEWEB.md (инструкции развертывания)"
echo ""
echo "🚀 Готово к push в GitHub:"
echo "   git push origin main"
echo ""
echo "🎯 TimeWeb автоматически подхватит изменения и развернет систему!"