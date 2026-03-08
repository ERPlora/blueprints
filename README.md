# ERPlora Blueprints

Business type definitions, product catalogs, and configuration data for ERPlora Hub setup.

When a user creates a new Hub, they select a **business type**. The blueprint for that type pre-configures: functional units (modules), roles, products, tax classes, and sector-specific features.

---

## Phase 1 — 79 Business Types across 12 Sectors

### Hospitality & Restaurants (13)
| Code | Name |
|------|------|
| `bar` | Bar / Pub |
| `restaurant` | Restaurant |
| `bar_restaurant` | Bar-Restaurant |
| `fast_food` | Fast Food |
| `food_truck` | Food Truck |
| `bakery` | Bakery / Pastry Shop |
| `ice_cream_shop` | Ice Cream Shop |
| `beach_bar` | Beach Bar / Seasonal Terrace |
| `wine_bar` | Wine Bar |
| `pizzeria` | Pizzeria |
| `coffee_shop` | Coffee Shop |
| `sushi_restaurant` | Sushi Restaurant |
| `kebab_shop` | Kebab Shop |

### Retail & Commerce (23)
| Code | Name |
|------|------|
| `clothing` | Clothing / Fashion Store |
| `fruit_shop` | Fruit & Vegetable Shop |
| `butcher_shop` | Butcher Shop |
| `fish_shop` | Fish Shop |
| `hardware_store` | Hardware Store |
| `electronics` | Electronics / IT Store |
| `bookshop` | Bookstore / Stationery |
| `jewelry` | Jewelry / Watch Store |
| `florist` | Florist |
| `pet_shop` | Pet Store |
| `sports_shop` | Sports Store |
| `furniture` | Furniture / Decor |
| `cosmetics` | Cosmetics / Perfumery |
| `tobacco_shop` | Tobacconist |
| `bazaar` | Variety Store / Bazaar |
| `second_hand` | Second-Hand / Vintage |
| `toy_shop` | Toy Store |
| `wine_shop` | Wine Shop (retail) |
| `bicycle_shop` | Bicycle Shop |
| `gourmet` | Gourmet / Delicatessen |
| `street_market` | Market Stall / Street Vendor |
| `health_store` | Parapharmacy / Health Store |
| `nutrition_shop` | Dietetics / Sports Nutrition |

### Personal Services & Wellness (14)
| Code | Name |
|------|------|
| `hair_salon` | Hair Salon |
| `barber_shop` | Barbershop |
| `beauty_center` | Beauty Center |
| `spa` | Spa / Massage |
| `physiotherapy` | Physiotherapy |
| `podiatry` | Podiatry |
| `tattoo_studio` | Tattoo / Piercing |
| `laundry` | Laundry / Dry Cleaner |
| `gym` | Gym / Sports Center |
| `psychology` | Psychology / Coaching |
| `nutrition` | Nutrition / Dietitian |
| `pilates_yoga` | Pilates / Yoga |
| `dog_grooming` | Pet Grooming |
| `laser_hair_removal` | Laser Hair Removal |

### Professional Services (9)
| Code | Name |
|------|------|
| `consulting` | Consulting |
| `tax_advisory` | Tax / Accounting Advisory |
| `law_firm` | Law Firm |
| `marketing` | Marketing Agency |
| `design_studio` | Design / Architecture Studio |
| `cleaning_company` | Cleaning Company |
| `maintenance_company` | Maintenance / Field Service |
| `admin_agency` | Administrative Agency |
| `landscaping` | Landscaping |

### Education & Training (5)
| Code | Name |
|------|------|
| `academy` | Academy / Training Center |
| `driving_school` | Driving School |
| `music_school` | Music School |
| `dance_school` | Dance School |
| `language_school` | Language School |

### Construction & Installations (5)
| Code | Name |
|------|------|
| `construction_company` | Construction Company |
| `renovation` | Renovation Company |
| `installer` | Installer (Plumber, Electrician, HVAC) |
| `carpentry` | Carpentry / Cabinet Making |
| `locksmith` | Locksmith |

### Repair & Manufacturing (3)
| Code | Name |
|------|------|
| `auto_repair` | Auto Repair Shop |
| `electronics_repair` | Repair Shop (Electronics) |
| `printing` | Print Shop |

### Agriculture & Garden (1)
| Code | Name |
|------|------|
| `garden_center` | Nursery / Garden Center |

### Leisure & Entertainment (3)
| Code | Name |
|------|------|
| `escape_room` | Escape Room |
| `sports_club` | Sports Club |
| `event_venue` | Event Venue |

### Media & Creative (1)
| Code | Name |
|------|------|
| `photography` | Photography Studio |

### Rental (1)
| Code | Name |
|------|------|
| `bike_rental` | Bike / Scooter Rental |

### Spaces & Coworking (1)
| Code | Name |
|------|------|
| `coworking` | Coworking Space |

---

## Data Structure

```
blueprints/
├── schema/                          # JSON Schema definitions
│   ├── business_type.schema.json
│   ├── functional_units.schema.json
│   └── products.schema.json
├── data/
│   ├── business_sectors.json        # 12 sector definitions
│   ├── business_types/
│   │   ├── index.json               # Master index (79 types)
│   │   ├── S01_hospitality/         # 13 types
│   │   ├── S02_retail/              # 23 types
│   │   ├── S04_personal_services/   # 14 types
│   │   ├── S05_professional_services/ # 9 types
│   │   ├── S06_education/           # 5 types
│   │   ├── S07_construction/        # 5 types
│   │   ├── S08_manufacturing/       # 3 types
│   │   ├── S10_agriculture/         # 1 type
│   │   ├── S11_entertainment/       # 3 types
│   │   ├── S16_media/               # 1 type
│   │   ├── S17_rental/              # 1 type
│   │   └── S20_coworking/           # 1 type
│   ├── compliance.json              # Country compliance modules (legal requirements)
│   ├── functional_units.json        # 12 UFO functional units
│   ├── transversal_models.json      # Shared data models
│   ├── products/
│   │   └── es/                      # Product catalogs (Spanish)
│   ├── assets/
│   │   └── products/                # Product images
│   ├── i18n/
│   │   └── es.json                  # Spanish translations
│   └── manifest.json                # File inventory with SHA256
├── README.md
└── ROADMAP.md                       # Future phases & eliminated types
```

## Business Type Schema

Each business type JSON file contains:

| Field | Description |
|-------|-------------|
| `code` | Unique identifier (`bar`, `hair_salon`, etc.) |
| `sector` | Parent sector (`hospitality`, `retail`, etc.) |
| `name` | Display name |
| `description` | Short description |
| `icon` | Ionicon name |
| `color` | Hex color |
| `inherits_from` | Array of parent type codes (for combined types like `bar_restaurant`) |
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
Countries with compliance data but modules pending: PT, FR, IT, DE, MX, CO, AR, CL.

See `todo/11-compliance-auto-activation.md` for implementation details.

---

## Future Phases

See [ROADMAP.md](ROADMAP.md) for eliminated sectors and types planned for future implementation.
