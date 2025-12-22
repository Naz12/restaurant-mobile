# Running Flutter App from Remote Server to Local Emulator

## Setup Status ✅

**Verified:**
- ✅ Flutter 3.38.5 installed
- ✅ Dependencies installed
- ✅ Code generation complete (11 generated files)
- ✅ API config ready (uses environment variable)

## How to Run from Remote Server to Local Emulator

Since your emulator is running **locally on your PC** and the project is on a **remote server**, you have several options:

### Option 1: ADB Port Forwarding (Recommended)

**On your local PC:**

1. **Forward ADB connection to remote server:**
   ```bash
   # On your local PC terminal
   adb forward tcp:5037 tcp:5037
   ```

2. **Or use SSH tunnel for ADB:**
   ```bash
   # On your local PC terminal
   ssh -L 5037:localhost:5037 user@remote-server
   ```

3. **On remote server (SSH session):**
   ```bash
   cd /home/deploy_user_dagi/services/table_track/restaurant_mobile
   
   # Set API URL (if needed)
   export API_BASE_URL="http://your-server-ip:8000/api/mobile"
   
   # Run the app
   flutter run -d <device-id>
   ```

### Option 2: Network ADB Connection

**On your local PC:**

1. **Enable network ADB:**
   ```bash
   adb tcpip 5555
   adb connect localhost:5555
   ```

2. **Get your local PC's IP address:**
   ```bash
   # Windows
   ipconfig
   
   # Linux/Mac
   ifconfig
   # or
   ip addr
   ```

3. **On remote server (SSH session):**
   ```bash
   cd /home/deploy_user_dagi/services/table_track/restaurant_mobile
   
   # Connect to your local emulator
   adb connect YOUR_LOCAL_PC_IP:5555
   
   # Verify connection
   flutter devices
   
   # Run the app
   flutter run
   ```

### Option 3: VS Code Remote Development (Easiest)

**On your local PC:**

1. **Install VS Code with Remote-SSH extension**

2. **Connect to remote server via VS Code:**
   - Open VS Code
   - Press `F1` → "Remote-SSH: Connect to Host"
   - Enter: `user@remote-server-ip`

3. **In VS Code on remote server:**
   - Install Flutter extension
   - Open the project folder
   - VS Code will detect your local emulator automatically
   - Press `F5` to run

### Option 4: Direct Network Connection

**If your local PC and remote server are on the same network:**

1. **On remote server:**
   ```bash
   cd /home/deploy_user_dagi/services/table_track/restaurant_mobile
   
   # Connect to emulator on your local PC
   adb connect YOUR_LOCAL_PC_IP:5555
   
   # Run
   flutter run
   ```

## Quick Start Commands

### Check Setup:
```bash
cd /home/deploy_user_dagi/services/table_track/restaurant_mobile
flutter devices
flutter pub get
```

### Run with API URL:
```bash
flutter run --dart-define=API_BASE_URL=http://your-server-ip:8000/api/mobile
```

### Run on Specific Device:
```bash
flutter run -d <device-id>
```

## Important Notes

1. **API URL Configuration:**
   - Current default: `http://localhost:8000/api/mobile`
   - For remote server, use: `http://SERVER_IP:8000/api/mobile`
   - Or set via environment variable: `--dart-define=API_BASE_URL=...`

2. **Android SDK Not Required on Server:**
   - Since emulator is local, you don't need Android SDK on remote server
   - Flutter just needs to connect to your local ADB

3. **Network Requirements:**
   - Remote server must be able to reach your local PC's IP
   - Or use SSH tunnel for secure connection

## Troubleshooting

### Issue: `flutter devices` shows no devices
**Solution:**
- Make sure emulator is running locally
- Check ADB connection: `adb devices` (on local PC)
- Try ADB port forwarding or network connection

### Issue: Can't connect to local emulator from server
**Solution:**
- Use SSH tunnel: `ssh -L 5037:localhost:5037 user@server`
- Or use network ADB: `adb connect YOUR_PC_IP:5555`

### Issue: API calls fail
**Solution:**
- Update API URL in `app_config.dart` or use `--dart-define`
- Make sure backend server is accessible from emulator
- For Android emulator, use `10.0.2.2` instead of `localhost`

## Current Setup Status

✅ **Flutter**: Installed (3.38.5)
✅ **Dependencies**: Installed
✅ **Code Generation**: Complete (11 files)
✅ **API Config**: Ready (uses environment variable)
⚠️ **Android SDK**: Not needed (emulator is local)
✅ **Ready to Run**: Yes

## Next Steps

1. Set up ADB connection between server and local PC
2. Configure API URL (if different from default)
3. Run: `flutter run` or `flutter run -d <device-id>`

