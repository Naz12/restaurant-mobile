# Restaurant Mobile App - Setup Instructions

## Prerequisites

1. **Flutter SDK** (3.0.0 or higher)
2. **Android Studio** (for Android emulator) or **Xcode** (for iOS simulator - Mac only)
3. **Git** (already installed)

## Step 1: Install Flutter

### On Ubuntu/Debian:
```bash
sudo snap install flutter --classic
```

### Verify Installation:
```bash
flutter doctor
```

This will show what's installed and what's missing. Install any missing components.

## Step 2: Navigate to Project

```bash
cd /home/deploy_user_dagi/services/table_track/restaurant_mobile
```

## Step 3: Install Dependencies

```bash
flutter pub get
```

This downloads all packages listed in `pubspec.yaml`.

## Step 4: Generate Code

**CRITICAL STEP** - The app won't compile without this:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

This generates:
- Freezed model files (`.freezed.dart`, `.g.dart`)
- Drift database code
- JSON serialization code

**Note:** This may take 2-5 minutes depending on your system.

## Step 5: Configure API Base URL

Edit `lib/core/config/app_config.dart`:

```dart
static const String apiBaseUrl = 'http://YOUR_SERVER_IP:8000/api/mobile';
// Or if using domain:
// static const String apiBaseUrl = 'https://your-domain.com/api/mobile';
```

**For local testing on emulator:**
- If backend is on same machine: Use `http://10.0.2.2:8000/api/mobile` (Android emulator)
- If backend is on different machine: Use `http://MACHINE_IP:8000/api/mobile`

**Alternative:** Use environment variable when running:
```bash
flutter run --dart-define=API_BASE_URL=http://your-server/api/mobile
```

## Step 6: Set Up Android Emulator

### Option A: Using Android Studio
1. Open Android Studio
2. Go to Tools → Device Manager
3. Click "Create Device"
4. Select a device (e.g., Pixel 5)
5. Download a system image (API 30 or higher recommended)
6. Finish setup
7. Start the emulator

### Option B: Using Command Line
```bash
# List available emulators
flutter emulators

# Launch an emulator
flutter emulators --launch <emulator_id>
```

## Step 7: Check Connected Devices

```bash
flutter devices
```

You should see your emulator or connected device listed.

## Step 8: Run the App

```bash
# Run in debug mode
flutter run

# Run in release mode (faster)
flutter run --release

# Run on specific device
flutter run -d <device-id>
```

## Step 9: Test the App

1. **Login Screen** should appear
2. Use credentials from your backend database
3. Test features:
   - Login (email/password or OTP)
   - Browse menu
   - Select tables
   - Create orders
   - View KOTs
   - Process payments

## Troubleshooting

### Issue: `flutter pub get` fails
**Solution:**
- Check internet connection
- Run `flutter pub cache repair`
- Check `pubspec.yaml` for syntax errors

### Issue: `build_runner` fails
**Solution:**
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Issue: App won't compile
**Solution:**
- Ensure code generation completed successfully
- Check for missing imports
- Run `flutter analyze` to find errors
- Check that all `.freezed.dart` and `.g.dart` files exist

### Issue: API calls fail
**Solution:**
- Verify API base URL is correct
- Check server is running: `curl http://your-server/api/mobile/auth/login`
- Check network connectivity
- Verify authentication token is being sent
- Check server logs for errors

### Issue: Can't connect to API from emulator
**Solution:**
- Android emulator: Use `10.0.2.2` instead of `localhost`
- iOS simulator: Use `localhost` or actual IP
- Check firewall settings
- Verify backend CORS settings allow mobile app

### Issue: Offline mode not working
**Solution:**
- Check database initialization in `main.dart`
- Verify sync queue is working
- Check connectivity service

## Quick Setup Script

You can also use the automated setup script:

```bash
cd /home/deploy_user_dagi/services/table_track/restaurant_mobile
./setup.sh
```

## Development Workflow

1. **Make code changes**
2. **Hot reload**: Press `r` in terminal (or use IDE hot reload)
3. **Hot restart**: Press `R` in terminal
4. **Stop app**: Press `q` in terminal

## Testing Offline Functionality

1. Start the app
2. Enable Airplane Mode on emulator/device
3. Try creating an order - should work offline
4. Check sync queue - order should be queued
5. Disable Airplane Mode - order should sync automatically

## Next Steps After Setup

1. ✅ Complete setup (Steps 1-8)
2. ✅ Test basic authentication
3. ✅ Test menu browsing
4. ✅ Test table selection
5. ✅ Test order creation
6. ✅ Test offline functionality
7. ✅ Test peer-to-peer sync (if multiple devices)

## Additional Resources

- **Flutter Documentation**: https://flutter.dev/docs
- **Riverpod Documentation**: https://riverpod.dev
- **Drift Documentation**: https://drift.simonbinder.eu
- **API Documentation**: See `/restaurant/API_DOCUMENTATION.md`

## Important Notes

1. **Code Generation is Required**: Always run `build_runner` after adding new models
2. **API URL Must Be Set**: The app won't connect without correct API URL
3. **Firebase is Optional**: Push notifications won't work without Firebase, but app functions otherwise
4. **Offline Mode**: Works automatically once database is initialized
5. **Tablet Optimization**: UI is designed for tablets but works on phones

