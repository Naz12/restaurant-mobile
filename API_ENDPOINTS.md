# Mobile API Endpoints - Full URLs

## Base URL Configuration

The mobile API endpoints are prefixed with `/api/mobile`.

### Production URL
```
https://restaurant.akmicroservice.com/api/mobile
```

### Local Development URL
```
http://localhost:8000/api/mobile
```

---

## Quick Reference

### Authentication
- **Login:** `POST {BASE_URL}/auth/login`
- **Get User:** `GET {BASE_URL}/auth/user`
- **Logout:** `POST {BASE_URL}/auth/logout`

### Menu
- **Get Items:** `GET {BASE_URL}/menu/items`
- **Get Item:** `GET {BASE_URL}/menu/items/{id}`
- **Get Categories:** `GET {BASE_URL}/menu/categories`

### Tables
- **Get Tables:** `GET {BASE_URL}/tables`
- **Lock Table:** `POST {BASE_URL}/tables/{id}/lock`

### Orders
- **Get Orders:** `GET {BASE_URL}/orders`
- **Create Order:** `POST {BASE_URL}/orders`
- **Update Order:** `PUT {BASE_URL}/orders/{id}`

### KOTs
- **Get KOTs:** `GET {BASE_URL}/kots`
- **Confirm KOT:** `POST {BASE_URL}/kots/{id}/confirm`
- **Mark Ready:** `POST {BASE_URL}/kots/{id}/ready`

### Payments
- **Get Payments:** `GET {BASE_URL}/payments`
- **Create Payment:** `POST {BASE_URL}/payments`

### Sync
- **Pull Data:** `POST {BASE_URL}/sync/pull`
- **Push Data:** `POST {BASE_URL}/sync/push`
- **Sync Status:** `GET {BASE_URL}/sync/status`

---

## Example Full URLs

### Production Examples:
- Login: `https://restaurant.akmicroservice.com/api/mobile/auth/login`
- Menu Items: `https://restaurant.akmicroservice.com/api/mobile/menu/items`
- Create Order: `https://restaurant.akmicroservice.com/api/mobile/orders`

### Local Examples:
- Login: `http://localhost:8000/api/mobile/auth/login`
- Menu Items: `http://localhost:8000/api/mobile/menu/items`
- Create Order: `http://localhost:8000/api/mobile/orders`

---

## Flutter Configuration

Update in `lib/core/config/app_config.dart`:

```dart
static const String apiBaseUrl = 'https://restaurant.akmicroservice.com/api/mobile';
```

Or for local:
```dart
static const String apiBaseUrl = 'http://localhost:8000/api/mobile';
```
