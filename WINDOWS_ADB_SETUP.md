# Setting Up ADB on Windows

## Option 1: Find ADB in Android Studio (Easiest)

If you have Android Studio installed, ADB is already there. You just need to add it to PATH or use the full path.

### Find ADB Location:

**Typical locations:**
- `C:\Users\YOUR_USERNAME\AppData\Local\Android\Sdk\platform-tools\adb.exe`
- `C:\Android\Sdk\platform-tools\adb.exe`
- `%LOCALAPPDATA%\Android\Sdk\platform-tools\adb.exe`

### Quick Check:

1. **Open File Explorer**
2. **Navigate to:** `C:\Users\YOUR_USERNAME\AppData\Local\Android\Sdk\platform-tools\`
3. **Check if `adb.exe` exists there**

### Use Full Path (Temporary):

Instead of just `adb`, use the full path:

```cmd
C:\Users\YOUR_USERNAME\AppData\Local\Android\Sdk\platform-tools\adb.exe tcpip 5555
```

### Add to PATH (Permanent):

1. **Copy the path** (e.g., `C:\Users\YOUR_USERNAME\AppData\Local\Android\Sdk\platform-tools`)

2. **Add to System PATH:**
   - Press `Win + R`
   - Type: `sysdm.cpl` → Enter
   - Go to "Advanced" tab → "Environment Variables"
   - Under "System variables", find "Path" → Edit
   - Click "New" → Paste the platform-tools path
   - Click OK on all dialogs

3. **Restart terminal/command prompt**

4. **Test:**
   ```cmd
   adb version
   ```

## Option 2: Install Platform Tools Only

If you don't have Android Studio:

1. **Download Android SDK Platform Tools:**
   - Visit: https://developer.android.com/studio/releases/platform-tools
   - Download for Windows
   - Extract to a folder (e.g., `C:\platform-tools`)

2. **Add to PATH** (same steps as above)

## Option 3: Use Cursor's Flutter Extension (No ADB Needed!)

**This is the EASIEST option if you're using Cursor:**

1. **Make sure Flutter extension is installed in Cursor**
2. **Make sure emulator is running on your local PC**
3. **In Cursor (connected to remote server):**
   - Press `F5` or use Run button
   - Cursor should automatically detect your local emulator
   - No ADB configuration needed!

## Option 4: Quick Test - Find Your ADB

**Run this in Command Prompt to find ADB:**

```cmd
where adb
```

If it finds it, note the path and use that.

Or search your entire C: drive:

```cmd
dir /s /b C:\adb.exe
```

This will take a while but will find it if it exists.

## Recommended: Use Cursor's Built-in Support

Since you're using Cursor with Remote-SSH, the **easiest way** is to:

1. **Make sure emulator is running on your local PC**
2. **In Cursor:**
   - Install Flutter extension (if not already)
   - Open the project
   - Press `F5` to run
   - Cursor should handle the connection automatically

This avoids all ADB configuration!

