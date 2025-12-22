# Running Flutter App from Cursor (Remote Server → Local Emulator)

## Quick Start

Since you're using **Cursor** with Remote-SSH, here's the easiest way:

### Option 1: Use Cursor's Built-in Flutter Support (Recommended)

1. **In Cursor (connected to remote server):**
   - Make sure Flutter extension is installed
   - Open the project folder: `/home/deploy_user_dagi/services/table_track/restaurant_mobile`
   - Cursor should automatically detect your local emulator

2. **Run the app:**
   - Press `F5` or click the Run button
   - Or use Command Palette: `Ctrl+Shift+P` → "Flutter: Run"

3. **If emulator not detected:**
   - Make sure emulator is running on your local PC
   - Check Cursor's output panel for Flutter device detection

### Option 2: Connect Emulator Manually (If Option 1 doesn't work)

**On your LOCAL PC (in a terminal):**

1. **Find your local IP:**
   ```bash
   # Windows
   ipconfig
   # Look for IPv4 Address (e.g., 192.168.1.100)
   
   # Linux/Mac
   ifconfig
   # or
   ip addr
   ```

2. **Enable network ADB:**
   ```bash
   adb tcpip 5555
   ```

**In Cursor (on remote server):**

1. **Open integrated terminal in Cursor** (`Ctrl+`` or View → Terminal)

2. **Run the connection script:**
   ```bash
   cd /home/deploy_user_dagi/services/table_track/restaurant_mobile
   ./connect_emulator.sh
   ```
   Enter your local PC's IP when prompted

3. **Or connect manually:**
   ```bash
   adb connect YOUR_LOCAL_PC_IP:5555
   flutter devices
   ```

4. **Run the app:**
   ```bash
   ./run_app.sh
   ```

### Option 3: Direct Command (Quick)

**In Cursor terminal:**

```bash
cd /home/deploy_user_dagi/services/table_track/restaurant_mobile

# Connect to your local emulator (replace with your PC IP)
adb connect YOUR_LOCAL_PC_IP:5555

# Run the app
flutter run --dart-define=API_BASE_URL=http://95.216.220.225:8000/api/mobile
```

## Using Cursor's Flutter Extension

1. **Install Flutter Extension in Cursor:**
   - Open Extensions (`Ctrl+Shift+X`)
   - Search for "Flutter"
   - Install the official Flutter extension

2. **Configure:**
   - The extension should auto-detect Flutter SDK
   - It should also detect your local emulator automatically

3. **Run:**
   - Use the Run/Debug panel (left sidebar)
   - Or press `F5`
   - Or use Command Palette: "Flutter: Run"

## API URL Configuration

The app is configured to use:
- Default: `http://localhost:8000/api/mobile`
- Or via environment: `--dart-define=API_BASE_URL=...`

For your server, use:
```bash
flutter run --dart-define=API_BASE_URL=http://95.216.220.225:8000/api/mobile
```

## Troubleshooting

### Issue: Cursor doesn't detect emulator
**Solution:**
- Make sure emulator is running on local PC
- Try connecting manually: `adb connect YOUR_PC_IP:5555`
- Check Cursor's Flutter extension output

### Issue: "adb: command not found"
**Solution:**
- Install Android SDK platform-tools on remote server
- Or use Cursor's built-in Flutter support (doesn't need ADB)

### Issue: Can't connect to emulator
**Solution:**
1. On local PC: `adb tcpip 5555`
2. Check firewall allows port 5555
3. Verify both devices on same network

## Quick Commands

```bash
# Check devices
flutter devices

# Connect emulator (replace IP)
adb connect 192.168.1.100:5555

# Run app
flutter run --dart-define=API_BASE_URL=http://95.216.220.225:8000/api/mobile

# Or use the script
./run_app.sh
```

## Current Status

✅ Flutter installed
✅ Dependencies installed  
✅ Code generated
✅ Ready to run
⚠️ Need to connect local emulator

