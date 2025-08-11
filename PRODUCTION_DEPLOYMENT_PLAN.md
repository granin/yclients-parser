# План Подготовки к Продакшну и Развертыванию на TimeWeb

**Полный план создания чистой продакшн версии для русскоязычного разработчика**

---

## 🎯 **Цель**

Создать чистую продакшн версию YClients парсера для развертывания на TimeWeb с русской документацией, без следов разработки AI.

---

## 📋 **Фазы Работы**

### **Фаза 1: Анализ и Очистка**
1. **Определить essential файлы** для продакшна
2. **Удалить AI development артефакты** (ai-docs/, specs/, английские .md)
3. **Очистить test файлы** - оставить только необходимые
4. **Убрать старые backup файлы** (.backup, .bak, etc.)

### **Фаза 2: Русская Документация**
1. **Создать РАЗВЕРТЫВАНИЕ.md** - русская версия deployment guide
2. **Создать README.md на русском** - основная документация проекта
3. **Создать НАСТРОЙКА_СРЕДЫ.md** - инструкции по environment setup
4. **Создать ТЕХПОДДЕРЖКА.md** - troubleshooting на русском

### **Фаза 3: Тестирование Чистой Копии**
1. **Создать отдельную директорию** для чистой копии
2. **Скопировать только essential файлы**
3. **Протестировать что всё работает** в чистой среде
4. **Проверить imports и dependencies**

### **Фаза 4: Подготовка к Git Deploy**
1. **Настроить .gitignore** правильно
2. **Убедиться что секреты не попадут в репо**
3. **Подготовить environment template**
4. **Создать deployment scripts для TimeWeb**

### **Фаза 5: Deploy и Верификация**
1. **Push в Git репо**
2. **Deploy на TimeWeb VDS**
3. **Проверить что система работает** в продакшне
4. **Провести final тестирование** с Pavel URLs

---

## 📁 **Essential Files для Продакшна**

### **Core Application**
```
lightweight_parser.py          # Main application entry point
requirements.txt               # Python dependencies
Dockerfile                    # Docker configuration
.env.template                 # Environment variables template
```

### **Source Code**
```
src/
├── api/                      # FastAPI routes
├── database/                 # Supabase integration  
├── parser/                   # YClients parsing logic
│   ├── yclients_parser.py    # Main Playwright parser
│   ├── parser_router.py      # Router system
│   └── production_data_extractor.py
└── browser/                  # Browser management
```

### **Configuration**
```
config/
├── settings.py               # App configuration
└── logging_config.py         # Logging setup
```

### **Essential Scripts**
```
scripts/
├── setup_db.py              # Database initialization
└── install.sh               # Installation script
```

### **Essential Tests** (Only Production Ready)
```
tests/
├── test_parser_units.py     # Unit tests for parser
├── test_no_demo_data.py     # Regression tests
└── run_tests.py             # Test runner
```

---

## 🗑️ **Files to REMOVE**

### **AI Development Artifacts**
```
ai-docs/                      # AI agent memory docs
specs/                        # Development specifications  
CLAUDE.md                     # Claude instructions
```

### **English Documentation**
```
DEPLOYMENT_GUIDE.md           # English deployment guide
IMPLEMENTATION_COMPLETE.md    # Development completion docs
PROJECT_*.md                  # All project development docs
README.md                     # Will be replaced with Russian version
```

### **Development/Testing Artifacts**
```
client_demonstration.py       # Demo scripts
automated_demo.py            # Development demos
test_*.py                    # Development test scripts (not unit tests)
*_report.json                # Development reports
```

### **Backup and Old Files**
```
*.backup                     # All backup files
*.bak                        # All .bak files  
*-original                   # Original versions
venv/                        # Virtual environment
logs/                        # Development logs
```

---

## 📝 **Russian Documentation to Create**

### **1. README.md (Russian)**
```markdown
# YClients Парсер - Автоматическое Извлечение Данных Бронирования

Система автоматического парсинга данных бронирования с платформы YClients
с использованием 4-шагового алгоритма навигации и Playwright автоматизации.

## Особенности
- Реальные данные (без демо-данных)
- 4-шаговая навигация по YClients
- Автоматическое планирование (каждые 10 минут)
- Интеграция с Supabase
- Поддержка TimeWeb VDS
```

### **2. РАЗВЕРТЫВАНИЕ.md**
```markdown
# Инструкция по Развертыванию на TimeWeb VDS

## Системные Требования
- Ubuntu 20.04+
- Python 3.11+
- Docker (опционально)

## Установка
[Detailed Russian deployment steps]
```

### **3. НАСТРОЙКА_СРЕДЫ.md**
```markdown  
# Настройка Переменных Среды

## Обязательные Переменные
PARSE_URLS=https://n1165596.yclients.com/...
SUPABASE_URL=https://ваш-проект.supabase.co
SUPABASE_KEY=ваш_ключ_supabase
```

### **4. ТЕХПОДДЕРЖКА.md**
```markdown
# Решение Проблем и Техническая Поддержка

## Частые Проблемы
1. Ошибка "Executable doesn't exist"
2. Проблемы с подключением к базе данных  
3. Отсутствие данных после парсинга
```

---

## 🧪 **Testing Strategy для Чистой Копии**

### **Step 1: Basic Functionality**
```bash
# Test imports work
python -c "from src.parser.parser_router import ParserRouter; print('✅')"

# Test core functions
python -c "from lightweight_parser import run_parser; print('✅')"
```

### **Step 2: Unit Tests**
```bash
# Only essential tests
python -m pytest tests/test_parser_units.py -v
python -m pytest tests/test_no_demo_data.py -v
```

### **Step 3: Integration Test**
```bash  
# Test with mock environment
PARSE_URLS="test" SUPABASE_URL="test" SUPABASE_KEY="test" python lightweight_parser.py --test
```

---

## 🚀 **TimeWeb Deployment Steps**

### **1. VDS Setup**
```bash
# Connect to TimeWeb VDS
ssh root@your-vds-ip

# Install system dependencies  
apt update && apt install python3.11 python3-pip git docker.io
```

### **2. Application Deploy**
```bash
# Clone clean repository
git clone https://github.com/user/yclients-parser.git
cd yclients-parser

# Install dependencies
pip3 install -r requirements.txt
playwright install chromium

# Setup environment
cp .env.template .env
# Edit .env with real credentials
```

### **3. Start Application**
```bash
# Test run
python3 lightweight_parser.py

# Production run (with systemd service)
systemctl start yclients-parser
systemctl enable yclients-parser
```

---

## ✅ **Success Criteria**

### **Clean Copy Validation**
- [ ] Only essential files present
- [ ] No AI development artifacts  
- [ ] No English documentation
- [ ] All imports work
- [ ] Tests pass (unit + regression)

### **Russian Documentation**  
- [ ] README.md на русском языке
- [ ] РАЗВЕРТЫВАНИЕ.md с инструкциями для TimeWeb
- [ ] НАСТРОЙКА_СРЕДЫ.md с переменными окружения
- [ ] ТЕХПОДДЕРЖКА.md с решением проблем

### **Production Readiness**
- [ ] Environment template created
- [ ] Deployment scripts ready
- [ ] TimeWeb specific configurations
- [ ] Git repository clean and ready

### **Final Verification**
- [ ] Deploy на TimeWeb VDS успешно
- [ ] Система запускается без ошибок
- [ ] Парсинг Pavel URLs работает
- [ ] Нет demo данных в результатах
- [ ] API endpoints отвечают
- [ ] Background scheduler работает

---

**🎯 Next Action**: Начать с Фазы 1 - создание списка essential файлов и удаление AI артефактов.