# Blueprints Roadmap

Business types and sectors removed from Phase 1 for future implementation.

---

## Eliminated Sectors (complete)

These sectors were removed entirely. They require deep integrations, heavy regulation, or address markets where ERPlora's POS model is not a natural fit.

### Transport & Logistics
- `courier` — Transport / Courier
- `vehicle_rental` — Vehicle Rental
- `moving_company` — Moving Company
- `logistics_3pl` — 3PL / Logistics Operator
- `parking` — Parking

**Why:** GPS tracking, route optimization, fleet management, real-time hardware (barriers/tickets).

### Pharmacy & Health (regulated)
- `pharmacy` — Pharmacy
- `orthopedics` — Orthopedics
- `cbd_shop` — CBD Shop / Cannabis Herbalist

**Why:** Integration with public health systems (receta electronica), Botplus, strict pharmaceutical regulation. `health_store` and `nutrition_shop` were moved to Retail (no regulation).

### NGO & Non-profit
- `nonprofit` — NGO / Association
- `property_management` — Property Management
- `professional_college` — Professional College
- `brotherhood` — Brotherhood / Guild
- `social_club` — Social Club

**Why:** Non-paying market segment. Member/donation management is a different product category.

### Technology & Digital
- `software` — Software Development
- `msp` — IT Services / MSP
- `web_agency` — Web / Digital Marketing Agency
- `hosting` — Hosting / Data Center
- `telecom` — Telecommunications / ISP

**Why:** These businesses use specialized tools (Jira, ConnectWise, WHMCS). POS is not their primary need.

### Travel & Tourism
- `travel_agency` — Travel Agency
- `tour_operator` — Tour Operator / Activities
- `tour_guide` — Independent Tour Guide

**Why:** Requires GDS integration (Amadeus), booking engine APIs. Inviable without deep partnerships.

### Financial Services
- `currency_exchange` — Currency Exchange
- `pawnshop` — Pawnshop
- `debt_collection` — Debt Collection
- `insurance_brokerage` — Insurance Brokerage

**Why:** Heavy regulation (Banco de Espana, CNMV), KYC/AML compliance.

### Maritime & Nautical
- `marina` — Marina / Sports Port
- `fishing_company` — Fishing Company
- `nautical_workshop` — Nautical Workshop

**Why:** Maritime regulation, very niche geographic market.

### Funeral Services
- `funeral_home` — Funeral Home
- `cemetery` — Cemetery / Crematorium
- `mortuary` — Mortuary

**Why:** Highly regulated, concession-based market. Closed ecosystem.

---

## Eliminated Types (from active sectors)

### Hospitality
- `catering` — Catering / Gastronomic Events (complex event budgeting)
- `nightclub` — Nightclub / Disco (capacity control, security, special hours)
- `hotel` — Hotel / Accommodation (PMS, channel manager, Booking/Expedia integration)
- `hostel` — Hostel / B&B / Rural House (same as hotel, simpler but still needs PMS)
- `camping` — Camping / Glamping (plot management, seasonal)
- `cider_house` — Cider House / Brewpub (very niche: Basque Country/Asturias)
- `dark_kitchen` — Dark Kitchen (requires Glovo/UberEats/JustEat integration)

### Retail
- `supermarket` — Supermarket / Grocery (scales, mass EAN, expiry management at scale, fierce competition)
- `optician` — Optician (insurance/mutual integration, prescriptions)
- `gas_station` — Gas Station (pump integration, special tax control)
- `sex_shop` — Adult Shop (very small niche)
- `grow_shop` — Grow Shop (variable regulation)
- `musical_instruments` — Musical Instruments (small niche)
- `vape` — Vape / E-cigarette (uncertain regulation)
- `telecom_shop` — Phone / Telecom Shop (operator integration)
- `office_supplies` — Office Supplies B2B (complex B2B invoicing)
- `cash_carry` — Cash & Carry / Wholesale (massive volumes, logistics)

### Personal Services
- `dental_clinic` — Dental Clinic (clinical records, insurance integration)
- `medical_clinic` — Medical Clinic (health regulation, clinical records)
- `speech_therapy` — Speech Therapy (very small niche, health data)

### Professional Services
- `real_estate` — Real Estate Agency (Idealista/Fotocasa/MLS integration)
- `insurance` — Insurance Agency (insurer integration, complex policies)
- `security_company` — Security Company (special regulation, complex shifts)
- `notary` — Notary (fixed tariffs, very special regulation)
- `translation_agency` — Translation Agency (small niche)
- `ett` — Temp Agency / Staffing (complex labor regulation)
- `pest_control` — Pest Control (niche, health regulations)
- `appraisal` — Appraisal / Expert Witness (very small niche)

### Education
- `nursery` — Nursery / Kindergarten (education regulation, ratios, reports)
- `exam_prep` — Exam Prep Center (subset of academy)

### Construction
- `solar_energy` — Solar / Renewable Energy (technical calculations, energy certificates)
- `elevator_company` — Elevator Company (RAE regulation, complex maintenance)

### Manufacturing
- `factory` — Factory / Industrial Workshop (complex MRP, BOM)
- `winery` — Winery / Vineyard (wine regulation, mandatory traceability)
- `craft_brewery` — Craft Brewery (special beer tax, traceability)
- `distillery` — Distillery (special alcohol tax)
- `cheese_dairy` — Cheese / Dairy (food traceability, APPCC)
- `canning` — Canning / Preserves (food traceability)
- `industrial_bakery` — Industrial Bakery (food traceability at scale)
- `textile_workshop` — Textile / Garment Workshop (niche, complex production)
- `laboratory` — Laboratory (ENAC accreditation, regulation)

### Agriculture
- `farm` — Farm (PAC, field notebook, traceability)
- `cooperative` — Agricultural Cooperative (member management, settlements)
- `livestock` — Livestock Farm (animal traceability, SITRAN)
- `beekeeping` — Beekeeping (minimal niche)
- `aquaculture` — Aquaculture / Fish Farm (very niche, regulation)

### Entertainment
- `arcade` — Arcade / Bowling (special hardware: machines, tokens)
- `cinema` — Cinema (seat management, distributors, programming)
- `theme_park` — Theme Park (enormous complexity)
- `water_park` — Water Park (same)
- `concert_hall` — Concert Hall / Theater (ticketing, production, technical riders)
- `casino` — Casino / Gaming Hall (gambling regulation, licenses)

### Media
- `video_production` — Video / Film Production (niche, specialized tools)
- `recording_studio` — Recording Studio (very small niche)
- `editorial` — Publishing House (editorial management is a different product)
- `art_gallery` — Art Gallery (niche, artist commissions)
- `event_production` — Event Production (technical production, riders, logistics)

### Rental
- `machinery_rental` — Machinery / Tool Rental (complex contracts, fleet maintenance)
- `event_equipment_rental` — Event Equipment Rental (logistics, setup/teardown)
- `self_storage` — Self Storage (access control, recurring contracts)
- `boat_rental` — Boat Rental (insurance, maritime regulation)
- `costume_rental` — Costume / Wardrobe Rental (minimal niche)

### Coworking
- `business_center` — Business Center (subset of coworking)
- `rehearsal_studio` — Rehearsal / Shared Studio (minimal niche)

---

## Implementation Priority (future phases)

### Phase 2 — Medium effort, clear market
1. Hotel / Hostel (needs PMS module)
2. Nightclub (capacity control + POS)
3. Supermarket (scale integration + weighing)
4. Dental / Medical / Vet clinic (clinical records module)
5. Real estate (portal integration)
6. Catering (event budgeting)

### Phase 3 — Requires partnerships or regulation work
7. Dark kitchen (delivery platform APIs)
8. Pharmacy (public health system)
9. Factory / Manufacturing (MRP/BOM)
10. Winery / Brewery / Distillery (special taxes)
11. Travel agency (GDS)
12. Financial services (KYC/AML)
