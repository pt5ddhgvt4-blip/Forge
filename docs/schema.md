Forge Schema v1

tables

landowners - id, name, contact, lease start, lease end, terms

fields - id, name, acres, landowner id, created at, updated at

boundaries - id, field, geometry, version, effective date

crop years - id, field id, year, crop, variety, planted date, expected harvest

operations - id, field id, crop year id, date, type, equipment, operator, hours

applications - id, operation id, product, rate, unit, cost per unit, total cost

harvest - id, field id, crop year id, date, yield, moisture, test weight

sales - id, field id, crop year id, date, quantity, price per unit, total, market

audit log - id, table name, record id, action, changed at, source
