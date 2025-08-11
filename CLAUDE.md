# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a YClients parser system that automates data collection from the YCLIENTS booking platform. The system extracts booking information (dates, times, prices, providers) and stores it in Supabase for business analytics. It's designed for deployment on TimeWeb hosting using Docker containers.

## Architecture

**Modular Architecture:**
- `src/parser/` - Core parsing logic using lightweight HTTP requests (no browser dependencies)
- `src/database/` - Supabase integration with robust error handling
- `src/api/` - FastAPI REST API server
- `src/export/` - Data export functionality (CSV, JSON)
- `config/` - Centralized configuration management

**Key Components:**
- **DatabaseManager** (`src/database/db_manager.py`) - Handles Supabase connections and data persistence
- **YClientsParser** (`src/parser/yclients_parser.py`) - Main parsing engine with production-ready data extraction
- **ProductionDataExtractor** (`src/parser/production_data_extractor.py`) - Lightweight data extraction without browser dependencies
- **FastAPI App** (`src/api/routes.py`) - REST API with business analytics endpoints

## Common Development Commands

### Running the Application

**Main Entry Points:**
- `python src/main.py` - Start full application (API + parser)
- `python src/main.py --mode parser` - Parser only
- `python src/main.py --mode api` - API server only
- `python super_simple_startup.py` - Lightweight startup for production

**Docker Deployment:**
```bash
docker build -t yclients-parser .
docker run -p 8000:8000 yclients-parser
```

### Testing

**Run all tests:**
```bash
python tests/run_tests.py
```

**Run specific test types:**
```bash
python tests/run_tests.py --type unit
python tests/run_tests.py --type integration
python tests/run_tests.py --module parser
```

**Test with coverage:**
```bash
python tests/run_tests.py --coverage
```

### Development Scripts

**Deployment preparation:**
```bash
./apply_fixes.sh  # Apply production fixes
./vds-install.sh  # VDS installation script
```

**Database operations:**
```bash
python scripts/setup_db.py         # Initialize database
python scripts/update_db_schema.py # Update schema for business analytics
```

## Configuration

**Environment Variables (Required for Supabase):**
- `SUPABASE_URL` - Supabase project URL
- `SUPABASE_KEY` - Supabase anon/service key
- `PARSE_URLS` - Comma-separated URLs to parse
- `API_KEY` - API authentication key

**Configuration Files:**
- `config/settings.py` - Main configuration with fallbacks
- `config/logging_config.py` - Logging setup
- `.env` - Environment variables (not tracked)

## Database Integration

**Supabase Tables:**
- `booking_data` - Core booking information with business analytics fields
- `urls` - Managed URL list for parsing

**Models** (`src/database/models.py`):
- `BookingData` - Extended model with business analytics fields (court_type, time_category, location_name)
- `Url` - URL management model
- `PriceHistory` - Price tracking for competitive analysis

**Critical Database Features:**
- Automatic table creation detection
- Batch data insertion with error recovery
- Price vs time format validation (prevents data corruption)
- Enhanced business analytics fields

## API Endpoints

**Core Operations:**
- `GET /status` - System status
- `GET /data` - Retrieve booking data with filters
- `POST /parse` - Trigger parsing for specific URL
- `GET /export` - Export data (CSV/JSON)

**Business Analytics:**
- `GET /analytics/pricing` - Price analysis by court type, time category
- `GET /analytics/availability` - Availability trends
- `GET /analytics/price_history` - Historical price tracking

## Testing Strategy

**Test Structure:**
- Unit tests for individual components
- Integration tests for database and API
- Enhanced data extractor tests for business analytics
- Production readiness tests

**When fixing Supabase issues:**
1. Test database connection: `python -c "from src.database.db_manager import DatabaseManager; import asyncio; asyncio.run(DatabaseManager().initialize())"`
2. Verify environment variables are set
3. Check table creation in Supabase dashboard
4. Test data insertion with sample data

## Production Deployment Notes

**TimeWeb Specific:**
- Uses lightweight requirements.txt (no browser dependencies)
- Health check endpoint on port 8000
- Docker container optimized for VDS hosting
- Fallback configurations for missing dependencies

**Startup Options:**
- `super_simple_startup.py` - Minimal production startup
- `minimal_startup.py` - Reduced feature set
- `startup.py` - Full feature set

**Data Validation:**
- Price detection prevents time values being stored as prices
- Robust error handling for malformed data
- Batch processing with individual fallback on errors

## Business Analytics Features

**Enhanced Data Collection:**
- Automatic court type detection (tennis, basketball, squash)
- Time categorization (DAY, EVENING, WEEKEND)
- Location normalization
- Review count tracking
- Prepayment requirement detection

**Query Capabilities:**
- Filter by court type, time category, location
- Price trend analysis
- Availability pattern recognition
- Competitive pricing insights

## Common Issues and Solutions

**Supabase Connection Issues:**
1. Verify `SUPABASE_URL` and `SUPABASE_KEY` environment variables
2. Check table existence in Supabase dashboard
3. Ensure proper permissions on Supabase API keys
4. Test connection with diagnostic script

**Data Not Saving:**
1. Check logs for validation errors
2. Verify price vs time format detection
3. Test individual record insertion
4. Check batch size limits

**Deployment Issues:**
1. Use `super_simple_startup.py` for minimal dependencies
2. Verify health check endpoint responds
3. Check container logs for initialization errors
4. Ensure port 8000 is properly exposed

## Deployment Information
- 📋 **DEPLOYMENT_CREDENTIALS.md** - Complete credentials and deployment info for YClients parser
- 🚀 Ready for TimeWeb Cloud Apps deployment with GitHub auto-sync
- 🔑 All credentials available for production deployment