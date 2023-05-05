-- creando database
CREATE DATABASE grupal5;
use grupal5;

CREATE USER 'usuario5'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON grupal5.* TO 'usuario5'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    contraseña VARCHAR(20) NOT NULL,
    zona_horaria VARCHAR(20) DEFAULT 'UTC-3',
    genero VARCHAR(15),
    telefono_contacto VARCHAR(15)
);

CREATE TABLE ingreso (
    id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_ingreso DATETIME DEFAULT current_timestamp,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
    );

ALTER TABLE usuarios MODIFY zona_horaria VARCHAR(20) DEFAULT 'UTC-2' ;

INSERT INTO usuarios (nombre, apellido, contraseña, genero, telefono_contacto) VALUES
('Juan', 'Pérez', 'abc123', 'Masculino', '123456789'),
('María', 'González', 'qwerty', 'Femenino', '987654321'),
('Pedro', 'Sánchez', 'asdfg', 'Masculino', '456789123'),
('Ana', 'Martínez', 'zxcvb', 'Femenino', '789123456'),
('Carlos', 'Rodríguez', 'qazwsx', 'Masculino', '321654987'),
('Laura', 'López', 'plmokn', 'Femenino', '147852369'),
('Federico', 'Gómez', 'uiop', 'Masculino', '369852147'),
('Lucía', 'Hernández', 'ytrewq', 'Femenino', '258963147');
SELECT * FROM usuarios;

INSERT INTO ingreso (id_usuario) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8);

select * from usuarios;

CREATE TABLE Contactos (
    id_contacto INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    numero_telefono VARCHAR(15),
    correo_electronico VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
ALTER TABLE usuarios DROP COLUMN telefono_contacto;

INSERT INTO contactos (id_usuario, numero_telefono, correo_electronico) VALUES
(1, '123456789', '1@correo.com'),
(2, '987654321', '2@correo.com'),
(3, '456789123', '3@correo.com'),
(4, '789123456', '4@correo.com'),
(5, '321654987', '5@correo.com'),
(6, '147852369', '6@correo.com'),
(7, '369852147', '7@correo.com'),
(8, '258963147', '8@correo.com');


select u.id_usuario, u.nombre, u.apellido, u.contraseña, u.zona_horaria, u.genero, c.numero_telefono, 
c.correo_electronico from usuarios u, contactos c where u.id_usuario = c.id_usuario;