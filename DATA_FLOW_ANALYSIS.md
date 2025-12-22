# Data Flow & User Action Flow Analysis

## Web Version Flow

### 1. Order Creation Flow (POS)

**User Actions:**
1. Select Order Type (dine_in, takeaway, delivery, pickup) → Sets `orderTypeId`, `orderType`, `orderTypeSlug`
2. Select Table (for dine_in) → Sets `tableId`, `tableNo`
3. Browse Menu:
   - Filter by Category → Sets `filterCategories`
   - Search items → Sets `search`
   - Click menu item → Calls `addCartItems(itemId, variationCount, modifierCount)`
4. Add to Cart:
   - If item has variations → Shows variation modal → User selects variation
   - If item has modifiers → Shows modifier modal → User selects modifiers
   - Item added to `orderItemList` with key = `itemId`
   - Quantity stored in `orderItemQty[itemId]`
   - Variation stored in `orderItemVariation[itemId]`
   - Modifiers stored in `itemModifiersSelected[itemId]`
   - Item notes stored in `itemNotes[itemId]`
5. Adjust quantities → `addQty(key)` / `subQty(key)` → Recalculates `orderItemAmount[key]`
6. Set additional info:
   - Number of pax → `noOfPax`
   - Waiter → `selectWaiter`
   - Order note → `orderNote`
   - Discount → `discountType`, `discountValue`, `discountAmount`
7. Click action button:
   - **"KOT"** → `saveOrder('kot')` → Creates Order with `status='kot'` → Creates KOT(s)
   - **"Bill"** → `saveOrder('bill')` → Creates Order with `status='billed'` → Creates OrderItems
   - **"KOT + Bill + Payment"** → `saveOrder('kot','bill','payment')` → Creates Order → Creates KOT → Creates OrderItems → Shows payment modal

**Data Flow:**
```
User Input → Livewire Component State → Validation → Database Transaction
```

**Key State Variables:**
- `orderItemList`: Map of menu items (key = itemId or "kot_{kotId}_{itemId}")
- `orderItemQty`: Map of quantities
- `orderItemVariation`: Map of selected variations
- `itemModifiersSelected`: Map of modifier option IDs arrays
- `itemNotes`: Map of item-specific notes
- `orderItemAmount`: Map of calculated amounts (qty * (price + modifiers))
- `subTotal`: Sum of all item amounts
- `total`: SubTotal - discount + taxes + charges + tip + deliveryFee

**KOT Creation Logic:**
- If `status == 'kot'`:
  - If kitchen module enabled: Groups items by `kot_place_id` → Creates multiple KOTs
  - Else: Creates single KOT for all items
  - Each KOT gets: `kot_number`, `order_id`, `token_number`, `kitchen_place_id`, `note`
  - Each KotItem gets: `kot_id`, `menu_item_id`, `menu_item_variation_id`, `quantity`, `note`
  - Modifiers synced via `modifierOptions()->sync()`

**Order Creation Logic:**
- Creates Order with: `order_number`, `table_id`, `order_type_id`, `number_of_pax`, `waiter_id`, `status`, `order_status`
- If `status == 'billed'`: Creates OrderItems (one per cart item)
- If `status == 'kot'`: Creates KOTs (no OrderItems yet)

### 2. KOT Flow (Kitchen)

**User Actions:**
1. View KOTs list → Filtered by status, kitchen place, date range
2. Click KOT card → Shows KOT detail with items
3. Change KOT status:
   - `pending_confirmation` → `in_kitchen` → `food_ready` → `served`
4. Change item status (if enabled):
   - `pending` → `cooking` → `ready`
5. Cancel KOT/item → Requires cancel reason

**Data Flow:**
```
KOT List → KOT Detail → Status Update → Database Update → Real-time Refresh
```

**Status Transitions:**
- KOT: `pending_confirmation` → `in_kitchen` → `food_ready` → `served`
- Item: `pending` → `cooking` → `ready`

### 3. Order List Flow (Waiter)

**User Actions:**
1. View orders list → Filtered by status, waiter, date range
2. Click order → Shows order detail
3. View order detail:
   - Shows all KOTs for the order
   - Shows order items (if billed)
   - Shows totals, taxes, charges
   - Shows status progression
4. Update order status → Changes `order_status` (placed → confirmed → preparing → served)
5. Add payment → Opens payment modal

**Data Flow:**
```
Order List → Order Detail → Status Update → Payment → Database Update
```

## Mobile App Current Flow

### 1. Order Creation Flow

**Current Implementation:**
- Separate screen (`CreateOrderScreen`)
- Step-by-step form:
  1. Select table
  2. Set number of pax
  3. Select menu items (via `MenuSelector`)
  4. Add order note
  5. Click "Create Order"

**Issues:**
- ❌ No order type selection
- ❌ No real-time cart view
- ❌ No quantity adjustment in cart
- ❌ No variation/modifier selection
- ❌ No item notes
- ❌ No discount
- ❌ No waiter selection
- ❌ Creates order directly (no KOT option)

**Data Flow:**
```
Form Input → createOrder() → API POST /orders → Returns Order
```

### 2. KOT Flow

**Current Implementation:**
- List screen shows KOTs
- Detail screen shows items
- Can change KOT status

**Issues:**
- ❌ No item-level status management
- ❌ No cancel reason
- ❌ Limited status transitions

### 3. Order List Flow

**Current Implementation:**
- List screen shows orders
- Detail screen shows order info

**Issues:**
- ❌ No KOT display in order detail
- ❌ No order items display
- ❌ No status progression visualization
- ❌ No payment integration

## Key Differences

### 1. Order Creation
**Web:** Interactive POS-style interface with real-time cart
**Mobile:** Form-based, step-by-step

### 2. Cart Management
**Web:** Items in memory (Livewire state), real-time calculations
**Mobile:** Items in form state, calculated on submit

### 3. KOT Creation
**Web:** Automatic when saving with "KOT" action, grouped by kitchen place
**Mobile:** Not implemented (order created directly)

### 4. Status Management
**Web:** Both KOT-level and item-level statuses
**Mobile:** Only KOT-level statuses

### 5. Order Detail
**Web:** Shows KOTs, items, totals, status progression
**Mobile:** Basic order info only

## Recommendations for Mobile App

### 1. Order Creation Screen
- Add order type selection at the top
- Implement cart view (bottom sheet or side panel)
- Add quantity controls (+/-) in cart
- Add variation/modifier selection modals
- Add item notes input
- Add discount input
- Add waiter selection (for dine_in)
- Add action buttons: "Create KOT" and "Create Bill"

### 2. KOT Screen
- Add item-level status management
- Add cancel reason modal
- Show item status badges
- Add item status change buttons

### 3. Order Detail Screen
- Show all KOTs for the order
- Show order items (if billed)
- Show status progression timeline
- Show totals breakdown
- Add payment button

### 4. Data Flow Alignment
- Match API endpoints with web version
- Implement same status transitions
- Group KOTs by kitchen place
- Support item-level statuses

