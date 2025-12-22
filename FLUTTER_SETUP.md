# Flutter Mobile App Setup Guide

## Prerequisites

1. **Install Flutter SDK** (3.0.0 or higher)
   ```bash
   # On Ubuntu/Debian
   sudo snap install flutter --classic
   
   # Or download from https://flutter.dev/docs/get-started/install
   ```

2. **Verify Installation**
   ```bash
   flutter doctor
   ```

## Project Setup

1. **Navigate to project directory**
   ```bash
   cd /home/deploy_user_dagi/services/table_track/restaurant_mobile
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code (models, database, etc.)**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure API Base URL**
   
   Edit `lib/core/config/app_config.dart` and set your API base URL:
   ```dart
   static const String apiBaseUrl = 'http://your-server-url/api/mobile';
   ```
   
   Or set it via environment variable:
   ```bash
   flutter run --dart-define=API_BASE_URL=http://your-server-url/api/mobile
   ```

## Firebase Setup (for Push Notifications)

1. **Create Firebase Project**
   - Go to https://console.firebase.google.com
   - Create a new project
   - Add Android/iOS apps

2. **Download Configuration Files**
   - Android: `google-services.json` → `android/app/`
   - iOS: `GoogleService-Info.plist` → `ios/Runner/`

3. **Configure Firebase**
   - Follow FlutterFire setup guide: https://firebase.flutter.dev/

## Running the App

1. **Check connected devices**
   ```bash
   flutter devices
   ```

2. **Run on connected device/emulator**
   ```bash
   flutter run
   ```

3. **Run in release mode**
   ```bash
   flutter run --release
   ```

## Project Structure

```
lib/
├── core/                    # Core functionality
│   ├── config/             # App configuration
│   ├── database/           # Local database (Drift)
│   ├── network/            # API client, interceptors
│   ├── sync/               # Sync manager, queue, peer-to-peer
│   └── utils/              # Utilities
├── features/               # Feature modules
│   ├── auth/              # Authentication
│   ├── orders/            # Order management
│   ├── kots/              # KOT management
│   ├── payments/          # Payment processing
│   ├── tables/            # Table management
│   └── menu/              # Menu browsing
└── shared/                 # Shared code
    ├── models/            # Shared models
    ├── widgets/           # Reusable widgets
    └── services/          # Shared services
```

## Key Features

### Offline Support
- All data stored in local SQLite database
- Automatic queuing when offline
- Direct API calls when online

### Peer-to-Peer Sync
- Local network discovery
- HTTP server on port 8080
- Automatic sync every 2-3 seconds when offline

### Push Notifications
- Firebase Cloud Messaging
- Local notifications
- In-app and system notifications

### Manual Sync
- Sync button in app bar
- Manual sync when automatic sync fails
- Shows sync status

## Development Notes

- **State Management**: Riverpod
- **Local Database**: Drift (SQLite)
- **Networking**: Dio
- **UI**: Material Design 3, responsive for tablets

## Next Steps

1. Complete model implementations
2. Implement UI screens based on web app design
3. Add push notification handling
4. Test offline/peer-to-peer sync
5. Add error handling and retry logic

