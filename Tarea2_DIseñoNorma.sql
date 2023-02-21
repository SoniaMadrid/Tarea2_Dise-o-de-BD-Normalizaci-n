--Sonia Madrid
--61811001
--Tarea 2

Create database Tarea2_Normalizacion
Use Tarea2_Normalizacion
Go
-- Ejercicio 1: Normalizar la base de datos para el registro de precios de combustible de varios países, donde sufre aumentos cada semana.

Create table Paises(
id_pais int primary key,
nombre_pais varchar (20)
);

Create table Combustible(
id_combustible int primary key,
nombre_combustible varchar (20)
);

Create table Precios(
id_precio int primary key,
id_pais int,
foreign key (id_pais) references Paises (id_pais),
fecha_registro date,
precio decimal,
id_combustible int,
foreign key (id_combustible) references Combustible (id_combustible)
);

Create table Registro(
id_registro int primary key,
id_pais int,
foreign key (id_pais) references Paises (id_pais),
id_combustible int,
foreign key (id_combustible) references Combustible (id_combustible),
id_precio int,
foreign key (id_precio) references Precios (id_precio),
precioA decimal,
fecha date
);

--Registros 1

insert into Paises(id_pais,nombre_pais) values 
(504,'Honduras'),
(505,'Nicaragua'),
(593,'Ecuador'),
(502,'Guatemala'),
(503,'El Salvador'),
(506,'Costa Rica');
Select *from Paises

insert into Combustible(id_combustible,nombre_combustible) values 
(11,'Superior'),
(21,'Regular'),
(31,'Diesel'),
(41,'LPG');
Select *from Combustible

insert into Precios(id_precio,id_pais,fecha_registro,precio,id_combustible) values
(111,504,GETDATE(),102,11),
(112,503,GETDATE(),80,21),
(113,506,GETDATE(),90,41),
(114,502,GETDATE(),100,11),
(115,593,GETDATE(),99,31),
(116,505,GETDATE(),105,11);
Select *from Precios

insert into Registro(id_registro,id_pais,id_combustible,id_precio,precioA,fecha) values
(1,504,11,111,102.65,GETDATE()),
(2,503,21,112,90.54,GETDATE()),
(3,506,41,113,90.61,GETDATE()),
(4,502,11,114,100,GETDATE()),
(5,593,31,115,80.65,GETDATE()),
(6,505,11,116,105.69,GETDATE());
Select *from Registro

--Ejercicio 2: Restaurantes 
Create table Restaurante(
id_restaurante int primary key,
nombre_restaurante varchar (50)
);

Create table Sucursal(
id_sucursal int primary key,
num_sucursal int
);

Create table Platillo(
id_platillo int primary key,
id_restaurante int,
foreign key (id_restaurante) references Restaurante (id_restaurante),
nombre varchar (50),
cantidad int,
precio decimal,
);

Create table DetalleFactura(
id_detalleFactura int primary key,
id_restaurante int,
foreign key (id_restaurante) references Restaurante (id_restaurante),
id_sucursal int,
foreign key (id_sucursal) references Sucursal (id_sucursal),
id_platillo int,
foreign key (id_platillo) references Platillo (id_platillo),
cantidad int,
precio decimal
);

--Registros 2
insert into Restaurante(id_restaurante,nombre_restaurante) values 
(504,'Pizza hut'),
(450,'Dennys'),
(652,'Papa Johns'),
(952,'Wendys'),
(214,'Subway'),
(484,'Wingers');
Select *from Restaurante

insert into Sucursal(id_sucursal,num_sucursal) values 
(16,111),
(15,222),
(12,333),
(10,444),
(9,555),
(8,666);
Select *from Sucursal

insert into Platillo(id_platillo,id_restaurante,nombre,cantidad,precio) values 
(454,504,'Palitroques', 6, 160),
(405,450,'Hamburguesa doble queso', 2, 540),
(601,652,'Pizza mediana', 1, 250),
(901,952,'Nachos', 1, 110),
(201,214,'Combo del dia', 1, 320),
(401,484,'Wingers', 1, 130);
Select *from Platillo

insert into DetalleFactura(id_detalleFactura,id_restaurante,id_sucursal,id_platillo,cantidad,precio) values 
(1,504,16,454,12,320),
(2,450,15,405,2,540),
(3,652,12,601,1, 250),
(4,952,10,901, 1, 110),
(5,214,9,201,1, 320),
(6,484,8,401,2, 260);
Select *from DetalleFactura

--Ejercicio 3: Peajes

Create table Vehiculo(
id_vehiculo int primary key,
nvehiculo varchar(50)
);

Create table Tarifa(
id_tarifa int primary key,
id_vehiculo int,
foreign key (id_vehiculo) references Vehiculo (id_vehiculo),
precio decimal
);

Create table Cobro(
id_cobro int primary key,
id_vehiculo int,
foreign key (id_vehiculo) references Vehiculo (id_vehiculo),
id_tarifa int,
foreign key (id_tarifa) references Tarifa (id_tarifa),
fecha_hora datetime
);


--Registros 3
insert into Vehiculo(id_vehiculo,nvehiculo) values 
(1,'Turismo'),
(2,'3 ejes'),
(3,'4 ejes'),
(4,'5 ejes'),
(6,'SUV');
Select *from Vehiculo

insert into Tarifa(id_tarifa,id_vehiculo,precio) values 
(12,1,6),
(13,2,12),
(14,3,16),
(11,4,25),
(20,6,36);
Select *from Tarifa

insert into Cobro(id_cobro,id_vehiculo,id_tarifa,fecha_hora) values 
(65,1,12,SYSDATETIME()),
(66,2,13,SYSDATETIME()),
(70,3,14,SYSDATETIME()),
(78,4,11,SYSDATETIME()),
(80,6,20,SYSDATETIME());
Select *from Cobro

--Ejercicio 4: Transporte

Create table Ruta(
id_ruta int primary key,
nomruta varchar (50)
);

Create table Precio(
id_precio int primary key,
id_ruta int,
foreign key (id_ruta) references Ruta (id_ruta),
cobro decimal
);

--Registros 4
insert into Ruta(id_ruta,nomruta) values 
(11,'Centro - Salida'),
(21,'Centro - Satelite'),
(31,'Centro - El progreso'),
(41,'Choloma - El progreso'),
(51,'Salida - El progreso'),
(61,'El progreso - Satelite');
Select *from Ruta


insert into Precio(id_precio,id_ruta,cobro) values 
(78,11,40),
(89,21,60),
(54,31,70),
(12,41,100),
(30,51,50),
(90,61,60);
Select *from Precio

