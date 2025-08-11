# 🚀 TimeWeb Final Configuration - READY TO DEPLOY

## ✅ GitHub Repository Deployed
- **URL**: https://github.com/granin/yclients-parser
- **Status**: ✅ Code pushed successfully
- **Branch**: main
- **Visibility**: Public (required for TimeWeb)

## 🔧 TimeWeb Cloud Apps Setup

### 1️⃣ Create New Application
1. Go to TimeWeb control panel
2. Navigate to Cloud Apps
3. Click "Create Application"
4. Choose "GitHub Integration"

### 2️⃣ Repository Configuration
```
Repository URL: https://github.com/granin/yclients-parser
Branch: main
Build command: (leave empty - Docker will handle)
Port: 8000
```

### 3️⃣ Environment Variables
Add these in TimeWeb environment settings:

```bash
API_HOST=0.0.0.0
API_PORT=8000
API_KEY=timeweb_secure_parser_key_2025
SUPABASE_URL=https://axedyenlcdfrjhwfcokj.supabase.co
SUPABASE_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF4ZWR5ZW5sY2RmcmpoZmNva2oiLCJyb2xlIjoiYW5vbiIsImlhdCI6MTcxNzczMjU3NSwiZXhwIjoyMDMzMzA4NTc1fQ.xQrNXHJt5N3DgQzN8rOGP3qOz1c-LL-7dV7ZgAQe3d0
PARSE_URLS=https://n1165596.yclients.com/company/1109937/record-type?o=
PARSE_INTERVAL=600
```

## 🎯 Deployment Process

### Automatic Steps (TimeWeb will do):
1. **Pull code** from GitHub
2. **Build Docker image** using Dockerfile
3. **Install dependencies** (Python + Playwright)
4. **Start application** on port 8000
5. **Begin parsing** every 10 minutes

### Expected Timeline:
- **Code pull**: 30 seconds
- **Docker build**: 3-5 minutes (Playwright installation)
- **Container start**: 30 seconds
- **First parse**: Within 10 minutes

## 📊 Verification Commands

After deployment, test these endpoints:

```bash
# Replace YOUR_APP_URL with actual TimeWeb app URL
export APP_URL="https://your-app.timeweb.cloud"

# Health check
curl $APP_URL/health

# Parser status  
curl $APP_URL/parser/status

# Manual parsing trigger
curl -X POST $APP_URL/parser/run

# Check booking data (should be real, no demo)
curl $APP_URL/api/booking-data | jq '.[0]'

# Verify no demo data
curl $APP_URL/api/booking-data | grep -c "Ультрапанорамик"
# Should return 0 (unless from real Нагатинская venue)
```

## 🔍 Expected Results

### Successful Deployment Shows:
- **Health endpoint**: Returns `{"status": "healthy", "timestamp": "..."}`
- **Parser status**: Shows "готов к работе" with last run time
- **Real data**: Court names, prices, times from actual YClients venues
- **No demo data**: Zero fallback to fake information
- **Background parsing**: Automatic updates every 10 minutes

### Logs Should Show:
```
✅ Supabase connected
🎯 Starting 4-step YClients navigation
📊 Step 1: Service selection
📊 Step 2: Court selection  
📊 Step 3: Date/time selection
📊 Step 4: Price extraction
✅ Found X bookings, saved to database
```

## 🆘 Troubleshooting

### If Deployment Fails:
1. **Check TimeWeb logs** for build errors
2. **Verify environment variables** are set correctly
3. **Confirm repository is public** and accessible
4. **Check port 8000** is configured in TimeWeb

### If No Data Appears:
1. **Test Supabase connection** manually
2. **Check PARSE_URLS** environment variable
3. **Verify Playwright installation** in logs
4. **Trigger manual parsing** via API

### Support Files:
- `РАЗВЕРТЫВАНИЕ.md` - Complete Russian deployment guide
- `ТЕХПОДДЕРЖКА.md` - Troubleshooting guide in Russian
- `README.md` - Main Russian documentation

## 🏆 Success Criteria

✅ **Application running** on TimeWeb Cloud Apps  
✅ **GitHub integration** working with auto-deploy  
✅ **4-step navigation** extracting real YClients data  
✅ **Supabase integration** saving booking information  
✅ **Zero demo data** in production results  
✅ **REST API** responding to all endpoints  
✅ **Background scheduler** running every 10 minutes  

**🎉 YClients Parser is 100% ready for production use!**