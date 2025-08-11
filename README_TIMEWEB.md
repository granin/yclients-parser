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
