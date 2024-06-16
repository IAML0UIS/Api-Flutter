-- Creación de la base de datos
CREATE DATABASE IF NOT EXISTS software_vitalsave;
USE software_vitalsave;

-- Tabla para citas
CREATE TABLE citas (
    id_cita INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    hora TIME,
    descripcion VARCHAR(255),
    lugar VARCHAR(255)
);

-- Insertar datos en la tabla citas
INSERT INTO citas (fecha, hora, descripcion, lugar)
VALUES
    ('2022-06-10', '08:00:00', 'Consulta médica', 'Hospital'),
    ('2022-06-12', '09:30:00', 'Reunión con el fisioterapeuta', 'Centro de rehabilitación'),
    ('2022-06-15', '11:00:00', 'Visita al podólogo', 'Clínica podológica'),
    ('2022-06-20', '14:00:00', 'Control médico', 'Consultorio médico'),
    ('2022-06-25', '10:30:00', 'Reunión social', 'Centro de día');

-- Tabla para emergencias
CREATE TABLE emergencia (
    id_emergencia INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    contacto VARCHAR(100),
    telefono VARCHAR(20)
);

-- Insertar datos en la tabla emergencia
INSERT INTO emergencia (tipo, contacto, telefono)
VALUES
    ('Servicios médicos', 'Centro de salud', '123456789'),
    ('Familiar', 'Hijo/a', '987654321'),
    ('Vecino', 'Juan Pérez', '555-1234'),
    ('Amigo/a', 'María Gómez', '789-4567'),
    ('Policía', 'Emergencias 911', '911');

-- Tabla para familiares
CREATE TABLE familiar (
    id_familiar INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    relacion VARCHAR(50),
    telefono VARCHAR(20)
);

-- Insertar datos en la tabla familiar
INSERT INTO familiar (nombre, apellido, relacion, telefono)
VALUES
    ('Juan', 'Pérez', 'Hijo/a', '987654321'),
    ('María', 'Gómez', 'Hermano/a', '555-1234'),
    ('Laura', 'Martínez', 'Sobrino/a', '789-4567'),
    ('Carlos', 'López', 'Primo/a', '123-4567'),
    ('Ana', 'Rodríguez', 'Hijastra', '789-1234');

-- Tabla para medicamentos
CREATE TABLE medicamento (
    id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    dosis VARCHAR(50),
    frecuencia VARCHAR(50),
    indicaciones TEXT
);

-- Insertar datos en la tabla medicamento
INSERT INTO medicamento (nombre, dosis, frecuencia, indicaciones)
VALUES
    ('Paracetamol', '500 mg', 'Cada 8 horas', 'Para el dolor'),
    ('Atorvastatina', '20 mg', 'Diaria', 'Para el colesterol'),
    ('Metformina', '850 mg', '2 veces al día', 'Para la diabetes'),
    ('Omeprazol', '20 mg', 'Diaria', 'Para la acidez estomacal'),
    ('Losartán', '50 mg', 'Diaria', 'Para la presión arterial');

-- Tabla para recordatorios
CREATE TABLE recordatorio (
    id_recordatorio INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    hora TIME,
    descripcion VARCHAR(255),
    estado VARCHAR(50)
);

-- Insertar datos en la tabla recordatorio
INSERT INTO recordatorio (fecha, hora, descripcion, estado)
VALUES
    ('2022-06-10', '08:00:00', 'Tomar medicamento', 'Pendiente'),
    ('2022-06-12', '10:00:00', 'Reunión familiar', 'Pendiente'),
    ('2022-06-15', '12:00:00', 'Control médico', 'Realizado'),
    ('2022-06-20', '14:30:00', 'Tomar medicamento', 'Pendiente'),
    ('2022-06-25', '09:00:00', 'Visita al podólogo', 'Realizado');

