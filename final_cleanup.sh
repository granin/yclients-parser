#!/bin/bash

# Final cleanup of production copy
echo "🧹 Финальная очистка продакшн копии..."

CLEAN_DIR="../pavel-repo-production"

if [ ! -d "$CLEAN_DIR" ]; then
    echo "❌ Чистая копия не найдена: $CLEAN_DIR"
    exit 1
fi

cd "$CLEAN_DIR"

# Remove backup files that got through
echo "🗑️ Удаление backup файлов..."
find . -name "*.backup" -type f -delete
find . -name "*.bak" -type f -delete  
find . -name "*backup_*" -type f -delete

# Remove redundant parser files
echo "🗑️ Удаление избыточных parser файлов..."
rm -f parser/enhanced_data_extractor.py
rm -f parser/fixed_data_extractor.py
rm -f parser/improved_data_extractor.py
rm -f parser/improved_selectors.py
rm -f parser/improved_yclients_parser.py
rm -f parser/selectors.py
rm -f parser/real_yclients_selectors.py
rm -f parser/yclients_real_selectors.py

# Keep only essential parser files
echo "✅ Оставляем только essential parser файлы:"
echo "  - yclients_parser.py (главный Playwright парсер)"
echo "  - parser_router.py (система маршрутизации)"
echo "  - production_data_extractor.py (production ready экстрактор)"
echo "  - data_extractor.py (базовый экстрактор)"

# Update git with cleanup
if [ -d ".git" ]; then
    echo "📦 Обновление Git репозитория..."
    git add .
    git add -u  # Stage deletions
    git commit -m "🧹 Финальная очистка: удалены backup файлы и избыточные компоненты

✅ Оставлены только essential файлы:
- Главные компоненты парсера
- Производственные экстракторы  
- Система маршрутизации
- Документация на русском

🗑️ Удалено:
- Backup файлы (*.backup, *.bak)
- Избыточные parser версии
- Development артефакты

📊 Финальная структура готова к production deploy"
fi

echo ""
echo "📊 Финальная статистика файлов:"
echo "Всего файлов: $(find . -type f | wc -l)"
echo "Python файлы: $(find . -name "*.py" | wc -l)"
echo "Документация: $(find . -name "*.md" | wc -l)"
echo ""

echo "✅ Финальная очистка завершена!"
echo "🚀 Продакшн копия готова к развертыванию!"