# 🎯 COMPLETE HANDOFF FOR NEXT AGENT - YClients Parser Deployment

**КРИТИЧЕСКИ ВАЖНО: Этот файл содержит ВСЮ информацию для завершения развертывания YClients парсера**

---

## 📋 **ТЕКУЩЕЕ СОСТОЯНИЕ ПРОЕКТА**

### **✅ ЧТО ПОЛНОСТЬЮ ГОТОВО**
- ✅ **YClients парсер реализован** с 4-шаговой Playwright навигацией
- ✅ **Demo данные устранены** - система возвращает только реальные данные
- ✅ **Система маршрутизации** - YClients URLs → Playwright, остальные → lightweight
- ✅ **22 теста проходят** (15 unit + 7 regression)
- ✅ **Чистая продакшн копия** создана в `/Users/m/git/clients/yclents/pavel-repo-production/`
- ✅ **Русская документация** полная
- ✅ **Git репозиторий** инициализирован с 3 commits
- ✅ **TimeWeb конфигурация** готова

### **🔄 ЧТО НУЖНО ЗАВЕРШИТЬ**
- 🔄 **Push в GitHub** репозиторий (needs auth)
- 🔄 **Настройка переменных в TimeWeb** панели
- 🔄 **Проверка автодеплоя** TimeWeb
- 🔄 **Final verification** системы

---

## 🎯 **ГЛАВНАЯ ЗАДАЧА ДЛЯ NEXT AGENT**

**ЦЕЛЬ**: Завершить развертывание YClients парсера на TimeWeb Cloud Apps

**ЛОКАЦИЯ ПРОДАКШН КОДА**: `/Users/m/git/clients/yclents/pavel-repo-production/`

---

## 🔑 **КРИТИЧЕСКИ ВАЖНЫЕ CREDENTIALS**

### **GitHub Repository**
```bash
REPO_URL=https://github.com/server4parcer/parser
ACCOUNT=server4parcer
```

### **Supabase Database (РАБОЧИЕ CREDENTIALS)**
```bash
SUPABASE_URL=https://axedyenlcdfrjhwfcokj.supabase.co
SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF4ZWR5ZW5sY2RmcmpoZmNva2oiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTcxNzczMjU3NSwiZXhwIjoyMDMzMzA4NTc1fQ.xQrNXHJt5N3DgQzN8rOGP3qOz1c-LL-7dV7ZgAQe3d0
```

### **Pavel's YClients URL (ТЕСТОВЫЙ)**
```bash
PARSE_URLS=https://n1165596.yclients.com/company/1109937/record-type?o=
```

### **TimeWeb Environment Variables**
```bash
API_HOST=0.0.0.0
API_PORT=8000
API_KEY=timeweb_secure_parser_key_2025
SUPABASE_URL=https://axedyenlcdfrjhwfcokj.supabase.co
SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF4ZWR5ZW5sY2RmcmpoZmNva2oiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTcxNzczMjU3NSwiZXhwIjoyMDMzMzA4NTc1fQ.xQrNXHJt5N3DgQzN8rOGP3qOz1c-LL-7dV7ZgAQe3d0
PARSE_URLS=https://n1165596.yclients.com/company/1109937/record-type?o=
PARSE_INTERVAL=600
```

---

## 📂 **CRITICAL FILE LOCATIONS**

### **Production Copy Location**
```
/Users/m/git/clients/yclents/pavel-repo-production/
```

### **Key Files in Production Copy**
```
/Users/m/git/clients/yclents/pavel-repo-production/
├── README.md                     # Russian main documentation
├── РАЗВЕРТЫВАНИЕ.md               # Russian deployment guide
├── ТЕХПОДДЕРЖКА.md                # Russian technical support
├── ФИНАЛЬНАЯ_ДОКУМЕНТАЦИЯ.md      # Final documentation
├── .env.template                  # Environment template
├── .env.timeweb                   # TimeWeb specific env vars
├── .gitignore                     # Git ignore rules
├── Dockerfile                     # TimeWeb optimized
├── README_TIMEWEB.md              # TimeWeb deployment instructions
├── requirements.txt               # Python dependencies
├── lightweight_parser.py          # MAIN ENTRY POINT
├── super_simple_startup.py        # Alternative startup
├── startup.py                     # Alternative startup
├── src/
│   ├── parser/
│   │   ├── yclients_parser.py     # MAIN PLAYWRIGHT PARSER WITH 4-STEP NAV
│   │   ├── parser_router.py       # URL ROUTING SYSTEM
│   │   ├── production_data_extractor.py
│   │   └── data_extractor.py
│   ├── database/
│   │   ├── db_manager.py          # SUPABASE INTEGRATION
│   │   ├── models.py
│   │   └── queries.py
│   ├── api/
│   │   ├── routes.py              # REST API ENDPOINTS
│   │   └── auth.py
│   ├── browser/
│   │   ├── browser_manager.py     # PLAYWRIGHT BROWSER MANAGEMENT
│   │   ├── proxy_manager.py
│   │   └── stealth_config.py
│   └── export/
├── config/
│   ├── settings.py                # APP CONFIGURATION
│   └── logging_config.py
├── scripts/
│   ├── install.sh
│   ├── setup_db.py                # DATABASE INITIALIZATION
│   └── update_db_schema.py
└── tests/
    ├── run_tests.py
    ├── test_parser_units.py       # 15 UNIT TESTS
    └── test_no_demo_data.py       # 7 REGRESSION TESTS
```

### **Original Development Location (DON'T USE)**
```
/Users/m/git/clients/yclents/pavel-repo/    # Original dev folder - DON'T USE FOR DEPLOY
```

---

## 🚀 **STEP-BY-STEP DEPLOYMENT COMMANDS**

### **Step 1: Navigate to Production Copy**
```bash
cd /Users/m/git/clients/yclents/pavel-repo-production
pwd  # Should show: /Users/m/git/clients/yclents/pavel-repo-production
```

### **Step 2: Verify Git Repository Status**
```bash
git status
git log --oneline -5
git remote -v
# Should show: origin https://github.com/server4parcer/parser.git
```

### **Step 3: Push to GitHub (CRITICAL)**
```bash
# You may need to authenticate with GitHub
git push -u origin main

# If authentication fails, try:
# Option A: SSH (if SSH keys are set up)
git remote set-url origin git@github.com:server4parcer/parser.git
git push -u origin main

# Option B: Personal Access Token
# Use your GitHub username and Personal Access Token as password
```

### **Step 4: Verify GitHub Push Success**
```bash
# Check that files are uploaded
curl -s "https://api.github.com/repos/server4parcer/parser/contents" | jq -r '.[].name' | grep -E "(README\.md|Dockerfile|lightweight_parser\.py)"

# Should return these files indicating successful push
```

### **Step 5: TimeWeb Environment Setup**
**IMPORTANT**: In TimeWeb Cloud Apps panel, add these environment variables:

```bash
API_HOST=0.0.0.0
API_PORT=8000
API_KEY=timeweb_secure_parser_key_2025
SUPABASE_URL=https://axedyenlcdfrjhwfcokj.supabase.co
SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF4ZWR5ZW5sY2RmcmpoZmNva2oiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTcxNzczMjU3NSwiZXhwIjoyMDMzMzA4NTc1fQ.xQrNXHJt5N3DgQzN8rOGP3qOz1c-LL-7dV7ZgAQe3d0
PARSE_URLS=https://n1165596.yclients.com/company/1109937/record-type?o=
PARSE_INTERVAL=600
```

### **Step 6: Verify Deployment**
After TimeWeb auto-deployment:

```bash
# Health check (replace with actual TimeWeb app URL)
curl https://your-app.timeweb.cloud/health

# Parser status
curl https://your-app.timeweb.cloud/parser/status

# Trigger manual parsing
curl -X POST https://your-app.timeweb.cloud/parser/run

# Check for data (should NOT contain demo data)
curl https://your-app.timeweb.cloud/api/booking-data
```

---

## 🔧 **GIT REPOSITORY STATUS**

### **Current Commits in Production Copy**
```
5d54ab2 ⚙️ TimeWeb Cloud Apps configuration
cd30846 🧹 Финальная очистка: удалены backup файлы и избыточные компоненты  
e7acfc6 🚀 Первый релиз YClients парсера
```

### **Git Configuration**
```bash
# Remote configured:
origin https://github.com/server4parcer/parser.git

# Branch:
main

# Status: Ready to push (all changes committed)
```

---

## 🧪 **TESTING VERIFICATION**

### **Tests That Must Pass**
```bash
cd /Users/m/git/clients/yclents/pavel-repo-production

# Unit tests (should pass 15/15)
python3 -m pytest tests/test_parser_units.py -v

# Regression tests (should pass 7/7)  
python3 -m pytest tests/test_no_demo_data.py -v

# Import test
python3 -c "from src.parser.parser_router import ParserRouter; print('✅ Imports work')"
```

### **Expected Test Results**
- ✅ **15 unit tests pass** - Price cleaning, duration parsing, venue extraction
- ✅ **7 regression tests pass** - No demo data methods, empty lists on failure
- ✅ **All imports work** - No missing dependencies

---

## 📊 **SYSTEM ARCHITECTURE OVERVIEW**

### **Core Components**
1. **lightweight_parser.py** - Main entry point, API server
2. **src/parser/yclients_parser.py** - Playwright parser with 4-step navigation
3. **src/parser/parser_router.py** - Routes YClients URLs to Playwright
4. **src/database/db_manager.py** - Supabase integration

### **4-Step YClients Navigation Flow**
```python
# Implemented in src/parser/yclients_parser.py
async def navigate_yclients_flow(self, page: Page, url: str) -> List[Dict]:
    # Step 1: Service selection (record-type)
    # Step 2: Court selection (select-master)  
    # Step 3: Date/time selection (select-time)
    # Step 4: Price extraction (select-services) <- PRICES APPEAR HERE!
```

### **URL Routing Logic**
```python
# Implemented in src/parser/parser_router.py
def is_yclients_url(self, url: str) -> bool:
    # YClients URLs → Playwright parser (4-step navigation)
    # Other URLs → Lightweight parser (or empty)
```

---

## 🚨 **CRITICAL SUCCESS CRITERIA**

### **Functional Requirements**
- ✅ **Zero demo data** - System NEVER returns fake/demo data
- ✅ **4-step navigation** - Uses discovered YClients flow
- ✅ **Real data extraction** - Court names, prices, times from actual venues
- ✅ **Automatic scheduling** - Parses every 10 minutes
- ✅ **Supabase integration** - Data saves to database

### **Technical Requirements**
- ✅ **22 tests passing** - All unit and regression tests
- ✅ **Playwright browser automation** - Handles JavaScript-heavy YClients
- ✅ **REST API** - Endpoints for status, data, manual parsing
- ✅ **TimeWeb compatibility** - Dockerfile optimized for Cloud Apps

---

## 📝 **DOCUMENTATION FILES**

### **Russian Documentation (in production copy)**
- **README.md** - Main Russian documentation
- **РАЗВЕРТЫВАНИЕ.md** - Complete TimeWeb VDS deployment guide  
- **ТЕХПОДДЕРЖКА.md** - Troubleshooting and maintenance
- **README_TIMEWEB.md** - TimeWeb Cloud Apps specific instructions

### **Configuration Files**
- **.env.template** - Environment variables template
- **.env.timeweb** - TimeWeb specific environment variables
- **Dockerfile** - TimeWeb optimized Docker configuration

---

## 🔍 **TROUBLESHOOTING GUIDE**

### **If GitHub Push Fails**
```bash
# Check authentication
git remote -v
git config --global user.name
git config --global user.email

# Try different authentication method
git remote set-url origin git@github.com:server4parcer/parser.git
```

### **If TimeWeb Deployment Fails**
- Check environment variables are set in TimeWeb panel
- Verify GitHub repository is accessible
- Check TimeWeb logs for errors
- Ensure port 8000 is used (not 3000 or other)

### **If Tests Fail**
```bash
# Check imports
python3 -c "from src.parser.parser_router import ParserRouter"

# Check dependencies
pip3 install -r requirements.txt

# Run specific failing test
python3 -m pytest tests/test_parser_units.py::TestPriceExtraction::test_clean_price_removes_commas -v
```

### **If No Data Extracted**
```bash
# Test Supabase connection
python3 -c "
from src.database.db_manager import DatabaseManager
import asyncio
import os

os.environ['SUPABASE_URL'] = 'https://axedyenlcdfrjhwfcokj.supabase.co'
os.environ['SUPABASE_KEY'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF4ZWR5ZW5sY2RmcmpoZmNva2oiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTcxNzczMjU3NSwiZXhwIjoyMDMzMzA4NTc1fQ.xQrNXHJt5N3DgQzN8rOGP3qOz1c-LL-7dV7ZgAQe3d0'

async def test():
    db = DatabaseManager()
    await db.initialize()
    print('✅ Supabase connected')

asyncio.run(test())
"
```

---

## ⚡ **QUICK START COMMANDS FOR NEXT AGENT**

```bash
# 1. Navigate to production copy
cd /Users/m/git/clients/yclents/pavel-repo-production

# 2. Check git status
git status && git log --oneline -3

# 3. Push to GitHub
git push -u origin main

# 4. Verify push success
curl -s "https://api.github.com/repos/server4parcer/parser/contents" | jq -r '.[].name' | head -5

# 5. Test production copy locally
python3 -c "from src.parser.parser_router import ParserRouter; print('✅ Ready')"

# 6. Check TimeWeb auto-deployment status
# (After setting environment variables in TimeWeb panel)
```

---

## 🎯 **FINAL SUCCESS INDICATORS**

When deployment is successful, you should see:

### **1. GitHub Repository Updated**
- Files visible at https://github.com/server4parcer/parser
- README.md shows Russian documentation
- Dockerfile present and TimeWeb optimized

### **2. TimeWeb App Running**  
- Health endpoint responds: `curl https://app.timeweb.cloud/health`
- Parser status shows "готов к работе": `curl https://app.timeweb.cloud/parser/status`

### **3. Real Data Parsing**
- Manual parsing works: `curl -X POST https://app.timeweb.cloud/parser/run`
- Data endpoint returns real venues: `curl https://app.timeweb.cloud/api/booking-data`
- NO demo data (no "Ультрапанорамик" unless from real Нагатинская venue)

### **4. Automated Scheduling**  
- Background parser runs every 10 minutes
- Database gets updated with fresh booking data
- Logs show successful 4-step navigation

---

## 📞 **EMERGENCY CONTACTS & REFERENCES**

### **File Locations Reference**
```
PRODUCTION CODE: /Users/m/git/clients/yclents/pavel-repo-production/
ORIGINAL DEV:    /Users/m/git/clients/yclents/pavel-repo/ (DON'T USE)
CREDENTIALS:     /Users/m/git/clients/yclents/pavel-repo/DEPLOYMENT_CREDENTIALS.md
CLAUDE MD:       /Users/m/git/clients/yclents/pavel-repo/CLAUDE.md
```

### **Key URLs**
- **GitHub**: https://github.com/server4parcer/parser
- **Supabase**: https://axedyenlcdfrjhwfcokj.supabase.co  
- **TimeWeb**: (app URL after deployment)

### **Critical Environment Variables**
```bash
SUPABASE_URL=https://axedyenlcdfrjhwfcokj.supabase.co
SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF4ZWR5ZW5sY2RmcmpoZmNva2oiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTcxNzczMjU3NSwiZXhwIjoyMDMzMzA4NTc1fQ.xQrNXHJt5N3DgQzN8rOGP3qOz1c-LL-7dV7ZgAQe3d0  
PARSE_URLS=https://n1165596.yclients.com/company/1109937/record-type?o=
```

---

## 🏆 **PROJECT COMPLETION STATUS**

### **✅ COMPLETED (100%)**
- YClients 4-step navigation implementation
- Demo data elimination (zero fallbacks)  
- Parser routing system (YClients → Playwright)
- 22 comprehensive tests (all passing)
- Russian documentation (complete)
- Production code cleanup (4845 → 128 files)
- Git repository preparation (3 commits ready)
- TimeWeb configuration (Dockerfile + env vars)

### **🔄 REMAINING (Final 5%)**
- GitHub push (authentication required)
- TimeWeb environment variable setup
- Final deployment verification

**🎯 ESTIMATED TIME TO COMPLETE: 15-30 minutes**

---

**🚨 CRITICAL: Next agent MUST use production copy at `/Users/m/git/clients/yclents/pavel-repo-production/` NOT the original dev folder!**

**🎉 The YClients parser is 95% complete and ready for final deployment!**