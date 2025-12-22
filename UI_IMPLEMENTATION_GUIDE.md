# UI Implementation Guide & Setup Instructions

## 📋 Specific UI Implementations Needed

### 1. **Menu Browsing & Selection** (Priority: HIGH)

#### What's Needed:
- **Menu Categories Screen**: Display menu items grouped by categories
- **Menu Item Grid/List**: Show items with images, names, prices
- **Menu Item Detail Screen**: Full item details with:
  - Item image
  - Description
  - Base price
  - Variations (if any) - e.g., Small/Medium/Large
  - Modifier groups (if any) - e.g., "Add-ons", "Toppings"
  - Modifier options within each group
  - Quantity selector
  - Add to cart button

#### API Endpoints to Use:
- `GET /api/mobile/menu/items` - Get all menu items
- `GET /api/mobile/menu/items/{id}` - Get single menu item details
- `GET /api/mobile/menu/categories` - Get categories

#### UI Flow:
1. User taps "Select Menu Items" button
2. Opens full-screen menu browser
3. Shows categories as tabs or sidebar
4. User browses items, taps item to see details
5. In detail screen: select variation, add modifiers, set quantity
6. Tap "Add to Order" → item added to order cart
7. Return to create order screen with item in list

#### Files to Create/Update:
- `lib/features/menu/presentation/screens/menu_browse_screen.dart`
- `lib/features/menu/presentation/screens/menu_item_detail_screen.dart`
- `lib/features/menu/presentation/widgets/menu_item_card.dart`
- `lib/features/menu/presentation/widgets/modifier_selector.dart`
- `lib/features/menu/presentation/widgets/variation_selector.dart`
- `lib/features/menu/data/models/menu_item_model.dart`
- `lib/features/menu/data/repositories/menu_repository.dart`
- `lib/features/menu/presentation/providers/menu_provider.dart`

---

### 2. **Table Selection** (Priority: HIGH)

#### What's Needed:
- **Table Grid/List**: Display tables organized by areas
- **Table Status Indicators**: 
  - Available (green)
  - Occupied (red)
  - Reserved (yellow)
  - Locked (gray)
- **Area Filtering**: Filter tables by area/zone
- **Table Details**: Show table code, capacity, current status

#### API Endpoints to Use:
- `GET /api/mobile/tables` - Get all tables
- `GET /api/mobile/tables/{id}` - Get table details
- `GET /api/mobile/tables/{id}/active-order` - Check if table has active order

#### UI Flow:
1. User taps table selector
2. Opens dialog or bottom sheet with table grid
3. Shows tables grouped by areas (if areas exist)
4. User taps a table → table selected
5. If table is occupied, show warning but allow selection
6. Return to create order screen with selected table

#### Files to Create/Update:
- `lib/features/tables/presentation/screens/table_selection_screen.dart`
- `lib/features/tables/presentation/widgets/table_selector.dart` (update existing)
- `lib/features/tables/presentation/widgets/table_card.dart`
- `lib/features/tables/data/models/table_model.dart`
- `lib/features/tables/data/repositories/table_repository.dart`
- `lib/features/tables/presentation/providers/table_provider.dart`

---

### 3. **Order Creation Flow Enhancement** (Priority: MEDIUM)

#### What's Needed:
- **Order Cart Summary**: Show selected items with quantities
- **Item Editing**: Edit quantity, remove items, modify modifiers
- **Order Notes**: Add order-level notes
- **Order Type Selection**: Select order type (dine-in, takeaway, delivery)
- **Total Calculation**: Show subtotal, tax, total

#### Current Status:
- Basic structure exists in `create_order_screen.dart`
- Needs integration with menu and table selectors

#### Files to Update:
- `lib/features/orders/presentation/screens/create_order_screen.dart` (enhance existing)

---

### 4. **KOT Item Status Management** (Priority: MEDIUM)

#### What's Needed:
- **Item Status Buttons**: Quick buttons to update item status
  - Preparing → Ready
  - Ready → Served
- **Bulk Actions**: Mark all items in KOT as ready
- **Visual Status Indicators**: Color-coded status badges

#### Current Status:
- Basic status update exists in `kot_detail_screen.dart`
- Needs better UI/UX

#### Files to Update:
- `lib/features/kots/presentation/screens/kot_detail_screen.dart` (enhance existing)

---

### 5. **Payment Processing UI** (Priority: MEDIUM)

#### What's Needed:
- **Order Summary**: Show order details before payment
- **Payment Method Selection**: Cash, Card, Split payment
- **Amount Input**: Payment amount with change calculation
- **Tip Input**: Optional tip amount
- **Receipt Preview**: Show receipt before finalizing
- **Payment Confirmation**: Success screen after payment

#### Current Status:
- Basic payment screen exists
- Needs order summary and receipt display

#### Files to Create/Update:
- `lib/features/payments/presentation/screens/payment_screen.dart` (enhance existing)
- `lib/features/payments/presentation/widgets/receipt_preview.dart`
- `lib/features/payments/presentation/widgets/payment_method_selector.dart`

---

### 6. **Receipt Display** (Priority: LOW)

#### What's Needed:
- **Receipt Screen**: Display formatted receipt
- **Print Option**: Share/print receipt (if printer available)
- **Receipt Details**: Order number, items, totals, payment method

#### API Endpoints to Use:
- `GET /api/mobile/orders/{id}/receipt` - Get order receipt
- `GET /api/mobile/payments/{id}/receipt` - Get payment receipt

#### Files to Create:
- `lib/features/orders/presentation/screens/receipt_screen.dart`
- `lib/features/payments/presentation/screens/receipt_screen.dart`

---

## 🚀 Setup Instructions

### Step 1: Install Flutter SDK

```bash
# On Ubuntu/Debian
sudo snap install flutter --classic

# Or download from https://flutter.dev/docs/get-started/install
# Extract and add to PATH

# Verify installation
flutter doctor
```

**Expected Output:**
- Flutter SDK installed
- Android toolchain (if developing for Android)
- iOS toolchain (if developing for iOS - Mac only)
- VS Code or Android Studio (optional but recommended)

---

### Step 2: Navigate to Project

```bash
cd /home/deploy_user_dagi/services/table_track/restaurant_mobile
```

---

### Step 3: Install Dependencies

```bash
flutter pub get
```

**This will:**
- Download all packages listed in `pubspec.yaml`
- Resolve dependencies
- Create `pubspec.lock` file

**Expected Output:**
- "Running pub get..."
- "Resolving dependencies..."
- "Got dependencies!"

---

### Step 4: Generate Code

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**This will generate:**
- Freezed model files (`.freezed.dart`, `.g.dart`)
- Drift database code
- JSON serialization code

**Expected Output:**
- "Generating build script..."
- "Building..."
- "Succeeded after X seconds"

**Note:** This step is CRITICAL - the app won't compile without generated code.

---

### Step 5: Configure API Base URL

**File:** `lib/core/config/app_config.dart`

**Change:**
```dart
static const String apiBaseUrl = 'http://localhost:8000/api/mobile';
```

**To your server URL:**
```dart
static const String apiBaseUrl = 'http://your-server-ip:8000/api/mobile';
// Or
static const String apiBaseUrl = 'https://your-domain.com/api/mobile';
```

**Alternative:** Use environment variable:
```bash
flutter run --dart-define=API_BASE_URL=http://your-server/api/mobile
```

---

### Step 6: Firebase Setup (For Push Notifications)

#### 6.1 Create Firebase Project
1. Go to https://console.firebase.google.com
2. Create new project
3. Add Android app (get package name from `android/app/build.gradle`)
4. Add iOS app (if developing for iOS)

#### 6.2 Download Configuration Files
- **Android**: Download `google-services.json`
  - Place in: `android/app/google-services.json`
- **iOS**: Download `GoogleService-Info.plist`
  - Place in: `ios/Runner/GoogleService-Info.plist`

#### 6.3 Configure Firebase in Flutter
```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase
flutterfire configure
```

---

### Step 7: Check for Connected Devices

```bash
flutter devices
```

**Expected Output:**
- List of connected devices (emulators, physical devices)
- Example: "iPhone 14 Pro (mobile) • ABC123..."
- Example: "sdk gphone64 arm64 (mobile) • emulator-5554..."

---

### Step 8: Run the App

```bash
# Run on connected device/emulator
flutter run

# Or run in release mode
flutter run --release

# Or run with specific device
flutter run -d <device-id>
```

**Expected Behavior:**
- App builds and installs on device
- Login screen appears
- Can test authentication

---

### Step 9: Test Offline Functionality

1. **Enable Airplane Mode** on device
2. **Try creating an order** - should work offline
3. **Check sync queue** - order should be queued
4. **Disable Airplane Mode** - order should sync automatically

---

## 📱 UI Design Guidelines

### Tablet Optimization

1. **Layout:**
   - Use `GridView` for menu items (2-3 columns)
   - Use `Row` layouts for wide screens
   - Use `Expanded` widgets for flexible layouts

2. **Touch Targets:**
   - Minimum 48x48 dp for buttons
   - Larger for tablet (56x56 dp recommended)

3. **Typography:**
   - Larger font sizes for tablets
   - Use Material Design 3 typography scale

4. **Spacing:**
   - More padding on tablets
   - Use `MediaQuery` to detect screen size

### Responsive Design

```dart
// Example: Responsive grid
LayoutBuilder(
  builder: (context, constraints) {
    final crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      // ...
    );
  },
)
```

---

## 🔧 Troubleshooting

### Issue: `flutter pub get` fails
**Solution:**
- Check internet connection
- Run `flutter pub cache repair`
- Check `pubspec.yaml` for syntax errors

### Issue: `build_runner` fails
**Solution:**
- Delete `build/` folder
- Run `flutter clean`
- Run `flutter pub get` again
- Run `build_runner` with `--delete-conflicting-outputs`

### Issue: App won't compile
**Solution:**
- Ensure code generation completed successfully
- Check for missing imports
- Run `flutter analyze` to find errors

### Issue: API calls fail
**Solution:**
- Verify API base URL is correct
- Check server is running
- Check network connectivity
- Verify authentication token is being sent

### Issue: Offline mode not working
**Solution:**
- Check database initialization
- Verify sync queue is working
- Check connectivity service

---

## 📝 Implementation Priority

1. **HIGH Priority:**
   - Menu browsing & selection
   - Table selection
   - Order creation flow completion

2. **MEDIUM Priority:**
   - KOT item status UI improvements
   - Payment processing UI enhancements
   - Receipt display

3. **LOW Priority:**
   - UI polish and animations
   - Advanced filtering
   - Search functionality

---

## 🎯 Next Steps After Setup

1. ✅ Complete setup (Steps 1-8)
2. ✅ Test basic authentication
3. ✅ Implement menu browsing UI
4. ✅ Implement table selection UI
5. ✅ Complete order creation flow
6. ✅ Test offline functionality
7. ✅ Test peer-to-peer sync
8. ✅ Polish UI for tablets

---

## 📚 Additional Resources

- **Flutter Documentation**: https://flutter.dev/docs
- **Riverpod Documentation**: https://riverpod.dev
- **Drift Documentation**: https://drift.simonbinder.eu
- **Material Design 3**: https://m3.material.io

---

## ⚠️ Important Notes

1. **Code Generation is Required**: The app uses Freezed and Drift which require code generation. Always run `build_runner` after adding new models.

2. **API URL Must Be Set**: The app won't connect to backend without correct API URL.

3. **Firebase is Optional**: Push notifications won't work without Firebase, but app will function otherwise.

4. **Offline Mode**: Works automatically - no additional setup needed once database is initialized.

5. **Tablet Optimization**: UI is designed for tablets but will work on phones with responsive layouts.

