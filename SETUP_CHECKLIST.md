# Setup Checklist

Use this checklist to ensure everything is set up correctly.

## ✅ Pre-Setup

- [ ] Flutter SDK installed (`flutter --version` works)
- [ ] Flutter doctor shows no critical issues (`flutter doctor`)
- [ ] Android Studio / VS Code installed (optional but recommended)
- [ ] Device/Emulator available for testing

## ✅ Project Setup

- [ ] Navigated to project directory
- [ ] Dependencies installed (`flutter pub get` completed successfully)
- [ ] Code generated (`flutter pub run build_runner build` completed)
- [ ] No compilation errors (`flutter analyze` passes)

## ✅ Configuration

- [ ] API base URL configured in `app_config.dart`
- [ ] API URL points to correct server
- [ ] Server is running and accessible
- [ ] API endpoints are tested and working

## ✅ Firebase (Optional - for push notifications)

- [ ] Firebase project created
- [ ] Android app added to Firebase
- [ ] `google-services.json` downloaded and placed in `android/app/`
- [ ] iOS app added to Firebase (if developing for iOS)
- [ ] `GoogleService-Info.plist` downloaded and placed in `ios/Runner/`
- [ ] FlutterFire configured (`flutterfire configure`)

## ✅ Testing

- [ ] App runs on device/emulator
- [ ] Login screen appears
- [ ] Can login with valid credentials
- [ ] Navigation works after login
- [ ] API calls succeed
- [ ] Offline mode works (test with airplane mode)
- [ ] Sync works when coming back online

## ✅ UI Implementation Status

- [ ] Menu browsing implemented
- [ ] Table selection implemented
- [ ] Order creation flow complete
- [ ] KOT management UI complete
- [ ] Payment processing UI complete
- [ ] All screens responsive for tablets

## ✅ Documentation

- [ ] README.md reviewed
- [ ] FLUTTER_SETUP.md reviewed
- [ ] UI_IMPLEMENTATION_GUIDE.md reviewed
- [ ] IMPLEMENTATION_STATUS.md reviewed

---

## 🚨 Common Issues & Solutions

### Flutter not found
```bash
# Add Flutter to PATH
export PATH="$PATH:/path/to/flutter/bin"
# Or use snap installation
sudo snap install flutter --classic
```

### Build runner fails
```bash
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build --delete-conflicting-outputs
```

### API connection fails
- Check API URL in `app_config.dart`
- Verify server is running
- Check network connectivity
- Verify CORS settings on server

### Code generation errors
- Ensure all Freezed models have `part` declarations
- Check for syntax errors in model files
- Run `flutter clean` and try again

---

## 📞 Support

If you encounter issues:
1. Check error messages carefully
2. Review Flutter documentation
3. Check IMPLEMENTATION_STATUS.md for known issues
4. Review UI_IMPLEMENTATION_GUIDE.md for implementation details

