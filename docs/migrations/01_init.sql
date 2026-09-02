CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE landowners (id UUID PRIMARY KEY, name TEXT, contact TEXT, lease_start DATE, lease_end DATE, terms TEXT, created_at TIMESTAMP DEFAULT now (), updated_at TIMESTAMP DEFAULT now () );

CREATE TABLE fields (id UUID PRIMARY KEY, name TEXT, acres NUMERIC, landowner_ID UUID REFERENCES landowners (id), created_at TIMESTAMP DEFAULT now(), updated_at TIMESTAMP DEFAULT now() );

CREATE TABLE boundaries ( id UUID PRIMARY KEY, field_id UUID REFERENCES fields(id), geometry GEOMETRY(Polygon, 4326), version INTEGER, effective_date DATE, created_at TIMESTAMP DEFAULT now();

CREATE TABLE crop_years (ID UUID PRIMARY KEY, field_id UUID REFERENCES fields(id); year INTEGER, crop TEXT, variety TEXT, planted_date DATE, expected_harvest DATE, created_at TIMESTAMP DEFAULT now(), updated_at TIMESTAMP DEFAULT now() );

CREATE TABLE operations (id UUID PRIMARY KEY, field_id UUDI REFERENCES fields(id), crop_year_id UUID REFERENCES crop_years(id), date DATE, type TEXT, equipment TEXT, operator TEXT, hours NUMERIC, created_at TIMESTAMP DEFAULT now(), source TEXT );

CREATE TABLE applications (id UUID PRIMARY KEY, operation_id UUID REFERENCES operations(id), product TEXT, rate NUMERIC, unit TEXT, cost_per_unit NUMERIC, tota_cost NUMERIC, created_at TIMESTAMP DEFAULT TIMESTAMP DEFAULT now (), source TEXT );

CREATE TABLE harvest ( id UUID PRIMARY KEY, field_id UUID REFERENCES fields(id), copr_year_id UUID REFERENCES crop_years(id), date DATE, yield NUMERIC, moisture NUMERIC, test_weight NUMERIC, created_at TIMESTAMP DEFAULT now(), source TEXT );

CREATE TABLE sales ( id UUID PRIMARY KEY, field_id UUID REFERENCES fields(id), crop_year_id UUID REFERENCES crop_years(id), date DATE, quantity NUMERIC, price_per_unit NUMERIC, total NUMERIC, market TEXT, created_at TIMESTAMP DEFAULT now(), source TEXT );

CREATE TABLE audit_log ( id UUID PRIMARY KEY, table_name TEXT, record_id UUID, action TEXT, changed_at TIMESTAMP DEFAULT now(), source TEXT );
