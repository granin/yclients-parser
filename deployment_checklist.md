# ✅ Deployment Checklist - YClients Parser

**Текущий статус развертывания проекта**

---

## 📊 **Статус Компонентов**

### **✅ Готово**
- ✅ **Код**: Продакшн копия создана и протестирована
- ✅ **Тесты**: 22 теста проходят успешно
- ✅ **Документация**: Полная русская документация создана
- ✅ **Git**: Репозиторий инициализирован с 2 commits
- ✅ **Cleanup**: 97% файлов удалено (4845 → 128)

### **🔄 В Процессе**
- 🔄 **GitHub Push**: Нужны права доступа к https://github.com/server4parcer/parser
- ⏳ **Supabase Setup**: Нужны URL и ключи
- ⏳ **TimeWeb Deploy**: Нужен доступ к VDS

---

## 🎯 **Следующие Шаги**

### **Шаг 1: GitHub Push**
```bash
# Выполните с вашими credentials:
cd /Users/m/git/clients/yclents/pavel-repo-production

# Вариант A: SSH (рекомендуется)
git remote set-url origin git@github.com:server4parcer/parser.git
git push -u origin main

# Вариант B: HTTPS с Personal Access Token
git push -u origin main
```

### **Шаг 2: Supabase Configuration**
**Необходимые данные:**
- `SUPABASE_URL`: https://your-project-id.supabase.co
- `SUPABASE_KEY`: your-anon-public-key

**SQL для выполнения в Supabase:**
```sql
-- Отключение RLS для наших таблиц
ALTER TABLE booking_data DISABLE ROW LEVEL SECURITY;
ALTER TABLE urls DISABLE ROW LEVEL SECURITY;
```

### **Шаг 3: TimeWeb VDS Deployment**
**Необходимые данные:**
- IP адрес VDS
- SSH credentials (user/password или SSH keys)

**Команды для VDS:**
```bash
# На TimeWeb VDS:
ssh root@your-vds-ip

# Установка системы
apt update && apt upgrade -y
apt install -y python3.11 python3.11-pip git

# Клонирование проекта
git clone https://github.com/server4parcer/parser.git
cd parser

# Установка зависимостей
pip3 install -r requirements.txt
playwright install chromium

# Конфигурация
cp .env.template .env
nano .env  # Установить SUPABASE_URL, SUPABASE_KEY, PARSE_URLS

# Инициализация БД
python3 scripts/setup_db.py

# Тестирование
python3 -m pytest tests/test_parser_units.py -v

# Запуск
python3 lightweight_parser.py
```

---

## 📋 **Environment Variables**

### **Production .env Template**
```bash
# API Configuration
API_HOST=0.0.0.0
API_PORT=8000
API_KEY=secure_api_key_16_chars

# YClients URLs (Pavel's venues)
PARSE_URLS=https://n1165596.yclients.com/company/1109937/record-type?o=,https://n1308467.yclients.com/company/1192304/record-type?o=,https://b861100.yclients.com/company/804153/personal/select-time?o=m-1,https://b1009933.yclients.com/company/936902/personal/select-time?o=,https://b918666.yclients.com/company/855029/personal/menu?o=m-1

# Supabase Database
SUPABASE_URL=https://your-project-id.supabase.co
SUPABASE_KEY=your-anon-public-key

# Parsing Settings
PARSE_INTERVAL=600
```

---

## 🔍 **Verification Commands**

### **После GitHub Push**
```bash
# Проверить что код загружен
curl -I https://github.com/server4parcer/parser

# Проверить файлы
curl https://raw.githubusercontent.com/server4parcer/parser/main/README.md
```

### **После Supabase Setup**
```bash
# Тест подключения к БД
python3 -c "
from src.database.db_manager import DatabaseManager
import asyncio

async def test():
    db = DatabaseManager()
    await db.initialize()
    print('✅ Supabase connected')

asyncio.run(test())
"
```

### **После TimeWeb Deployment**
```bash
# Проверить API
curl http://localhost:8000/parser/status

# Проверить парсинг
curl -X POST http://localhost:8000/parser/run

# Проверить данные
curl http://localhost:8000/api/booking-data
```

---

## 🆘 **Troubleshooting**

### **GitHub Push Issues**
- Проверьте права доступа к репозиторию
- Используйте SSH ключи или Personal Access Token
- Убедитесь что вы member/collaborator репозитория

### **Supabase Issues**
- Проверьте URL формат: `https://project-id.supabase.co`
- Используйте anon public key (не service_role key)
- Выполните SQL для отключения RLS

### **TimeWeb Issues**
- Проверьте SSH доступ к VDS
- Убедитесь что Python 3.11+ установлен
- Проверьте что порт 8000 открыт

---

## ✅ **Final Success Criteria**

- [ ] Code pushed to GitHub
- [ ] Supabase database connected  
- [ ] TimeWeb VDS system running
- [ ] API endpoints responding
- [ ] Parsing extracting real data
- [ ] No demo data in results
- [ ] Background scheduler active

**🎯 Ready to complete deployment as soon as credentials are provided!**