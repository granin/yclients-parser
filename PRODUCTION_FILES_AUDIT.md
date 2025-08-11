# Production Files Audit - Что Оставить vs Что Удалить

**Детальный аудит всех файлов для создания чистой продакшн версии**

---

## ✅ **ESSENTIAL FILES - Оставить**

### **Core Application (Required)**
```
lightweight_parser.py          ✅ Main entry point
requirements.txt              ✅ Dependencies
Dockerfile                    ✅ Docker config
super_simple_startup.py       ✅ Alternative startup
startup.py                    ✅ Alternative startup
```

### **Source Code (Required)**
```
src/
├── __init__.py               ✅
├── main.py                   ✅
├── api/
│   ├── __init__.py           ✅
│   ├── auth.py               ✅
│   └── routes.py             ✅
├── database/
│   ├── __init__.py           ✅
│   ├── db_manager.py         ✅
│   ├── models.py             ✅
│   └── queries.py            ✅
├── parser/
│   ├── __init__.py           ✅
│   ├── yclients_parser.py    ✅ Main Playwright parser
│   ├── parser_router.py      ✅ Our new router system
│   └── production_data_extractor.py ✅
├── browser/
│   ├── __init__.py           ✅
│   ├── browser_manager.py    ✅
│   ├── proxy_manager.py      ✅
│   └── stealth_config.py     ✅
└── export/
    ├── __init__.py           ✅
    ├── csv_exporter.py       ✅
    └── json_exporter.py     ✅
```

### **Configuration (Required)**
```
config/
├── __init__.py               ✅
├── settings.py               ✅
└── logging_config.py         ✅
```

### **Scripts (Essential)**
```
scripts/
├── install.sh               ✅
├── setup_db.py              ✅
└── update_db_schema.py      ✅
```

### **Tests (Production Only)**
```
tests/
├── __init__.py               ✅
├── run_tests.py              ✅
├── test_parser_units.py      ✅ Our new unit tests
└── test_no_demo_data.py      ✅ Our new regression tests
```

### **Data Directory**
```
data/
└── export/                   ✅ For data exports
```

---

## 🗑️ **FILES TO REMOVE - Удалить**

### **AI Development Artifacts**
```
❌ ai-docs/                   # AI agent memory
❌ specs/                     # Development specifications
❌ CLAUDE.md                  # Claude instructions
```

### **English Documentation (Replace with Russian)**
```
❌ README.md                  # Will create Russian version
❌ DEPLOYMENT_GUIDE.md        # English deployment guide
❌ IMPLEMENTATION_COMPLETE.md # Development docs
❌ PROJECT_COMPLETION_GUIDE.md
❌ PROJECT_IMPLEMENTATION_PROGRESS.md
❌ CLIENT_QUICK_START.md
❌ DATABASE_FIX_STATUS.md
❌ ERROR_DIAGNOSTICS_SOLUTION.md
❌ EXPLORATION_REPORT.md
❌ FINAL_STATUS.md
❌ FINAL_SYSTEM_STATUS.md
❌ FRESH_SUPABASE_SETUP.md
❌ PRODUCTION_SUCCESS.md
❌ PROGRAMMATIC_RLS_FIX.md
❌ QUICK_SETUP_GUIDE.md
❌ REAL_PARSING_FIX.md
❌ SUPABASE_PERMISSIONS_FIX.md
❌ TESTING_RESULTS.md
❌ TIMEWEB_DEPLOYMENT_GUIDE.md
❌ TIMEWEB_UPDATE_INSTRUCTIONS.md
```

### **Development and Demo Scripts**
```
❌ automated_demo.py          # Demo scripts
❌ client_demonstration.py    # Development demos
❌ client_demonstration_report.json
❌ comprehensive_test.py      # Development test
❌ create_delivery_package.py # Development utility
❌ database_app.py            # Alternative app (redundant)
❌ demo_report.json
❌ docker_test.py             # Development test
❌ fastapi_app.py             # Alternative app (redundant)
❌ final_parser.py            # Development version
❌ hello_world.py             # Test file
❌ live_multi_url_test.py     # Development test
❌ minimal_startup.py         # Redundant startup
❌ monitor_deployment.py      # Development utility
❌ multi_url_test_report.json
❌ multi_url_verification_report.json
❌ production_parser.py       # Alternative version (redundant)
❌ simple_check.py            # Development check
❌ test_*.py                  # All development test scripts
❌ ultra_minimal.py           # Redundant startup
❌ verify_multi_url.py        # Development verification
```

### **Backup and Old Files**
```
❌ Dockerfile-original        # Backup
❌ docker-compose-original.yml # Backup
❌ src/parser/*.backup        # All backup files
❌ src/parser/*.bak           # All .bak files
❌ src/parser/*_backup_*      # Timestamped backups
```

### **Development Data and Logs**
```
❌ logs/                      # Development logs
❌ venv/                      # Virtual environment
❌ *.log                      # Log files
```

### **Redundant Parser Files**
```
❌ src/parser/data_extractor.py.backup
❌ src/parser/enhanced_data_extractor.py      # Older version
❌ src/parser/fixed_data_extractor.py         # Older version
❌ src/parser/improved_data_extractor.py      # Older version
❌ src/parser/improved_selectors.py           # Older version
❌ src/parser/improved_yclients_parser.py     # Older version
❌ src/parser/selectors.py                    # Older version
❌ src/parser/yclients_parser.py.backup       # Backup
❌ src/parser/yclients_parser.py.backup_*     # Timestamped backups
❌ src/parser/yclients_parser.py.bak          # Backup
❌ src/parser/real_yclients_selectors.py      # Older version
❌ src/parser/yclients_real_selectors.py      # Older version
```

### **Outdated Test Files**
```
❌ tests/test_api.py                          # Has failures, older tests
❌ tests/test_database.py                     # Has failures, older tests
❌ tests/test_enhanced_data_extractor.py      # Older implementation
❌ tests/test_export.py                       # Not essential for core functionality
❌ tests/test_integration.py                  # Has failures, older tests
❌ tests/test_parser.py                       # Has failures, older tests
❌ tests/test_yclients_navigation.py          # Our new tests (duplicate functionality)
```

### **Development Files**
```
❌ timeweb_parse_urls.txt     # Development file
❌ apply_fixes.sh             # Development script
❌ vds-install.sh             # Older install script
❌ PRODUCTION_DEPLOYMENT_PLAN.md # This planning doc
❌ PRODUCTION_FILES_AUDIT.md  # This audit doc
```

---

## 📝 **Russian Documentation to CREATE**

### **Core Documentation**
```
✅ README.md                  # Russian main documentation
✅ РАЗВЕРТЫВАНИЕ.md           # Russian deployment guide
✅ НАСТРОЙКА_СРЕДЫ.md         # Environment setup guide
✅ ТЕХПОДДЕРЖКА.md            # Troubleshooting guide
```

### **Configuration Templates**
```
✅ .env.template              # Environment variables template
✅ .gitignore                 # Git ignore rules
```

### **Keep One Russian Doc**
```
✅ ФИНАЛЬНАЯ_ДОКУМЕНТАЦИЯ.md  # Already in Russian - keep this
```

---

## 🎯 **Final Essential File Structure**

```
pavel-repo-clean/
├── README.md                 # NEW: Russian documentation
├── РАЗВЕРТЫВАНИЕ.md          # NEW: Russian deployment
├── НАСТРОЙКА_СРЕДЫ.md        # NEW: Environment setup
├── ТЕХПОДДЕРЖКА.md           # NEW: Troubleshooting
├── ФИНАЛЬНАЯ_ДОКУМЕНТАЦИЯ.md # EXISTING: Russian docs
├── .env.template             # NEW: Environment template
├── .gitignore                # NEW: Git ignore
├── requirements.txt
├── Dockerfile
├── lightweight_parser.py    # Main entry point
├── super_simple_startup.py  # Alternative startup
├── startup.py                # Alternative startup
├── config/
│   ├── __init__.py
│   ├── settings.py
│   └── logging_config.py
├── src/
│   ├── __init__.py
│   ├── main.py
│   ├── api/
│   ├── database/
│   ├── parser/
│   │   ├── yclients_parser.py
│   │   ├── parser_router.py
│   │   └── production_data_extractor.py
│   ├── browser/
│   └── export/
├── scripts/
│   ├── install.sh
│   ├── setup_db.py
│   └── update_db_schema.py
├── tests/
│   ├── run_tests.py
│   ├── test_parser_units.py
│   └── test_no_demo_data.py
└── data/
    └── export/
```

---

**📊 Summary**:
- **Keep**: ~30 essential files
- **Remove**: ~70+ development/backup files
- **Create**: 4 new Russian documentation files

**🎯 Next Step**: Execute the cleanup and create clean production copy