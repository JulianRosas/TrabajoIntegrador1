-- Active: 1678884451019@@127.0.0.1@3306@tiendaElectronica
drop database if exists tiendaElectronica;

create database tiendaElectronica;

use tiendaElectronica;

create table Categorias (
	id int not null auto_increment primary key,
	nombre varchar(50)
);

create table OpcionesPago (
	id int not null auto_increment primary key,
	nombre varchar(50)
);

create table Cotizaciones (
	id int not null auto_increment primary key,
	descripcion varchar(50),
	costoReparacion int,
	tiempoReparacion int
);

create table Cotizacion_OpcionesPago (
	id int not null auto_increment primary key,
	idCotizacion int,
	idOpcionesPago int,
	constraint idCotizacion foreign key (idCotizacion) references Cotizaciones(id),
	constraint idOpcionesPago foreign key (idOpcionesPago) references OpcionesPago(id)
);

create table Telefonos (
	id int not null auto_increment primary key,
	numero int
);
create table Clientes (
	id int not null auto_increment primary key,
	nombre varchar(50),
	apellido varchar(50),
	direccion varchar(50),
	email varchar(50)
);

create table Telefono_Cliente (
	id int not null auto_increment primary key,
	idTelefono int,
	idCliente3 int,
	constraint idTelefono foreign key (idTelefono) references Telefonos(id),
	constraint idCliente3 foreign key (idCliente3) references Clientes(id)
);

create table Productos (
	id int not null auto_increment primary key,
	nombre varchar(50),
	precioVenta int,
	cantidad int,
	fechaUpdateStock date,
	idCategoria int,
    constraint idCategoria foreign key (idCategoria) references Categorias(id)
);

create table Ventas (
	id int not null auto_increment primary key,
	fecha date,
	hora time,
	cantidad int,
	metodoPago varchar(50),
	idCliente int,
    constraint idCliente foreign key (idCliente) references Clientes(id)
);

create table venta_producto (
	id int not null auto_increment primary key,
	nombre varchar(50),
	cantidad int,
	idVenta int,
	idProducto int,
    constraint idVenta foreign key (idVenta) references Ventas(id),
    constraint idProducto foreign key (idProducto) references Productos(id)
);

create table Reparaciones (
	id int not null auto_increment primary key,
	cliente varchar(50),
	fechaIngresoProducto date,
	fechaReparacion date,
	fechaEntrega date,
	producto varchar(50),
	tipo varchar(50),
	costo int,
	tecnico varchar(50),
	idCliente2 int,
	idProducto2 int
);

-- Insert categoria
INSERT INTO Categorias (nombre) VALUES ('Gaming');
INSERT INTO Categorias (nombre) VALUES ('Oficina');
INSERT INTO Categorias (nombre) VALUES ('Entretenimiento');
INSERT INTO Categorias (nombre) VALUES ('Electrodomesticos');
INSERT INTO Categorias (nombre) VALUES ('Herramientas');

-- Insert opciones pago
INSERT INTO OpcionesPago (nombre) VALUES ('Tarjeta de crédito');
INSERT INTO OpcionesPago (nombre) VALUES ('Transferencia bancaria');
INSERT INTO OpcionesPago (nombre) VALUES ('Efectivo');
INSERT INTO OpcionesPago (nombre) VALUES ('PayPal');
INSERT INTO OpcionesPago (nombre) VALUES ('Cheque');

-- Insert cotizaciones
INSERT INTO Cotizaciones (descripcion, costoReparacion, tiempoReparacion) VALUES ('Reparación de pantalla', 500, 3);
INSERT INTO Cotizaciones (descripcion, costoReparacion, tiempoReparacion) VALUES ('Cambio de boton', 300, 2);
INSERT INTO Cotizaciones (descripcion, costoReparacion, tiempoReparacion) VALUES ('Reparación de cable', 100, 1);
INSERT INTO Cotizaciones (descripcion, costoReparacion, tiempoReparacion) VALUES ('Reemplazo de vidrio', 600, 4);
INSERT INTO Cotizaciones (descripcion, costoReparacion, tiempoReparacion) VALUES ('Cambio de bateria', 200, 5);

-- Insert cotizacion_opcionespago
INSERT INTO Cotizacion_OpcionesPago (idCotizacion, idOpcionesPago) VALUES (1, 1);
INSERT INTO Cotizacion_OpcionesPago (idCotizacion, idOpcionesPago) VALUES (1, 2);
INSERT INTO Cotizacion_OpcionesPago (idCotizacion, idOpcionesPago) VALUES (2, 3);
INSERT INTO Cotizacion_OpcionesPago (idCotizacion, idOpcionesPago) VALUES (2, 3);
INSERT INTO Cotizacion_OpcionesPago (idCotizacion, idOpcionesPago) VALUES (2, 3);

-- Insert telefonos
INSERT INTO Telefonos (numero) VALUES (351111111);
INSERT INTO Telefonos (numero) VALUES (351222222);
INSERT INTO Telefonos (numero) VALUES (351333333);
INSERT INTO Telefonos (numero) VALUES (351444444);
INSERT INTO Telefonos (numero) VALUES (351555555);

-- Insert clientes
INSERT INTO Clientes (nombre, apellido, direccion, email) VALUES ('Juan', 'Perez', 'Calle Ricardo Pedroni', 'juan@gmail.com');
INSERT INTO Clientes (nombre, apellido, direccion, email) VALUES ('María', 'Gonzalez', 'Calle Lamarca', 'maria@gmail.com');
INSERT INTO Clientes (nombre, apellido, direccion, email) VALUES ('Lucas','Martinez', 'Valle escondido', 'lucas@gmail.com');
INSERT INTO Clientes (nombre, apellido, direccion, email) VALUES ('Laura', 'Garcia', 'Av. Republica de china', 'lauragarcia@gmail.com');
INSERT INTO Clientes (nombre, apellido, direccion, email) VALUES ('Miguel', 'Sanchez', 'Av. Colon ', 'miguelmartinez@hotmail.com');


-- insert telefono_cliente
INSERT INTO Telefono_Cliente (idTelefono, idCliente3) VALUES (1, 1);
INSERT INTO Telefono_Cliente (idTelefono, idCliente3) VALUES (2, 2);
INSERT INTO Telefono_Cliente (idTelefono, idCliente3) VALUES (3, 3);
INSERT INTO Telefono_Cliente (idTelefono, idCliente3) VALUES (4, 4);
INSERT INTO Telefono_Cliente (idTelefono, idCliente3) VALUES (5, 5);

-- Insert productos
INSERT INTO Productos (nombre, precioVenta, cantidad, fechaUpdateStock, idCategoria) VALUES ('TV Samsung', 1000, 4, '2023-01-01', 3);
INSERT INTO Productos (nombre, precioVenta, cantidad, fechaUpdateStock, idCategoria) VALUES ('Mouse', 800, 8, '2023-01-02', 2);
INSERT INTO Productos (nombre, precioVenta, cantidad, fechaUpdateStock, idCategoria) VALUES ('Luces LED', 200, 20, '2023-01-03', 1);
INSERT INTO Productos (nombre, precioVenta, cantidad, fechaUpdateStock, idCategoria) VALUES ('Microondas', 500, 5, '2023-01-04', 4);
INSERT INTO Productos (nombre, precioVenta, cantidad, fechaUpdateStock, idCategoria) VALUES ('Taladro electrico', 200, 7, '2023-01-05', 5);

-- Insert ventas
INSERT INTO Ventas (fecha, hora, cantidad, metodoPago, idCliente) VALUES ('2023-03-03', '12:30:00', 1, 'Tarjeta de crédito', 1);
INSERT INTO Ventas (fecha, hora, cantidad, metodoPago, idCliente) VALUES ('2023-03-03', '11:30:00', 2, 'Tarjeta de crédito', 2);
INSERT INTO Ventas (fecha, hora, cantidad, metodoPago, idCliente) VALUES ('2023-02-02', '10:30:00', 3, 'Efectivo', 3);
INSERT INTO Ventas (fecha, hora, cantidad, metodoPago, idCliente) VALUES ('2023-02-02', '13:30:00', 4, 'Cheque', 4);
INSERT INTO Ventas (fecha, hora, cantidad, metodoPago, idCliente) VALUES ('2023-02-02', '14:30:00', 5, 'PayPal', 5);

-- Insert venta_producto
INSERT INTO venta_producto (nombre, cantidad, idVenta, idProducto) VALUES ('TV Samsung', 1, 1, 1);
INSERT INTO venta_producto (nombre, cantidad, idVenta, idProducto) VALUES ('Mouse', 2, 2, 2);
INSERT INTO venta_producto (nombre, cantidad, idVenta, idProducto) VALUES ('Luces LED', 3, 3, 3);
INSERT INTO venta_producto (nombre, cantidad, idVenta, idProducto) VALUES ('Microondas', 4, 4, 4);
INSERT INTO venta_producto (nombre, cantidad, idVenta, idProducto) VALUES ('Taladro electrico', 5, 5, 5);

-- Insert reparaciones
INSERT INTO Reparaciones (cliente, fechaIngresoProducto, fechaReparacion, fechaEntrega, producto, tipo, costo, tecnico, idCliente2, idProducto2) VALUES ('Juan Perez', '2023-03-15', '2023-03-15', '2023-03-18', 'TV Samsung', 'Reparacion de pantalla', 500, 'Pepe tecnico', 1, 1);
INSERT INTO Reparaciones (cliente, fechaIngresoProducto, fechaReparacion, fechaEntrega, producto, tipo, costo, tecnico, idCliente2, idProducto2) VALUES ('Maria Gonzalez', '2023-03-17', '2023-02-17', '2023-02-19', 'Mouse', 'Cambio de boton', 300, 'Martin tecnico', 2, 2);
INSERT INTO Reparaciones (cliente, fechaIngresoProducto, fechaReparacion, fechaEntrega, producto, tipo, costo, tecnico, idCliente2, idProducto2) VALUES ('Lucas Martinez', '2023-03-20', '2023-02-20', '2023-02-21', 'Luces LED', 'Reparacion de cable', 100, 'Santiago tecnico', 3, 3);
INSERT INTO Reparaciones (cliente, fechaIngresoProducto, fechaReparacion, fechaEntrega, producto, tipo, costo, tecnico, idCliente2, idProducto2) VALUES ('Laura Garcia', '2023-03-21', '2023-02-21', '2023-02-25', 'Microondas', 'Reemplazo de vidrio', 600, 'Julian tecnico', 4, 4);
INSERT INTO Reparaciones (cliente, fechaIngresoProducto, fechaReparacion, fechaEntrega, producto, tipo, costo, tecnico, idCliente2, idProducto2) VALUES ('Miguel Sanchez', '2023-03-22', '2023-02-22', '2023-02-27', 'Taladro electrico', 'Cambio de bateria', 200, 'Franco tecnico', 5, 5);

-- Query 1
SELECT c.nombre, 
    sum(p.cantidad) AS "cantidad productos", 
    SUM(vp.cantidad * p.precioVenta) AS "dinero recaudado", 
    v.cantidad AS "cantidad ventas"
FROM Categorias c
JOIN Productos p ON c.id = p.idCategoria
JOIN venta_producto vp ON p.id = vp.idProducto
JOIN Ventas v ON vp.idVenta = v.id
GROUP BY c.nombre, v.cantidad;

-- Query 2
SELECT p.nombre AS producto, 
    MAX(vp.cantidad) AS "venta maxima", 
    MIN(vp.cantidad) AS "venta minima", 
    AVG(vp.cantidad) AS "venta promedio", 
    v.fecha AS "fecha"
FROM Productos p 
INNER JOIN venta_producto vp ON p.id = vp.idProducto 
INNER JOIN Ventas v ON vp.idVenta = v.id 
GROUP BY p.nombre, v.fecha limit 10;


-- Query 3
SELECT concat(fecha, ' ', hora) AS 'Venta', sum(Ventas.cantidad*Productos.precioVenta) AS 'Monto total'
FROM Ventas
JOIN venta_producto ON Ventas.id = venta_producto.idVenta 
JOIN Productos ON venta_producto.idProducto = Productos.id
WHERE MONTH(fecha) = MONTH(CURRENT_DATE) AND YEAR(fecha) = YEAR(CURRENT_DATE)
GROUP BY fecha, hora
ORDER BY fecha DESC, hora DESC;

-- Query 4
SELECT fecha, sum(v.cantidad*p.precioVenta)
FROM Ventas v
JOIN venta_producto vp ON v.id = vp.idVenta
JOIN Productos p ON vp.idProducto = p.id
ORDER BY fecha DESC; 

SELECT p.fechaUpdateStock as 'fecha de actualizacion', p.nombre, p.precioVenta 'precio'
FROM Productos p
INNER JOIN venta_producto vp ON p.id = vp.idProducto
ORDER BY p.fechaUpdateStock;

-- Query 5
SELECT c.nombre, c.apellido, p.nombre AS categoria, COUNT(vp.cantidad) AS "cantidad compras"
FROM Clientes c
INNER JOIN Ventas v ON c.id = v.idCliente
INNER JOIN venta_producto vp ON v.id = vp.idVenta
INNER JOIN Productos p ON vp.idProducto = p.id
WHERE v.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY c.id, p.nombre
ORDER BY "cantidad compras" 
LIMIT 10;