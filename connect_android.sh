#!/bin/bash
# Script to connect Android emulator via SSH tunnel

echo "=== Connecting Android Emulator via SSH Tunnel ==="
echo ""
echo "Make sure you have an SSH tunnel running on your local PC:"
echo "  ssh -L 5037:localhost:5037 deploy_user_dagi@95.216.220.225"
echo ""
read -p "Press Enter after starting the SSH tunnel..."

echo ""
echo "Connecting to emulator via tunnel..."
adb connect localhost:5037

if [ $? -eq 0 ]; then
    echo "✅ Connected!"
    echo ""
    echo "Checking devices..."
    flutter devices
    echo ""
    echo "To run the app:"
    echo "  flutter run -d android --dart-define=API_BASE_URL=http://95.216.220.225:8000/api/mobile"
else
    echo "❌ Connection failed"
    echo ""
    echo "Make sure:"
    echo "  1. SSH tunnel is running: ssh -L 5037:localhost:5037 deploy_user_dagi@95.216.220.225"
    echo "  2. Emulator is running on your local PC"
    echo "  3. ADB is working on your local PC: adb devices"
fi


