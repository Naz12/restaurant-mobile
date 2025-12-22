# Restaurant Mobile Application

Flutter mobile application for restaurant table management, designed for waiters, kitchen staff, and cashiers.

## Features

- **Order Management**: Create, view, and manage orders
- **KOT Management**: Kitchen staff can view and update KOT status
- **Payment Processing**: Cashiers can process payments
- **Offline Support**: Works completely offline with local database
- **Peer-to-Peer Sync**: Syncs with other devices on local network when offline
- **Real-time Updates**: Push notifications for new orders and KOT status changes
- **Manual Sync**: Manual sync option when automatic sync fails

## Architecture

- **State Management**: Riverpod
- **Local Database**: Drift (SQLite)
- **Networking**: Dio with interceptors
- **Offline Queue**: Automatic queuing when offline, direct API calls when online

## Project Structure

```
lib/
├── core/
│   ├── config/
│   ├── database/
│   ├── network/
│   ├── sync/
│   └── utils/
├── features/
│   ├── auth/
│   ├── orders/
│   ├── kots/
│   ├── payments/
│   ├── tables/
│   └── menu/
├── shared/
│   ├── models/
│   ├── widgets/
│   └── services/
└── main.dart
```

## Setup Instructions

1. Install Flutter SDK (3.0.0 or higher)
2. Run `flutter pub get`
3. Run `flutter pub run build_runner build` to generate code
4. Configure API base URL in `lib/core/config/app_config.dart`
5. Run the app: `flutter run`

## API Base URL

The app connects to: `http://your-server-url/api/mobile`

Configure this in the app config file.

