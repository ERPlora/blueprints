# Compliance Auto-Activation in Setup Wizard

**Status:** To implement
**Priority:** HIGH — Legal requirement, blocks market entry

## Problem

When a user runs Setup Wizard Step 1 and selects country = "ES", the compliance modules (verifactu, gdpr, etc.) should be automatically activated. Currently they're installed but the user has to know they need them.

## Architecture

```
blueprints/data/compliance.json
    ↓ (read by)
Hub Setup Wizard Step 1 (Region)
    ↓ (activates)
Required modules: verifactu, tax, gdpr
Recommended modules: sii, facturae, facturae_b2b
    ↓ (shows in)
Setup Wizard Step 2 (Modules) — compliance modules pre-checked + locked
```

## How It Works

### 1. compliance.json (already created)

Per-country data:
- `required_modules` — auto-activated, cannot be deselected (locked checkbox)
- `recommended_modules` — pre-checked but user can uncheck
- `tax_preset` — pre-loads tax classes for Step 4
- `requirements` — detailed legal info shown as informational cards

### 2. Setup Step 1 → Step 2 Bridge

When user selects country in Step 1:
```python
# In setup wizard Step 1 handler:
country_code = form.cleaned_data['country_code']
hub_config.country_code = country_code

# Load compliance
import json
compliance_path = Path(settings.BLUEPRINTS_DIR) / 'data' / 'compliance.json'
compliance = json.loads(compliance_path.read_text())
country_data = compliance['countries'].get(country_code, {})

# Store for Step 2
hub_config.required_compliance_modules = country_data.get('required_modules', [])
hub_config.recommended_compliance_modules = country_data.get('recommended_modules', [])
```

### 3. Setup Step 2 (Modules)

Show compliance modules in a separate "Legal Compliance" section at the top:
```html
<div class="card">
    <div class="card-header">
        <h3>Legal Compliance — {{ country_name }}</h3>
        <p class="text-sm text-muted">Required by law for your country</p>
    </div>
    <div class="card-body">
        {% for mod in required_compliance_modules %}
        <label class="list-item">
            <input type="checkbox" checked disabled> <!-- Locked -->
            <span>{{ mod.name }} <badge class="badge color-error">Required</badge></span>
        </label>
        {% endfor %}
        {% for mod in recommended_compliance_modules %}
        <label class="list-item">
            <input type="checkbox" name="modules" value="{{ mod.id }}" checked>
            <span>{{ mod.name }} <badge class="badge color-warning">Recommended</badge></span>
        </label>
        {% endfor %}
    </div>
</div>
```

### 4. Compliance Info Page

Show requirements as info cards (non-blocking, educational):
```html
{% for req in requirements %}
<div class="callout callout-{{ req.status_color }}">
    <div class="callout-icon">{% icon req.icon %}</div>
    <div class="callout-content">
        <div class="callout-title">{{ req.name }}</div>
        <div class="callout-text">
            {{ req.scope }}
            {% if req.effective_date %}
            <br>Effective: {{ req.effective_date }}
            {% endif %}
        </div>
    </div>
    {% if req.module %}
    <badge class="badge color-success">Covered</badge>
    {% else %}
    <badge class="badge color-warning">Coming soon</badge>
    {% endif %}
</div>
{% endfor %}
```

## Module Status per Country

### Modules we HAVE (Spain):
| Module | Compliance | Status |
|--------|-----------|--------|
| `verifactu` | VeriFactu | Ready (upcoming 2027) |
| `sii` | SII | Ready (enforced since 2017) |
| `facturae` | Factura-e B2G | Ready |
| `facturae_b2b` | Factura-e B2B | Ready (planned 2027) |
| `gdpr` | RGPD/LOPDGDD | Ready |
| `tax` | Tax management | Ready |

### Modules we NEED to create (other countries):
| Country | Need | Priority |
|---------|------|----------|
| PT | `saft_pt` (SAF-T export) | Phase 2 |
| FR | `nf525` (POS certification) | Phase 2 |
| IT | `fatturapa` (SDI integration) | Phase 2 |
| DE | `tse` (TSE hardware signing) | Phase 2 |
| MX | `cfdi` (CFDI 4.0 PAC integration) | Phase 2 |
| CO | `dian_fe` (DIAN facturacion) | Phase 2 |
| AR | `afip_fe` (AFIP webservices) | Phase 2 |
| CL | `dte_cl` (SII Chile DTE) | Phase 2 |

## Key Principle

**Compliance is ORTHOGONAL to business type.** A bar in Spain and a bar in France need the exact same business_type blueprint but completely different compliance modules. That's why:

- `compliance.json` is keyed by **country_code**, not by sector/business_type
- Business types define **what the business does** (UFO matrix, products, roles)
- Compliance defines **what the law requires** (invoicing format, tax reporting, POS certification)
- Both are resolved during setup: Step 1 → country → compliance, Step 2 → business → modules

## Dependencies

- `hub/apps/setup/` (wizard steps)
- `hub/apps/configuration/models.py` (HubConfig.country_code)
- `blueprints/data/compliance.json` (source of truth)
