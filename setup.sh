#!/bin/bash

# Restaurant Mobile App Setup Script
# This script helps set up the Flutter mobile app for testing

set -e

echo "=========================================="
echo "Restaurant Mobile App Setup"
echo "=========================================="
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "Flutter is not installed. Installing Flutter..."
    echo ""
    echo "Please run the following command to install Flutter:"
    echo "  sudo snap install flutter --classic"
    echo ""
    echo "Or download from: https://flutter.dev/docs/get-started/install"
    echo ""
    read -p "Press Enter after installing Flutter to continue..."
fi

# Verify Flutter installation
if command -v flutter &> /dev/null; then
    echo "✓ Flutter is installed"
    flutter --version
    echo ""
else
    echo "✗ Flutter is still not installed. Please install it first."
    exit 1
fi

# Navigate to project directory
cd "$(dirname "$0")"
echo "Current directory: $(pwd)"
echo ""

# Install dependencies
echo "Installing Flutter dependencies..."
if ! flutter pub get; then
    echo "Error: Failed to install dependencies"
    echo "Trying to fix dependency issues..."
    flutter pub upgrade
    flutter pub get
fi
echo ""

# Generate code
echo "Generating code (Freezed, Drift, JSON serialization)..."
echo "This may take a few minutes..."
flutter pub run build_runner build --delete-conflicting-outputs
echo ""

# Check for connected devices
echo "Checking for connected devices/emulators..."
flutter devices
echo ""

echo "=========================================="
echo "Setup Complete!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Configure API URL in lib/core/config/app_config.dart"
echo "2. Start an Android emulator or connect a device"
echo "3. Run: flutter run"
echo ""

