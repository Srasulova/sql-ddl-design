

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    specialization TEXT,
    availability BOOLEAN
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id),
    doctor_id INTEGER REFERENCES doctors(id),
    visit_date DATE,
    diagnosis TEXT
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE patient_disease (
    patient_id INTEGER REFERENCES patients(id),
    disease_id INTEGER REFERENCES diseases(id),
    PRIMARY KEY (patient_id, disease_id)
);

INSERT INTO doctors (name, specialization, availability)
VALUES
    ('Dr. Smith', 'Cardiology', TRUE),
    ('Dr. Johnson', 'Pediatrics', TRUE),
    ('Dr. Anderson', 'Orthopedics', FALSE);

INSERT INTO patients (name)
VALUES
    ('John Doe'),
    ('Jane Smith'),
    ('Michael Johnson');

-- Visit 1: Dr. Smith sees John Doe
INSERT INTO visits (patient_id, doctor_id, visit_date, diagnosis)
VALUES
    (1, 1, '2024-03-29', 'Hypertension');

-- Visit 2: Dr. Johnson sees Jane Smith
INSERT INTO visits (patient_id, doctor_id, visit_date, diagnosis)
VALUES
    (2, 2, '2024-03-30', 'Common cold');

-- Visit 3: Dr. Anderson sees Michael Johnson
INSERT INTO visits (patient_id, doctor_id, visit_date, diagnosis)
VALUES
    (3, 3, '2024-03-31', 'Sprained ankle');

INSERT INTO diseases (name)
VALUES
    ('Hypertension'),
    ('Common cold'),
    ('Sprained ankle');


-- John Doe diagnosed with Hypertension
INSERT INTO patient_disease (patient_id, disease_id)
VALUES (1, 1);

-- Jane Smith diagnosed with Common cold
INSERT INTO patient_disease (patient_id, disease_id)
VALUES (2, 2);

-- Michael Johnson diagnosed with Sprained ankle
INSERT INTO patient_disease (patient_id, disease_id)
VALUES (3, 3);



