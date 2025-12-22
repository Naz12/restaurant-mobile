# Mobile App Test Credentials

## Test Users Created

Three test users have been created for testing the mobile application:

### 1. Waiter Account
- **Email:** `waiter.mobile@test.com`
- **Password:** `password123`
- **Role:** Waiter
- **Use Case:** Test order creation, table management, waiter requests

### 2. Chef Account
- **Email:** `chef.mobile@test.com`
- **Password:** `password123`
- **Role:** Chef
- **Use Case:** Test KOT management, kitchen order status updates

### 3. Cashier Account
- **Email:** `cashier.mobile@test.com`
- **Password:** `password123`
- **Role:** Cashier
- **Use Case:** Test payment processing, receipt generation

---

## How to Use

1. **Open the mobile app**
2. **Navigate to login screen**
3. **Enter one of the credentials above**
4. **Test the features specific to that role**

---

## Notes

- All users are associated with **Restaurant ID: 1** and **Branch ID: 1**
- The Cashier role was automatically created if it didn't exist
- All users have the same password for easy testing: `password123`
- You can change passwords through the web admin panel if needed

---

## Recreating Users

If you need to recreate these users, run:

```bash
cd /home/deploy_user_dagi/services/table_track/restaurant
php create-mobile-test-users.php
```

This script will:
- Create users if they don't exist
- Update existing users if they already exist
- Create the Cashier role if it doesn't exist

---

## API Testing

You can also test the API endpoints directly using these credentials:

```bash
# Login to get token
curl -X POST http://your-server/api/mobile/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "waiter.mobile@test.com",
    "password": "password123"
  }'

# Use the returned token for subsequent requests
```

---

## Security Note

⚠️ **These are test credentials only!** 
- Do not use these credentials in production
- Change passwords if deploying to production
- Consider removing these users after testing
