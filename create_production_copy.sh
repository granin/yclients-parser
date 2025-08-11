#!/bin/bash

# Create Production Copy Script
# This script creates a clean production copy with only essential files

echo "🧹 Creating clean production copy..."

# Create clean directory
CLEAN_DIR="../pavel-repo-production"
rm -rf "$CLEAN_DIR"
mkdir -p "$CLEAN_DIR"

echo "📁 Created directory: $CLEAN_DIR"

# Copy essential files
echo "📋 Copying essential files..."

# Root files
cp requirements.txt "$CLEAN_DIR/"
cp Dockerfile "$CLEAN_DIR/"
cp lightweight_parser.py "$CLEAN_DIR/"
cp super_simple_startup.py "$CLEAN_DIR/"
cp startup.py "$CLEAN_DIR/"

# Keep one Russian doc that already exists
cp ФИНАЛЬНАЯ_ДОКУМЕНТАЦИЯ.md "$CLEAN_DIR/"

echo "✅ Copied root files"

# Copy source code directories
cp -r src/ "$CLEAN_DIR/"
cp -r config/ "$CLEAN_DIR/"
cp -r scripts/ "$CLEAN_DIR/"

# Create data directory
mkdir -p "$CLEAN_DIR/data/export"

echo "✅ Copied source directories"

# Copy only essential tests
mkdir -p "$CLEAN_DIR/tests"
cp tests/__init__.py "$CLEAN_DIR/tests/"
cp tests/run_tests.py "$CLEAN_DIR/tests/"
cp tests/test_parser_units.py "$CLEAN_DIR/tests/"
cp tests/test_no_demo_data.py "$CLEAN_DIR/tests/"

echo "✅ Copied essential tests"

# Clean up src/parser - remove backup files
cd "$CLEAN_DIR/src/parser"
rm -f *.backup *.bak *backup_*
rm -f data_extractor.py.backup
rm -f enhanced_data_extractor.py
rm -f fixed_data_extractor.py  
rm -f improved_data_extractor.py
rm -f improved_selectors.py
rm -f improved_yclients_parser.py
rm -f selectors.py
rm -f yclients_parser.py.backup*
rm -f yclients_parser.py.bak
rm -f real_yclients_selectors.py
rm -f yclients_real_selectors.py

# Keep only essential parser files
# yclients_parser.py (main)
# parser_router.py (our new router)
# production_data_extractor.py (production ready)
# data_extractor.py (if needed as base)

echo "✅ Cleaned parser directory"

cd - > /dev/null

# Create .gitignore
cat > "$CLEAN_DIR/.gitignore" << 'EOF'
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

echo "✅ Created .gitignore"

# Create environment template
cat > "$CLEAN_DIR/.env.template" << 'EOF'
# API Configuration
API_HOST=0.0.0.0
API_PORT=8000
API_KEY=your_secure_api_key

# YClients URLs (Pavel's venues)
PARSE_URLS=https://n1165596.yclients.com/company/1109937/record-type?o=,https://n1308467.yclients.com/company/1192304/record-type?o=,https://b861100.yclients.com/company/804153/personal/select-time?o=m-1,https://b1009933.yclients.com/company/936902/personal/select-time?o=,https://b918666.yclients.com/company/855029/personal/menu?o=m-1

# Supabase Database
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_KEY=your_supabase_anon_key

# Parsing Settings
PARSE_INTERVAL=600
EOF

echo "✅ Created .env.template"

echo ""
echo "🎉 Production copy created successfully!"
echo "📍 Location: $CLEAN_DIR"
echo ""
echo "📊 File count comparison:"
echo "Original: $(find . -type f | wc -l) files"
echo "Clean: $(find "$CLEAN_DIR" -type f | wc -l) files"
echo ""
echo "🔍 Next steps:"
echo "1. Create Russian documentation"
echo "2. Test the clean copy"
echo "3. Deploy to Git"