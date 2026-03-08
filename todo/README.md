# Blueprints TODO — Module Gaps for Phase 1

Analysis of modules needed to fully support all 79 business types across 12 sectors.

**82 modules exist.** This document identifies what's missing or needs extension.

---

## Summary

| Category | Count | Status |
|----------|-------|--------|
| New modules to create | 4 | Pending |
| Existing modules to extend | 6 | Pending |
| Compliance auto-activation | 1 | Pending |
| Country-specific compliance modules | 8+ | Phase 2 (only ES ready now) |
| Sector-specific config (no module needed) | Many | Via business_type JSON |

---

## New Modules Needed

### 1. `repair_shop` — Repair & Workshop Management
**Priority:** HIGH — Blocks: auto_repair, electronics_repair, bicycle_shop
**Sectors:** Manufacturing, Retail

Missing functionality that `maintenance` doesn't cover (maintenance = internal asset upkeep, repair_shop = customer-facing repair jobs):

- **Repair orders** (intake → diagnosis → quote → repair → delivery)
- **Device/vehicle records** (customer's equipment history)
- **Spare parts** inventory (linked to inventory module)
- **Warranty tracking** (manufacturer + shop warranty)
- **Diagnostics** checklist per device type
- **MOT / ITV** (vehicle inspections for auto_repair)

**Models:** RepairOrder, DeviceRecord, SparePartUsage, WarrantyRecord
**Depends on:** inventory, customers, invoicing

### 2. `delivery` — Delivery & Takeaway
**Priority:** HIGH — Blocks: all hospitality types, some retail
**Sectors:** Hospitality, Retail

- **Takeaway orders** (counter pickup, delivery)
- **Delivery zones** with pricing
- **Driver assignment** (internal or external)
- **Order tracking** (preparing → ready → in transit → delivered)
- **Packaging management**
- **Self-order kiosk** mode (simplified POS view)
- **Platform integration hooks** (Glovo, UberEats, JustEat — Phase 2)

**Models:** DeliveryZone, DeliveryOrder, Driver
**Depends on:** orders, cash_register, customers

### 3. `timesheets` — Time Tracking & Billing
**Priority:** MEDIUM — Blocks: consulting, law_firm, tax_advisory, design_studio, marketing
**Sectors:** Professional Services

- **Time entries** (manual + timer)
- **Billable vs non-billable** hours
- **Client/project time allocation**
- **Hourly rate management** (per employee, per project, per client)
- **Timesheet approval** workflow
- **Invoice generation** from time entries

**Models:** TimeEntry, HourlyRate, TimesheetApproval
**Depends on:** projects, invoicing, staff

### 4. `waitlist` — Walk-in Queue Management
**Priority:** LOW — Blocks: hair_salon, barber_shop, all hospitality
**Sectors:** Personal Services, Hospitality

- **Walk-in queue** (customer name + party size + estimated wait)
- **SMS/WhatsApp notification** when table/turn ready
- **Queue display** (public screen mode)
- **Priority management** (VIP, reservations vs walk-ins)
- **Average wait time** tracking

**Models:** WaitlistEntry, WaitlistConfig
**Depends on:** customers (optional), notifications

---

## Existing Modules to Extend

### 5. `subscriptions` → Add Membership Features
**Priority:** HIGH — Blocks: gym, pilates_yoga, sports_club, coworking, escape_room
**Current:** Plan, Subscription (recurring billing)
**Missing:**
- Access control integration (check-in/check-out at door)
- Credits/session packs (10 classes for €80)
- Freeze/pause membership
- Family/group memberships
- Auto-renewal reminders

### 6. `course_mgmt` → Extend for All Education Types
**Priority:** HIGH — Blocks: academy, driving_school, music_school, dance_school, language_school
**Current:** Course, ClassSession
**Missing:**
- Capacity per class (limited spots)
- Instructor assignment per session
- Makeup classes / rescheduling
- Exam/evaluation tracking
- Certificates generation (linked to doc_templates)
- Practice hour logging (driving_school)
- Level/grade progression (language_school: CEFR levels)

### 7. `maintenance` → Extend for Construction Service Contracts
**Priority:** MEDIUM — Blocks: installer, locksmith, maintenance_company
**Current:** MaintenanceOrder (internal CMMS)
**Missing:**
- Customer-facing service contracts (SLA, periodic visits)
- Emergency/24h priority flag
- Subcontractor assignment
- Certification tracking (installer certifications)
- OHS (occupational health/safety) checklist per job

### 8. `kitchen` → Extend Menu Variants
**Priority:** MEDIUM — Blocks: pizzeria, sushi_restaurant, bakery, coffee_shop
**Current:** KDS, kitchen areas, order routing
**Missing:**
- Recipe/BOM management (ingredients → dish, with cost calculation)
- Menu variants (half-and-half pizza, size variants)
- Wine by-the-glass management (open bottle stock tracking)
- Daily specials / reduced menu mode
- Production batches (bakery: morning production plan)

### 9. `customers` → Extend Client Profiles
**Priority:** LOW — Blocks: beauty_center, hair_salon, nutrition, spa
**Current:** Customer model with basic fields
**Missing:**
- Custom profile fields per business type (pet profiles for dog_grooming, weight/measures for nutrition, skin profile for beauty_center)
- Before/after photos (linked to file_manager)
- Session history with notes
- Consent form tracking (linked to esign)
- Client formulas (hair_salon: color formulas)

### 10. `inventory` → Add Scale & Traceability Features
**Priority:** LOW — Blocks: fruit_shop, butcher_shop, fish_shop, gourmet
**Current:** Product, Stock, Locations
**Missing:**
- Scale/weight integration (via ERPlora Bridge — HW device)
- Origin traceability (fish: catch zone, fruit: farm/region)
- Allergen management (product-level allergen tags)
- Expiry date management with alerts
- Cut-to-measure / butchering yield tracking

---

## NOT Needing New Modules (existing coverage)

These features are covered by existing modules or are business-type-specific configuration:

| Feature | Covered By |
|---------|-----------|
| Appointments / Online booking | `appointments`, `online_booking` |
| Reservations / Room booking | `reservations` |
| Table management | `tables` |
| Quotes / Budgets | `quotes` |
| Contracts | `contracts` |
| Field service / Routes | `field_service` |
| Loyalty / Gift cards | `loyalty`, `gift_cards` |
| E-commerce | `ecommerce`, `marketplace_connect` |
| Document templates | `doc_templates` |
| Digital signatures | `esign` |
| Rentals (bikes, equipment) | `rentals` |
| Student management | `student_mgmt` |
| Staff scheduling | `schedules` |
| Feedback / Reviews | `feedback` |
| Surveys | `surveys` |
| Training | `training` |
| Support tickets | `support` |

---

## Sector-Specific Features (configuration, not modules)

These are handled via `sector_features` in the business_type JSON and become UI configuration options, not separate Django apps:

- **Hospitality:** Late-night hours, seasonal open/close, WiFi lounge, offline priority
- **Retail:** Christmas seasonality, seasonal collections, age classification, ISBN
- **Personal Services:** Artist portfolio, phototype profile, encrypted notes
- **Construction:** Before/after photos, mobile stock
- **Education:** Show costumes, online/hybrid mode
- **Agriculture:** Greenhouses, plant catalog, seasonal production
- **Entertainment:** Rooms/games, group bookings, availability calendar
- **Media:** Digital delivery
- **Rental:** GPS fleet (future)

---

## Compliance Modules (country-level, not sector-level)

Compliance is **orthogonal to business type** — determined by country, not sector.
See [11-compliance-auto-activation.md](11-compliance-auto-activation.md) for full details.

### How it works

1. User selects country in Setup Step 1 → `HubConfig.country_code`
2. `blueprints/data/compliance.json` defines required/recommended modules per country
3. Setup Step 2 shows compliance modules pre-checked (required = locked)
4. Tax presets loaded in Step 4 based on country

### Current coverage (Phase 1 = Spain only)

| Module | What it covers | Status |
|--------|---------------|--------|
| `verifactu` | VeriFactu (anti-fraud invoicing) | Ready |
| `sii` | SII (real-time VAT reporting) | Ready |
| `facturae` | Factura-e B2G (public admin) | Ready |
| `facturae_b2b` | Factura-e B2B (EN 16931) | Ready |
| `gdpr` | RGPD/LOPDGDD (data protection) | Ready |
| `tax` | Tax management (IVA classes) | Ready |

### Phase 2 — Country modules to create

| Country | Module needed | Regulation |
|---------|--------------|------------|
| PT | `saft_pt` | SAF-T + ATCUD |
| FR | `nf525` | NF525 POS certification |
| IT | `fatturapa` | FatturaPA / SDI |
| DE | `tse` | TSE KassenSichV |
| MX | `cfdi` | CFDI 4.0 (PAC) |
| CO | `dian_fe` | DIAN facturacion electronica |
| AR | `afip_fe` | AFIP webservices |
| CL | `dte_cl` | DTE (SII Chile) |
