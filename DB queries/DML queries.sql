use opiTravel;

select * from  Country order by id;
select * from  Region order by id;
select * from  City order by id;
select * from  Payment_type order by id;
select * from  Document_type order by id;
select * from  Transport_type order by id;
select * from  Request_state order by id;
select * from  Request_type order by id;
select * from  Travel_state  order by id;
select * from  Travel_type order by id;
select * from  Customer order by id;
select * from  Travel order by id;
select * from  Request_travel order by id;



#Insert countries
INSERT INTO Country (name)
VALUES 
('Colombia'),
('Estados Unidos');


#Insert Colombia departments
INSERT INTO Region (name, country_id)
VALUES 
('Amazonas', 1),
('Antioquia', 1),
('Arauca', 1),
('Atlántico', 1),
('Bolívar', 1),
('Boyacá', 1),
('Caldas', 1),
('Caquetá', 1),
('Casanare', 1),
('Cauca', 1),
('Cesar', 1),
('Chocó', 1),
('Córdoba', 1),
('Cundinamarca', 1),
('Guainía', 1),
('Guaviare', 1),
('Huila', 1),
('La Guajira', 1),
('Magdalena', 1),
('Meta', 1),
('Nariño', 1),
('Norte de Santander', 1),
('Putumayo', 1),
('Quindío', 1),
('Risaralda', 1),
('San Andrés y Providencia', 1),
('Santander', 1),
('Sucre', 1),
('Tolima', 1),
('Valle del Cauca', 1),
('Vaupés', 1),
('Vichada', 1);

#Insert EEUU states
INSERT INTO Region (name, country_id) VALUES
('Alabama', 2),
('Alaska', 2),
('Arizona', 2),
('Arkansas', 2),
('California', 2),
('Colorado', 2),
('Connecticut', 2),
('Delaware', 2),
('Florida', 2),
('Georgia', 2),
('Hawaii', 2),
('Idaho', 2),
('Illinois', 2),
('Indiana', 2),
('Iowa', 2),
('Kansas', 2),
('Kentucky', 2),
('Louisiana', 2),
('Maine', 2),
('Maryland', 2),
('Massachusetts', 2),
('Michigan', 2),
('Minnesota', 2),
('Mississippi', 2),
('Missouri', 2),
('Montana', 2),
('Nebraska', 2),
('Nevada', 2),
('New Hampshire', 2),
('New Jersey', 2),
('New Mexico', 2),
('New York', 2),
('North Carolina', 2),
('North Dakota', 2),
('Ohio', 2),
('Oklahoma', 2),
('Oregon', 2),
('Pennsylvania', 2),
('Rhode Island', 2),
('South Carolina', 2),
('South Dakota', 2),
('Tennessee', 2),
('Texas', 2),
('Utah', 2),
('Vermont', 2),
('Virginia', 2),
('Washington', 2),
('West Virginia', 2),
('Wisconsin', 2),
('Wyoming', 2);

#Insert Colombia capital cities
INSERT INTO City (name, region_id)
VALUES
('Leticia', 1),
('Medellín', 2),
('Arauca', 3),
('Barranquilla', 4),
('Cartagena', 5),
('Tunja', 6),
('Manizales', 7),
('Florencia', 8),
('Yopal', 9),
('Popayán', 10),
('Valledupar', 11),
('Quibdó', 12),
('Montería', 13),
('Bogotá', 14),
('Inírida', 15),
('San José del Guaviare', 16),
('Neiva', 17),
('Riohacha', 18),
('Santa Marta', 19),
('Villavicencio', 20),
('Pasto', 21),
('Cúcuta', 22),
('Mocoa', 23),
('Armenia', 24),
('Pereira', 25),
('San Andrés', 26),
('Bucaramanga', 27),
('Sincelejo', 28),
('Ibagué', 29),
('Cali', 30),
('Mitú', 31),
('Puerto Carreño', 32);

#Insert EEUU capital states
INSERT INTO City (name, region_id) VALUES 
('Montgomery', 33),
('Juneau', 34),
('Phoenix', 35),
('Little Rock', 36),
('Sacramento', 37),
('Denver', 38),
('Hartford', 39),
('Dover', 40),
('Tallahassee', 41),
('Atlanta', 42),
('Honolulu', 43),
('Boise', 44),
('Springfield', 45),
('Indianapolis', 46),
('Des Moines', 47),
('Topeka', 48),
('Frankfort', 49),
('Baton Rouge', 50),
('Augusta', 51),
('Annapolis', 52),
('Boston', 53),
('Lansing', 54),
('St. Paul', 55),
('Jackson', 56),
('Jefferson City', 57),
('Helena', 58),
('Lincoln', 59),
('Carson City', 60),
('Concord', 61),
('Trenton', 62),
('Santa Fe', 63),
('Albany', 64),
('Raleigh', 65),
('Bismarck', 66),
('Columbus', 67),
('Oklahoma City', 68),
('Salem', 69),
('Harrisburg', 70),
('Providence', 71),
('Columbia', 72),
('Pierre', 73),
('Nashville', 74),
('Austin', 75),
('Salt Lake City', 76),
('Montpelier', 77),
('Richmond', 78),
('Olympia', 79),
('Charleston', 80),
('Madison', 81),
('Cheyenne', 82);

#Insert payment types
INSERT INTO Payment_type (name) VALUES
('Efectivo'),
('Tarjeta de crédito');

#Insert travel types
INSERT INTO Travel_type(name) VALUES
('Negocios'),
('Turismo');

#Insert document types
INSERT INTO Document_type (name) VALUES
('Cédula colombiana'),
('Cédula extranjería');

#Insert transport types
INSERT INTO Request_type(name) VALUES
('Purchase'),
('Reservation');

#Insert request types
INSERT INTO Transport_type(type, model) VALUES
('plane', "CHQ999"),
('Bus', "ROBERTW879K");

#Insert travel states
INSERT INTO Travel_state (name) VALUES
('Activo'),
('Inactivo'),
('Cancelado'),
('Finalizado');

#Insert request states
INSERT INTO Request_state (name) VALUES
('Paga'),
('Cancelada');


#Insert customers
INSERT INTO Customer (first_name, second_name, first_lastname, other_lastnames, email, date_of_birth, document_number, city_id, document_type_id)
VALUES 
('Camila', 'María', 'González', 'Santana', 'cgonzalez@example.com', '1990-03-15', '1234567868', 7, 1),
('Santiago', 'Andrés', 'Castro', 'Ramírez', 'scastroramirez@example.com', '1985-11-21', '987654321', 7, 1),
('Juan', NULL, 'González', 'Rodriguez', 'juan.gonzalez@example.com', '1990-05-10', '123456789', 7, 1),
('María', 'Isabel', 'Santos', 'Martinez', 'maria.santos@example.com', '1985-11-22', '234567890', 7, 1),
('Pedro', NULL, 'Diaz', 'Hernandez', 'pedro.diaz@example.com', '1992-07-15', '345678901', 7, 1),
('Luisa', 'Fernanda', 'Restrepo', 'Gutierrez', 'luisa.restrepo@example.com', '1996-02-28', '456789012', 14, 1),
('Andrés', 'Felipe', 'Gómez', 'Rojas', 'andres.gomez@example.com', '1999-09-03', '567890123', 14, 1),
('Jualian', 'Andrés', 'Torres', NULL, 'juli.torres@example.com', '1983-05-03', '567890153', 14, 1);

#Insert travels
INSERT INTO Travel (selling_price, reservation_price, departure_date, origin_cyty_id, target_cyty_id, travel_type_id, travel_state_id, transport_type_id)
VALUES 
(4000000, 3500000, '2023-06-15', 1, 5, 1, 1, 1),
(4200000, 3800000, '2023-08-20', 2, 6, 2, 4, 1),
(10000000, 9000000, '2024-03-10', 3, 7, 1, 4, 2),
(11000000, 10000000, '2024-05-22', 4, 8, 2, 3, 1),
(12000000, 11000000, '2024-11-05', 9, 12, 2, 4, 1);

INSERT INTO Request_travel (request_type_id , payment_type_id , travel_id, customer_id, request_state_id)
VALUES 
(1, 1, 1, 1, 1),
(1, 2, 1, 1, 1),
(2, 2, 2, 1, 1),
(1, 1, 4, 1, 1),
(1, 1, 1, 3, 1),
(1, 1, 2, 2, 1),
(2, 1, 5, 4, 1),
(1, 2, 4, 3, 1),
(1, 1, 3, 5, 1);



select * from  Country order by id;
select * from  Region order by id;
select * from  City order by id;
select * from  Payment_type order by id;
select * from  Document_type order by id;
select * from  Transport_type order by id;
select * from  Request_state order by id;
select * from  Request_type order by id;
select * from  Travel_state  order by id;
select * from  Travel_type order by id;
select * from  Customer order by id;
select * from  Travel order by id;
select * from  Request_travel order by id;


