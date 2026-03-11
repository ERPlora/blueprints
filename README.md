# ERPlora Blueprints

Business type definitions, product catalogs, and configuration data for ERPlora Hub setup.

When a user creates a new Hub, they select a **business type**. The blueprint for that type pre-configures: functional units (modules), roles, products, tax classes, and sector-specific features.

For business types not covered by blueprints, the AI assistant dynamically selects modules from the full catalog.

---

## 57 Business Types across 12 Sectors

### 🍽️ Hospitality & Food (6)
| Code | Name |
|------|------|
| `hospitality` | Hospitality (generic) |
| `restaurant` | Restaurant |
| `bar_cafe` | Bar / Café |
| `fast_food` | Fast Food |
| `food_delivery` | Food Delivery |
| `catering` | Catering |

### 🛍️ Retail & Commerce (6)
| Code | Name |
|------|------|
| `retail` | Retail (generic) |
| `supermarket` | Supermarket |
| `fashion_retail` | Fashion Retail |
| `electronics_retail` | Electronics Retail |
| `pharmacy_retail` | Pharmacy |
| `wholesale` | Wholesale |

### 💇 Personal Services & Wellness (6)
| Code | Name |
|------|------|
| `beauty_salon` | Beauty Salon |
| `barbershop` | Barbershop |
| `spa_wellness` | Spa & Wellness |
| `massage_therapy` | Massage Therapy |
| `fitness_gym` | Fitness Gym |
| `personal_services` | Personal Services (generic) |

### 🏨 Hotels & Tourism (5)
| Code | Name |
|------|------|
| `hotel` | Hotel |
| `hostel` | Hostel |
| `vacation_rental` | Vacation Rental |
| `tour_operator` | Tour Operator |
| `travel_agency` | Travel Agency |

### 🏥 Healthcare (5)
| Code | Name |
|------|------|
| `clinic` | Clinic |
| `dental_clinic` | Dental Clinic |
| `physiotherapy` | Physiotherapy |
| `psychology` | Psychology |
| `medical_lab` | Medical Lab |

### 🏗️ Construction & Field Services (5)
| Code | Name |
|------|------|
| `construction` | Construction |
| `home_services` | Home Services |
| `maintenance_services` | Maintenance Services |
| `contractors` | Contractors |
| `field_service` | Field Service |

### 🏭 Manufacturing & Industry (4)
| Code | Name |
|------|------|
| `manufacturing` | Manufacturing (generic) |
| `factory` | Factory |
| `industrial_production` | Industrial Production |
| `assembly` | Assembly |

### 🚚 Logistics & Transportation (4)
| Code | Name |
|------|------|
| `logistics` | Logistics |
| `transportation` | Transportation |
| `delivery_services` | Delivery Services |
| `warehousing` | Warehousing |

### 🏢 Professional Services (5)
| Code | Name |
|------|------|
| `consulting` | Consulting |
| `accounting_firm` | Accounting Firm |
| `legal_services` | Legal Services |
| `marketing_agency` | Marketing Agency |
| `it_services` | IT Services |

### 🎓 Education (4)
| Code | Name |
|------|------|
| `education` | Education (generic) |
| `school` | School |
| `training_center` | Training Center |
| `online_courses` | Online Courses |

### 🏡 Real Estate (3)
| Code | Name |
|------|------|
| `real_estate` | Real Estate (generic) |
| `property_management` | Property Management |
| `real_estate_agency` | Real Estate Agency |

### 🚗 Automotive (4)
| Code | Name |
|------|------|
| `car_repair` | Car Repair |
| `car_dealership` | Car Dealership |
| `car_rental` | Car Rental |
| `auto_services` | Auto Services |

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
│   │   ├── index.json               # Master index (57 types)
│   │   ├── restaurant.json          # Flat: one JSON per type
│   │   ├── bar_cafe.json
│   │   └── ...
│   ├── compliance.json              # Country compliance modules
│   ├── functional_units.json        # 12 UFO functional units
│   ├── transversal_models.json      # Shared data models
│   ├── products/
│   │   └── es/                      # Product catalogs (Spanish)
│   ├── assets/                      # Product/service images (WebP 512x512)
│   │   ├── hospitality/             # Food & beverage images
│   │   ├── beauty_hair/             # Hair salon images
│   │   ├── beauty_body/             # Beauty body images
│   │   ├── wellness_spa/            # Spa & wellness images
│   │   ├── fitness/                 # Fitness images
│   │   └── retail/                  # Retail images
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
| `code` | Unique identifier (`bar_cafe`, `fitness_gym`, etc.) |
| `sector` | Parent sector (`hospitality`, `retail`, `personal_services`, etc.) |
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

Countries with full module coverage: **ES** (Spain).

## AI Fallback for Unknown Types

When a business type doesn't match any blueprint, the AI assistant:
1. Fetches the full module catalog with `functional_unit`, `sector`, and `business_types` metadata
2. Selects relevant modules based on the business description
3. Installs them directly — no blueprint needed
