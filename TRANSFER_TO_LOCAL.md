# Quick Transfer Guide

## Files to Transfer

All files in `/home/deploy_user_dagi/services/table_track/restaurant_mobile` need to be copied to:
`C:\Users\nazrawi\Documents\development\dymy working\restaurant-mobile`

## Important Files

### Must Have:
- `pubspec.yaml` - Dependencies
- `lib/` - All Dart source code
- `android/` - Android configuration
- `ios/` - iOS configuration (if needed)
- `.gitignore` - Git ignore rules

### Documentation (Optional but helpful):
- `README.md`
- `API_ENDPOINTS.md`
- `TEST_CREDENTIALS.md`
- `UI_IMPLEMENTATION_GUIDE.md`
- `SETUP_CHECKLIST.md`

### Can Skip (will be regenerated):
- `build/` - Build artifacts
- `.dart_tool/` - Flutter tooling
- `*.g.dart` - Generated files
- `*.freezed.dart` - Generated files

## After Transfer

1. Update API URL in `lib/core/config/app_config.dart`
2. Run `flutter pub get`
3. Run `flutter pub run build_runner build --delete-conflicting-outputs`
4. Run `flutter run`
