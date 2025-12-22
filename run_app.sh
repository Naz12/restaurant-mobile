#!/bin/bash
# Script to run Flutter app with proper configuration

cd /home/deploy_user_dagi/services/table_track/restaurant_mobile

echo "=== Running Flutter App ==="
echo ""

# Check for devices
echo "Checking for connected devices..."
DEVICES=$(flutter devices 2>&1 | grep -E "(android|ios|chrome)" | head -1)

if [ -z "$DEVICES" ]; then
    echo "⚠️  No emulator/device detected"
    echo ""
    echo "Please connect your emulator first:"
    echo "  ./connect_emulator.sh"
    echo ""
    echo "Or if using Cursor, make sure:"
    echo "  1. Emulator is running on your local PC"
    echo "  2. Cursor Remote-SSH is connected"
    echo "  3. Flutter extension is installed in Cursor"
    exit 1
fi

echo "✅ Found device: $DEVICES"
echo ""

# Get API URL (default or from environment)
API_URL="${API_BASE_URL:-http://95.216.220.225:8000/api/mobile}"

echo "Using API URL: $API_URL"
echo ""
echo "Starting app..."
echo ""

# Run the app
flutter run --dart-define=API_BASE_URL=$API_URL

