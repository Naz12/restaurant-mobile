# Implementation Plan: Missing Features for KOT, POS, Orders Pages

## Overview
This document outlines the implementation plan for adding all missing features from the web version to the mobile app, ensuring feature parity while maintaining offline/peer-to-peer sync capabilities.

---

## Phase 1: Critical Business Features (Priority 1)

### 1.1 POS Screen Enhancements

#### Waiter Selection
- **Status**: Missing
- **Implementation**:
  - Create waiter provider/repository
  - Add waiter dropdown in POS cart section
  - Load waiters from API
  - Store selected waiter in order creation
  - Support offline: Cache waiters locally

#### Customer Selection
- **Status**: Missing (TODO comment exists)
- **Implementation**:
  - Create customer provider/repository
  - Add "Add Customer" button in POS cart section
  - Create customer selection modal/dialog
  - Support search and create new customer
  - Store customer_id in order creation

#### Delivery Executive Assignment
- **Status**: Missing
- **Implementation**:
  - Create delivery executive provider/repository
  - Add delivery executive selector (only for delivery orders)
  - Load available delivery executives from API
  - Store delivery_executive_id in order creation

#### Pickup Time Selection
- **Status**: Missing
- **Implementation**:
  - Add date/time picker widget
  - Show only for pickup orders
  - Validate future date/time
  - Store pickup_date in order creation

#### Extra Charges
- **Status**: Missing
- **Implementation**:
  - Load extra charges from settings API (based on order type)
  - Display extra charges in cart summary
  - Calculate and add to total
  - Support service charge, packaging fee, etc.
  - Store charges in order creation

#### Order Editing
- **Status**: Missing
- **Implementation**:
  - Add ability to open existing order in POS screen
  - Load order items into cart
  - Allow adding new items
  - Allow removing items
  - Allow updating quantities
  - Recalculate totals
  - Update order via API

#### Order Cancellation
- **Status**: Missing
- **Implementation**:
  - Add cancel button in order detail
  - Create cancel reason modal
  - Load cancel reasons from API
  - Support custom reason text
  - Call cancel API endpoint
  - Update table status if dine-in

### 1.2 KOT Screen Enhancements

#### KOT Cancellation with Reason
- **Status**: Missing (TODO comment exists)
- **Implementation**:
  - Add cancel button in KOT detail
  - Create cancel reason modal
  - Load cancel reasons from API (`/kots/cancel-reasons`)
  - Support custom reason text
  - Call cancel API endpoint
  - Update order totals if needed

#### KOT Item Cancellation with Reason
- **Status**: Missing
- **Implementation**:
  - Add cancel button for each item in KOT detail
  - Create cancel reason modal
  - Call cancel item API endpoint
  - Auto-update KOT status if all items cancelled
  - Recalculate order totals

#### Search Functionality
- **Status**: Missing
- **Implementation**:
  - Add search bar in KOT list
  - Search by KOT number, order number, waiter, table
  - Filter KOTs based on search query
  - Support offline: Search local database

#### Advanced Date Range Filtering
- **Status**: Missing
- **Implementation**:
  - Add date range picker
  - Support: today, current week, last week, last 7 days, current month, last month, current year, last year
  - Store preference locally
  - Filter KOTs by date range

#### Quantity Adjustment in KOT Detail
- **Status**: Missing
- **Implementation**:
  - Add quantity input field for each item
  - Allow updating quantity
  - Update KOT item quantity via API
  - Recalculate order totals

### 1.3 Orders Screen Enhancements

#### Order Detail - KOT Display
- **Status**: Missing
- **Implementation**:
  - Load KOTs for order
  - Display all KOTs with items
  - Show KOT status and details
  - Allow navigating to KOT detail

#### Order Detail - Full Item Details
- **Status**: Partial (shows basic items)
- **Implementation**:
  - Show all order items with full details
  - Display variations, modifiers, notes
  - Show item-level pricing
  - Display tax breakdown per item

#### Payment History
- **Status**: Missing
- **Implementation**:
  - Load payments for order (`/orders/{id}/payments`)
  - Display payment list with methods and amounts
  - Show payment timestamps
  - Display payment status

#### Advanced Date Range Filtering
- **Status**: Missing
- **Implementation**:
  - Same as KOT date range filtering
  - Apply to orders list

#### Order Type & Delivery App Filtering
- **Status**: Missing
- **Implementation**:
  - Add order type filter dropdown
  - Add delivery app filter dropdown
  - Filter orders by selected criteria

---

## Phase 2: Enhanced Functionality (Priority 2)

### 2.1 Tax System Enhancements

#### Item-Level Tax Calculation
- **Status**: Missing (only order-level SGST/CGST exists)
- **Implementation**:
  - Load tax settings from API
  - Calculate taxes per item based on item tax rates
  - Support tax inclusive/exclusive modes
  - Display tax breakup in cart
  - Store tax details per item

#### Tax Mode Support
- **Status**: Missing
- **Implementation**:
  - Load tax mode from restaurant settings
  - Support 'item' and 'order' tax modes
  - Calculate taxes accordingly
  - Display tax breakdown appropriately

### 2.2 Price Context System

#### Order Type Price Context
- **Status**: Missing
- **Implementation**:
  - Load menu items with order type context
  - Update prices when order type changes
  - Recalculate cart totals when order type changes
  - Show confirmation if items in cart

#### Modifier Price Context
- **Status**: Missing
- **Implementation**:
  - Update modifier prices based on order type
  - Recalculate item totals when order type changes

### 2.3 Table Management

#### Table Locking
- **Status**: Missing
- **Implementation**:
  - Lock table when selected in POS
  - Check table lock status before selection
  - Show lock status in table selection screen
  - Unlock table when order completed/cancelled
  - Support force unlock (admin)

#### Table Activity Tracking
- **Status**: Missing
- **Implementation**:
  - Update table activity when items added/removed
  - Track last activity timestamp
  - Display activity status

### 2.4 Real-time Updates

#### Enhanced Polling
- **Status**: Basic polling exists
- **Implementation**:
  - Configurable polling intervals (5s, 10s, 15s, 30s, 60s)
  - Auto-refresh toggle UI
  - Sound notifications for new orders/KOTs
  - New order popup notification

---

## Phase 3: UI/UX Improvements (Priority 3)

### 3.1 Loading States
- Skeleton loaders for lists
- Loading overlays for operations
- Progress indicators

### 3.2 Error Handling
- Error modals matching web version
- Validation messages
- Retry mechanisms

### 3.3 Visual Enhancements
- Menu item images
- Out of stock indicators
- Item type icons
- Status progression timeline

---

## Phase 4: Offline/Peer-to-Peer Sync Enhancements

### 4.1 Enhanced Peer-to-Peer Sync
- **Current**: Basic structure exists
- **Enhancements**:
  - Complete peer-to-peer sync implementation
  - Device discovery on local network
  - Data exchange protocol
  - Conflict resolution
  - Sync queue management for offline operations

### 4.2 Offline Data Management
- Store all operations locally when offline
- Queue sync operations
- Sync when internet available
- Prefer internet over peer-to-peer when available

---

## Implementation Order

### Week 1: Critical POS Features
1. Waiter selection
2. Customer selection
3. Delivery executive assignment
4. Pickup time selection
5. Extra charges
6. Order cancellation

### Week 2: KOT Features
1. KOT cancellation with reason
2. Item cancellation with reason
3. Search functionality
4. Advanced date range filtering
5. Quantity adjustment

### Week 3: Orders Features
1. Order detail enhancements (KOTs, items, payments)
2. Advanced filtering
3. Payment history
4. Order editing

### Week 4: Advanced Features
1. Item-level tax calculation
2. Order type price context
3. Table locking
4. Enhanced real-time updates

### Week 5: Offline/Sync
1. Complete peer-to-peer sync
2. Enhanced offline queue
3. Conflict resolution
4. Testing and optimization

---

## API Endpoints Needed

### Already Available:
- ✅ `/orders` - GET, POST
- ✅ `/orders/{id}` - GET, PUT
- ✅ `/orders/{id}/cancel` - POST
- ✅ `/kots` - GET
- ✅ `/kots/{id}` - GET
- ✅ `/kots/{id}/cancel` - POST
- ✅ `/kots/{kotId}/items/{itemId}/cancel` - POST
- ✅ `/kots/cancel-reasons` - GET
- ✅ `/orders/{orderId}/payments` - GET

### May Need to Add:
- `/waiters` - GET (list waiters)
- `/customers` - GET, POST (list/search customers, create)
- `/delivery-executives` - GET (list available executives)
- `/settings/extra-charges` - GET (get charges by order type)
- `/settings/tax-rates` - GET (get tax configuration)
- `/orders/{id}/kots` - GET (get KOTs for order)
- `/kots/{kotId}/items/{itemId}/quantity` - PUT (update quantity)

---

## Files to Create/Modify

### New Files:
- `lib/features/waiters/` - Waiter feature (providers, repositories, models)
- `lib/features/customers/` - Customer feature
- `lib/features/delivery_executives/` - Delivery executive feature
- `lib/features/settings/` - Settings feature (tax, charges, etc.)
- `lib/shared/widgets/date_range_picker.dart`
- `lib/shared/widgets/cancel_reason_modal.dart`
- `lib/shared/widgets/waiter_selector.dart`
- `lib/shared/widgets/customer_selector.dart`

### Files to Modify:
- `lib/features/orders/presentation/screens/pos_order_screen.dart` - Add all POS features
- `lib/features/kots/presentation/screens/kot_list_screen.dart` - Add search, date range
- `lib/features/kots/presentation/screens/kot_detail_screen.dart` - Add cancellation, quantity update
- `lib/features/orders/presentation/screens/order_list_screen.dart` - Add advanced filtering
- `lib/features/orders/presentation/screens/order_detail_screen.dart` - Add KOTs, payments, full details
- `lib/features/orders/data/repositories/order_repository.dart` - Add update, cancel methods
- `lib/features/kots/data/repositories/kot_repository.dart` - Add cancel, update quantity methods
- `lib/core/sync/peer_to_peer_sync.dart` - Complete implementation
- `lib/core/sync/sync_manager.dart` - Enhance sync logic

---

## Testing Checklist

### POS Screen:
- [ ] Waiter selection works
- [ ] Customer selection works
- [ ] Delivery executive assignment works
- [ ] Pickup time selection works
- [ ] Extra charges calculated correctly
- [ ] Order editing works
- [ ] Order cancellation works
- [ ] Offline order creation works
- [ ] Peer-to-peer sync works

### KOT Screen:
- [ ] KOT cancellation with reason works
- [ ] Item cancellation with reason works
- [ ] Search functionality works
- [ ] Date range filtering works
- [ ] Quantity adjustment works
- [ ] Offline KOT updates work
- [ ] Peer-to-peer sync works

### Orders Screen:
- [ ] Order detail shows KOTs
- [ ] Order detail shows full items
- [ ] Payment history displays
- [ ] Advanced filtering works
- [ ] Order editing works
- [ ] Offline order updates work

---

## Notes

- All features must work offline and sync when online
- Peer-to-peer sync should work in local network
- Prefer internet when available
- Match web version UI/UX patterns
- Use same dialog/modal patterns as web
- Follow same theme and styling

