# ERPlora Blueprints

Business type definitions, product catalogs, and configuration data for ERPlora Hub setup.

When a user creates a new Hub, they select a **business type**. The blueprint for that type pre-configures: functional units (modules), roles, products, tax classes, and sector-specific features.

For business types not covered by blueprints, the AI assistant dynamically selects modules from the full catalog.

---

## 25 Business Types across 3 Sectors

### Hospitality & Restaurants (13)
| Code | Name |
|------|------|
| `bakery` | Bakery / Pastry Shop |
| `bar` | Bar |
| `cafeteria` | Cafeteria |
| `fast_food` | Fast Food |
| `food_truck` | Food Truck |
| `ice_cream_shop` | Ice Cream Shop |
| `kebab_shop` | Kebab Shop |
| `pizzeria` | Pizzeria |
| `pub` | Pub |
| `restaurant` | Restaurant |
| `sushi_restaurant` | Sushi Restaurant |
| `tapas_bar` | Tapas Bar |

### Personal Services & Wellness (8)
| Code | Name |
|------|------|
| `barber_shop` | Barbershop |
| `beauty_center` | Beauty Center |
| `gym` | Gym / Sports Center |
| `hair_salon` | Hair Salon |
| `physiotherapy` | Physiotherapy |
| `spa` | Spa / Massage |
| `tattoo_studio` | Tattoo / Piercing |
| `vet_clinic` | Veterinary Clinic |

### Retail & Commerce (5)
| Code | Name |
|------|------|
| `butcher_shop` | Butcher Shop |
| `fruit_shop` | Fruit & Vegetable Shop |
| `pet_shop` | Pet Store |
| `tobacco_shop` | Tobacconist |
| `wholesale_distributor` | Wholesale Distributor |

---

## Data Structure

```
blueprints/
├── schema/                          # JSON Schema definitions
│   ├── business_type.schema.json
│   ├── functional_units.schema.json
│   └── products.schema.json
├── data/
│   ├── business_sectors.json        # 3 sector definitions
│   ├── business_types/
│   │   ├── index.json               # Master index (25 types)
│   │   ├── restaurant.json          # Flat: one JSON per type
│   │   ├── bar.json
│   │   └── ...
│   ├── compliance.json              # Country compliance modules
│   ├── functional_units.json        # 12 UFO functional units
│   ├── transversal_models.json      # Shared data models
│   ├── products/
│   │   └── es/                      # Product catalogs (Spanish)
│   ├── assets/                      # Product/service images (WebP 512x512)
│   │   ├── hospitality/             # 284 images
│   │   ├── beauty_hair/             # 42 images
│   │   ├── beauty_body/             # 35 images
│   │   ├── wellness_spa/            # 18 images
│   │   ├── fitness/                 # 20 images
│   │   └── retail/                  # 90 images
│   ├── i18n/
│   │   └── es.json                  # Spanish translations
│   └── manifest.json                # File inventory with SHA256
├── scripts/
│   └── convert_to_webp.py           # Image conversion utility
└── README.md
```

## Business Type Schema

Each business type JSON file contains:

| Field | Description |
|-------|-------------|
| `code` | Unique identifier (`bar`, `hair_salon`, etc.) |
| `sector` | Parent sector (`hospitality`, `retail`, `personal_services`) |
| `name` | Display name |
| `description` | Short description |
| `icon` | Ionicon name |
| `color` | Hex color |
| `is_combinable` | Whether this type can be combined with others |
| `ufo_matrix` | 12 functional units with levels: `essential`, `recommended`, `na` |
| `extra_modules` | Additional module slugs beyond what UFO matrix implies |
| `sector_features` | Key features specific to this business type |
| `roles` | Predefined roles with permissions |
| `products_file` | Path to the product catalog file |

## UFO Matrix (Functional Units)

| Code | Name |
|------|------|
| FIN | Finance & Accounting |
| COM | Commerce & Sales |
| ALM | Inventory & Warehouse |
| TPV | Point of Sale |
| VEN | Online Sales |
| CRM | Customer Relations |
| ECO | E-commerce |
| PRO | Production |
| LOG | Logistics |
| RRH | Human Resources |
| PRY | Projects |
| BI | Analytics & BI |

Each business type marks every unit as `essential`, `recommended`, or `na`.

## Country Compliance

`compliance.json` defines **legal requirements per country**, independent of business type:

```json
{
  "ES": {
    "required_modules": ["verifactu", "tax", "gdpr"],
    "recommended_modules": ["sii", "facturae", "facturae_b2b"],
    "tax_preset": "es_standard",
    "requirements": [...]
  }
}
```

During Setup Wizard:
- **Step 1 (Region)** → sets `country_code` → loads compliance requirements
- **Step 2 (Modules)** → compliance modules shown pre-checked (required = locked)
- **Step 4 (Tax)** → tax preset loaded from compliance country config

Countries with full module coverage: **ES** (Spain).

## AI Fallback for Unknown Types

When a business type doesn't match any blueprint (e.g., "coworking space", "auto repair shop"), the AI assistant:
1. Fetches the full module catalog with `functional_unit`, `sector`, and `business_types` metadata
2. Selects relevant modules based on the business description
3. Installs them directly — no blueprint needed
