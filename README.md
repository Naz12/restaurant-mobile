# Restaurant Mobile Application

Flutter mobile application for restaurant table management, designed for waiters, kitchen staff, and cashiers. This is the mobile/tablet version of the restaurant web application, featuring offline-first architecture with peer-to-peer sync capabilities.

## 🚀 Features

### Core Features
- **Dashboard**: Statistics and today's orders overview
- **POS (Point of Sale)**: Create orders with menu browsing, cart management, and tax calculations
- **Orders Management**: View and manage orders with grid layout and advanced filtering
- **KOT (Kitchen Order Ticket)**: Kitchen staff can view and manage KOTs with status tracking
- **Payment Processing**: Process payments with multiple methods, split bills, and tip support

### Technical Features
- **Offline-First**: Works completely offline with local SQLite database
- **Peer-to-Peer Sync**: Syncs with other devices on local network when offline
- **Online Sync**: Prefers internet connection when available, syncs every 5 seconds
- **Real-time Updates**: Push notifications for new orders and KOT status changes
- **Role-Based Access**: Different navigation and features for Waiters, Chefs, and Accountants
- **Responsive Design**: Tablet-first design that works on mobile devices

## 📋 Prerequisites

- Flutter SDK 3.0.0 or higher
- Dart SDK 3.0.0 or higher
- Android Studio / VS Code with Flutter extensions
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

## 🛠️ Local Development Setup

### 1. Clone the Repository

```bash
git clone <repository-url>
cd restaurant_mobile
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code

This project uses code generation for:
- Freezed models (immutable data classes)
- Drift database (type-safe SQL queries)
- JSON serialization

Run the code generator:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Note**: You may need to run this command multiple times if you encounter conflicts. Use `--delete-conflicting-outputs` flag to automatically resolve conflicts.

### 4. Configure API Base URL

Edit `lib/core/config/app_config.dart` and set your API base URL:

```dart
static const String apiBaseUrl = 'https://your-api-url.com/api/mobile';
```

Or use environment variable:

```bash
flutter run --dart-define=API_BASE_URL=https://your-api-url.com/api/mobile
```

### 5. Run the App

```bash
# For Android
flutter run

# For iOS (macOS only)
flutter run -d ios

# For a specific device
flutter devices  # List available devices
flutter run -d <device-id>
```

## 📱 Running on Android Emulator

### Setup ADB (Android Debug Bridge)

1. **Windows**: Install Android SDK Platform Tools and add to PATH
2. **macOS/Linux**: Usually included with Android Studio

### Connect Emulator

```bash
# List connected devices
adb devices

# If emulator is running but not showing, restart ADB
adb kill-server
adb start-server
```

### Run App

```bash
flutter run
```

## 🏗️ Project Structure

```
lib/
├── core/                      # Core functionality
│   ├── config/               # App configuration
│   │   └── app_config.dart   # API URLs, sync intervals, etc.
│   ├── database/             # Local database (Drift/SQLite)
│   │   └── database.dart     # Database schema and tables
│   ├── network/              # API client
│   │   └── api_client.dart   # Dio HTTP client with interceptors
│   ├── navigation/           # Navigation and routing
│   │   ├── app_router.dart   # Route definitions
│   │   └── navigation_config.dart  # Role-based navigation
│   ├── sync/                 # Sync system
│   │   ├── sync_manager.dart      # Main sync orchestrator
│   │   ├── sync_queue.dart        # Offline request queue
│   │   └── peer_to_peer_sync.dart # P2P sync implementation
│   ├── theme/                # App theming
│   │   └── app_theme.dart    # Dark theme with purple accents
│   └── providers/            # Global providers
│       └── providers.dart    # Riverpod provider definitions
│
├── features/                 # Feature modules (Clean Architecture)
│   ├── auth/                 # Authentication
│   │   ├── data/
│   │   │   ├── models/       # User models
│   │   │   └── repositories/ # Auth repository
│   │   └── presentation/
│   │       ├── providers/    # Auth providers
│   │       └── screens/      # Login screen
│   │
│   ├── dashboard/             # Dashboard feature
│   │   ├── data/
│   │   │   └── repositories/ # Dashboard repository
│   │   └── presentation/
│   │       ├── providers/    # Dashboard providers
│   │       └── screens/      # Dashboard screen
│   │
│   ├── orders/               # Order management
│   │   ├── data/
│   │   │   ├── models/       # Order models (Freezed)
│   │   │   └── repositories/ # Order repository
│   │   └── presentation/
│   │       ├── providers/    # Order providers
│   │       └── screens/      # Order screens (list, detail, POS)
│   │
│   ├── kots/                 # KOT management
│   │   ├── data/
│   │   │   ├── models/       # KOT models (Freezed)
│   │   │   └── repositories/ # KOT repository
│   │   └── presentation/
│   │       ├── providers/    # KOT providers
│   │       └── screens/      # KOT screens (list, detail)
│   │
│   ├── payments/             # Payment processing
│   │   ├── data/
│   │   │   └── repositories/ # Payment repository
│   │   └── presentation/
│   │       └── screens/      # Payment screen
│   │
│   ├── tables/               # Table management
│   │   ├── data/
│   │   │   ├── models/       # Table models
│   │   │   └── repositories/ # Table repository
│   │   └── presentation/
│   │       └── screens/      # Table selection screen
│   │
│   └── menu/                 # Menu browsing
│       ├── data/
│       │   ├── models/       # Menu item models
│       │   └── repositories/ # Menu repository
│       └── presentation/
│           ├── providers/    # Menu providers
│           └── screens/      # Menu screens
│
└── shared/                   # Shared code
    ├── widgets/              # Reusable widgets
    │   ├── app_scaffold.dart      # Main scaffold with sidebar
    │   ├── app_sidebar.dart       # Navigation sidebar
    │   ├── responsive_layout.dart # Responsive utilities
    │   ├── status_badge.dart      # Status badge widget
    │   └── sync_status_indicator.dart  # Sync status widget
    └── services/             # Shared services
        ├── connectivity_service.dart    # Network connectivity
        ├── notification_service.dart    # Push/local notifications
        └── permission_service.dart      # Permission handling
```

## 🎨 UI/UX Design

The app follows a **dark theme** with **purple accents** matching the web version:

- **Primary Color**: Purple (#9333EA)
- **Background**: Dark grey/black
- **Cards**: Medium grey with rounded corners
- **Status Colors**:
  - Green: PAID
  - Blue: BILLED
  - Purple: POS/KOT
  - Red: Pending/Cancelled
  - Yellow: Warning

### Navigation Structure

- **Dashboard**: Statistics and today's orders
- **POS**: Point of sale for creating orders
- **Orders**: 
  - **KOT** (for Chefs): Kitchen order tickets
  - **Orders** (for Waiters/Accountants): Order list

### Responsive Design

- **Tablet**: Persistent sidebar, 3-4 column grids
- **Mobile**: Collapsible drawer, 2 column grids
- **Breakpoints**: 768px (tablet), 1024px (desktop)

## 🔄 Sync Strategy

### When Online
- Direct API calls (no queue)
- Sync every 5 seconds
- Immediate updates
- Prefers internet over peer-to-peer

### When Offline
- Queue all changes locally
- Peer-to-peer sync every 2 seconds
- Local HTTP server on port 8080
- Network discovery via mDNS/Bonjour

### Manual Sync
- Sync button in app bar
- Manual trigger when automatic sync fails
- Shows sync status indicator

## 🔐 Authentication

The app supports:
- Email/Password login
- OTP (One-Time Password) login
- Token-based authentication (Laravel Sanctum)
- Auto-logout on token expiration
- Role-based navigation after login

## 📊 State Management

Uses **Riverpod** for state management:
- Type-safe providers
- Automatic dependency injection
- Easy testing
- Excellent for offline/online state handling

## 💾 Database

Uses **Drift** (formerly Moor) for local SQLite database:
- Type-safe queries
- Automatic code generation
- Excellent performance
- Migrations support

## 🌐 API Integration

### Base URL Configuration

Set in `lib/core/config/app_config.dart`:

```dart
static const String apiBaseUrl = 'https://your-api-url.com/api/mobile';
```

### Authentication

All API requests include authentication token in headers:
```
Authorization: Bearer <token>
```

### Endpoints

See `API_ENDPOINTS.md` for complete API documentation.

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/features/orders/order_test.dart

# Run with coverage
flutter test --coverage
```

## 🐛 Debugging

### Enable Debug Logging

The app uses `logger` package for logging. Check console output for:
- API requests/responses
- Sync operations
- Database operations
- Error messages

### Common Issues

1. **Code generation errors**: Run `flutter pub run build_runner build --delete-conflicting-outputs`
2. **Database errors**: Delete app data and reinstall
3. **Sync issues**: Check network connectivity and API URL
4. **Build errors**: Run `flutter clean && flutter pub get`

## 📦 Building for Production

### Android

```bash
# Build APK
flutter build apk --release

# Build App Bundle (for Play Store)
flutter build appbundle --release
```

### iOS

```bash
# Build IPA
flutter build ipa --release
```

## 🔧 Development Scripts

- `setup.sh`: Runs `flutter pub get` and code generation
- `run_app.sh`: Runs the app with proper configuration

## 📚 Additional Documentation

- `API_ENDPOINTS.md`: Complete API endpoint documentation
- `WEB_MOBILE_COMPARISON.md`: Comparison with web version
- `FLUTTER_SETUP.md`: Detailed Flutter setup instructions
- `PROJECT_SUMMARY.md`: Project architecture overview

## 🤝 Contributing

1. Create a feature branch
2. Make your changes
3. Run code generation: `flutter pub run build_runner build`
4. Run tests: `flutter test`
5. Commit with descriptive message
6. Push and create pull request

## 📝 Code Generation

This project requires code generation. Always run after:
- Adding new Freezed models
- Modifying Drift database schema
- Adding JSON serialization

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 🔄 Git Workflow

### Before Committing

1. Run code generation
2. Run tests
3. Check for linter errors: `flutter analyze`
4. Format code: `dart format .`

### Commit Message Format

```
feat: Add new feature
fix: Fix bug
docs: Update documentation
refactor: Code refactoring
test: Add tests
```

## 📞 Support

For issues or questions, please refer to:
- Project documentation files
- Web version implementation for reference
- API documentation

## 📄 License

[Your License Here]

---

**Last Updated**: December 2024
**Flutter Version**: 3.0.0+
**Dart Version**: 3.0.0+
