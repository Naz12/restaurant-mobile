# Development Guide

This guide provides detailed information for developers working on the Restaurant Mobile application.

## 🚀 Getting Started Locally

### Initial Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd restaurant_mobile
   ```

2. **Install Flutter dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code** (required for Freezed, Drift, JSON serialization)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Configure API URL**
   - Edit `lib/core/config/app_config.dart`
   - Or use environment variable: `flutter run --dart-define=API_BASE_URL=your-url`

5. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Architecture

### Clean Architecture Pattern

The project follows Clean Architecture with three layers:

1. **Data Layer** (`features/*/data/`)
   - Models (Freezed)
   - Repositories (API + Local DB)
   - Data sources

2. **Domain Layer** (implicit)
   - Business logic in repositories
   - Models represent domain entities

3. **Presentation Layer** (`features/*/presentation/`)
   - Providers (Riverpod)
   - Screens (UI)
   - Widgets

### Feature Structure

Each feature follows this structure:

```
feature_name/
├── data/
│   ├── models/
│   │   └── feature_model.dart      # Freezed models
│   └── repositories/
│       └── feature_repository.dart  # API + Local DB
└── presentation/
    ├── providers/
    │   └── feature_provider.dart   # Riverpod providers
    └── screens/
        └── feature_screen.dart     # UI screens
```

## 🔧 Code Generation

### When to Run Code Generation

Run `flutter pub run build_runner build` after:

1. **Adding/Modifying Freezed Models**
   ```dart
   @freezed
   class MyModel with _$MyModel {
     // After adding this, run build_runner
   }
   ```

2. **Modifying Drift Database Schema**
   ```dart
   class MyTable extends Table {
     // After adding columns, run build_runner
   }
   ```

3. **Adding JSON Serialization**
   ```dart
   @JsonSerializable()
   class MyModel {
     // After adding, run build_runner
   }
   ```

### Code Generation Commands

```bash
# Build once
flutter pub run build_runner build

# Build with conflict resolution
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode (auto-rebuild on changes)
flutter pub run build_runner watch

# Clean and rebuild
flutter pub run build_runner clean
flutter pub run build_runner build
```

## 🎨 UI Development

### Theme Usage

Always use theme colors from `AppTheme`:

```dart
import 'package:restaurant_mobile/core/theme/app_theme.dart';

// Use theme colors
Container(
  color: AppTheme.primaryPurple,
  child: Text(
    'Hello',
    style: TextStyle(color: AppTheme.textPrimary),
  ),
)
```

### Responsive Design

Use `ResponsiveLayout` utilities:

```dart
import 'package:restaurant_mobile/shared/widgets/responsive_layout.dart';

// Check device type
if (ResponsiveLayout.isTablet(context)) {
  // Tablet layout
}

// Get responsive grid columns
final columns = ResponsiveLayout.getGridColumns(
  context,
  mobile: 2,
  tablet: 3,
  desktop: 4,
);
```

### Navigation

Use `AppScaffold` for screens that need sidebar:

```dart
import 'package:restaurant_mobile/shared/widgets/app_scaffold.dart';
import 'package:restaurant_mobile/core/navigation/navigation_config.dart';

AppScaffold(
  currentRoute: AppRoute.dashboard,
  child: YourContent(),
)
```

## 🔄 State Management with Riverpod

### Creating Providers

```dart
// Provider for repository
final myRepositoryProvider = Provider<MyRepository>((ref) {
  return MyRepository(
    apiClient: ref.read(apiClientProvider),
    database: ref.read(databaseProvider),
  );
});

// Provider for async data
final myDataProvider = FutureProvider<List<MyModel>>((ref) async {
  final repository = ref.read(myRepositoryProvider);
  return await repository.getData();
});

// StateNotifier for complex state
final myStateProvider = StateNotifierProvider<MyNotifier, MyState>((ref) {
  return MyNotifier(ref);
});
```

### Using Providers in Widgets

```dart
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsync = ref.watch(myDataProvider);
    
    return dataAsync.when(
      data: (data) => ListView(...),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
```

## 💾 Database Operations

### Drift Database Usage

```dart
// Get database instance
final database = ref.read(databaseProvider);

// Insert
await database.orders.insert(Order(
  id: null,
  orderNumber: 'ORD-001',
  // ...
));

// Query
final orders = await database.orders.select().get();

// Update
await (database.orders.update()
  ..where((t) => t.id.equals(orderId)))
  .write(Order(...));

// Delete
await (database.orders.delete()
  ..where((t) => t.id.equals(orderId)))
  .go();
```

## 🌐 API Integration

### Making API Calls

```dart
// In repository
final response = await apiClient.dio.get(
  '/orders',
  queryParameters: {
    'status': 'pending',
  },
);

final orders = (response.data['data']['orders'] as List)
    .map((json) => OrderModel.fromJson(json))
    .toList();
```

### Offline Support

Repositories should check connectivity:

```dart
final isOnline = await connectivityService.isOnline();

if (isOnline) {
  // Fetch from API
  final data = await apiClient.dio.get('/endpoint');
  // Save to local DB
  await _saveToLocal(data);
  return data;
} else {
  // Fetch from local DB
  return await _getFromLocal();
}
```

## 🔄 Sync System

### How Sync Works

1. **Online**: Direct API calls, no queue
2. **Offline**: Queue requests, use peer-to-peer sync
3. **Back Online**: Process queue automatically

### Adding to Sync Queue

```dart
// In repository when offline
if (!isOnline) {
  syncQueue.add(SyncQueueItem(
    method: 'POST',
    endpoint: '/orders',
    data: orderData,
  ));
}
```

## 🧪 Testing

### Unit Tests

```dart
// test/features/orders/order_repository_test.dart
void main() {
  test('should fetch orders from API when online', () async {
    // Arrange
    final repository = OrderRepository(...);
    
    // Act
    final orders = await repository.getOrders();
    
    // Assert
    expect(orders, isNotEmpty);
  });
}
```

### Widget Tests

```dart
// test/features/orders/order_list_screen_test.dart
void main() {
  testWidgets('should display orders list', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: OrderListScreen(),
        ),
      ),
    );
    
    expect(find.text('Orders'), findsOneWidget);
  });
}
```

## 🐛 Debugging

### Enable Verbose Logging

The app uses `logger` package. Check console for:
- API requests/responses
- Database operations
- Sync operations

### Common Debugging Steps

1. **Check connectivity**
   ```dart
   final isOnline = await connectivityService.isOnline();
   print('Is online: $isOnline');
   ```

2. **Check database**
   ```dart
   final orders = await database.orders.select().get();
   print('Orders in DB: ${orders.length}');
   ```

3. **Check sync queue**
   ```dart
   print('Queue items: ${syncQueue.length}');
   ```

## 📝 Code Style

### Naming Conventions

- **Files**: `snake_case.dart`
- **Classes**: `PascalCase`
- **Variables**: `camelCase`
- **Constants**: `lowerCamelCase` or `SCREAMING_SNAKE_CASE`

### File Organization

```dart
// 1. Imports (dart, flutter, packages, local)
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_theme.dart';
import '../models/my_model.dart';

// 2. Class definition
class MyWidget extends ConsumerWidget {
  // 3. Constructor
  const MyWidget({super.key});
  
  // 4. Build method
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Implementation
  }
  
  // 5. Private methods
  void _privateMethod() {}
}
```

## 🔍 Linting

Run linter:

```bash
flutter analyze
```

Fix auto-fixable issues:

```bash
dart fix --apply
```

## 📦 Building

### Debug Build

```bash
flutter build apk --debug
```

### Release Build

```bash
flutter build apk --release
```

### App Bundle (Play Store)

```bash
flutter build appbundle --release
```

## 🚀 Deployment Checklist

Before deploying:

- [ ] Run code generation
- [ ] Run tests: `flutter test`
- [ ] Run linter: `flutter analyze`
- [ ] Format code: `dart format .`
- [ ] Update version in `pubspec.yaml`
- [ ] Test on real device
- [ ] Check offline functionality
- [ ] Verify sync works
- [ ] Test all user roles

## 📚 Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Riverpod Documentation](https://riverpod.dev)
- [Drift Documentation](https://drift.simonbinder.eu)
- [Freezed Documentation](https://pub.dev/packages/freezed)

---

**Happy Coding! 🎉**

