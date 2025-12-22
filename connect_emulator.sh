#!/bin/bash
# Script to connect local emulator to remote server

echo "=== Connecting to Local Emulator ==="
echo ""
echo "Please run these commands on your LOCAL PC first:"
echo ""
echo "1. Find your local PC IP address:"
echo "   Windows: ipconfig"
echo "   Linux/Mac: ifconfig or ip addr"
echo ""
echo "2. Enable network ADB on your emulator:"
echo "   adb tcpip 5555"
echo ""
echo "3. Note your local PC's IP address (e.g., 192.168.1.100)"
echo ""
read -p "Enter your local PC's IP address: " LOCAL_IP

if [ -z "$LOCAL_IP" ]; then
    echo "Error: IP address is required"
    exit 1
fi

echo ""
echo "Connecting to $LOCAL_IP:5555..."
adb connect $LOCAL_IP:5555

if [ $? -eq 0 ]; then
    echo "✅ Connected successfully!"
    echo ""
    echo "Checking devices..."
    flutter devices
else
    echo "❌ Connection failed"
    echo ""
    echo "Troubleshooting:"
    echo "1. Make sure emulator is running on your local PC"
    echo "2. Make sure you ran 'adb tcpip 5555' on your local PC"
    echo "3. Check firewall settings"
    echo "4. Make sure both devices are on the same network"
fi

