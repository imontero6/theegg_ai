create table cliente(
	id_cliente serial primary key,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	fecha_nacimiento date not null,
	direccion varchar(100) not null,
	telefono varchar(15) not null,
	fecha_alta date not null,
	constraint edad_minima check (fecha_nacimiento <= (current_date - interval '18' year)),
	constraint chk_phone check (telefono ~* '^\(\+[0-9]{2}\) [0-9]{9}$')
);

create table pedido (
	id_pedido serial primary key,
	id_cliente integer not null references cliente(id_cliente),
	fecha_pedido date not null,
	forma_pago varchar(20) not null,
	enviado boolean default (false),
	constraint pago check(forma_pago in ('TARJETA','PAYPAL'))
);

--Ejercicio 2
create table producto (
	id_producto serial primary key,
	nombre_producto varchar(80) not null,
	precio_unitario numeric not null,
	constraint precio_positivo check(precio_unitario >= 0)
);

--Ejercicio 3
create table descuento (
	id_producto serial primary key references producto(id_producto),
	descuento bool not null,
	cantidad_descuento numeric not null default(0.0)
);

create table pedido_producto (
	id_pedido integer references pedido(id_pedido),
	id_producto integer references producto(id_producto),
	cantidad integer not null,
	constraint cantidad_positiva check (cantidad > 0)
);

insert into cliente (
	id_cliente,nombre,apellido,fecha_nacimiento,direccion,telefono,fecha_alta)
	values (1, 'borja', 'fernandez', '23-07-1990', 'la super direccion de entrega', '(+34) 600000000', current_date);

insert into cliente (
	id_cliente,nombre,apellido,fecha_nacimiento,direccion,telefono,fecha_alta)
	values	(2, 'Ane','fernandez','23-03-1980' ,'la super direccion de entrega2','(+34) 600000001', current_date),
	(3, 'Maria', 'Goenaga','01-04-1989','la super direccion de entrega3','(+34) 600000002', current_date);

insert into producto (
	id_producto,nombre_producto,precio_unitario)
	values (1,'pasta dientes trinaca',2.3),
	(2,'pasta de diente mojate',3.00),
	(3,'Licor del caribe',4.65),
	(4,'cepillo de dientes bambú',1.00),
	(5,'cepillo de dientes juncal',0.89);

update producto
	set precio_unitario = 0.99
	where nombre_producto='cepillo de dientes juncal';

delete from
	producto
where
	nombre_producto like '%mojate%';
	
delete from
	cliente
where
	nombre like 'borja' and
	apellido like 'fernandez';

ALTER TABLE cliente DROP COLUMN fecha_alta;

--Ejercicio 8
--No se puede

--Ejercicio 9
ALTER TABLE cliente 
RENAME COLUMN apellido TO primer_apellido;

ALTER TABLE cliente
RENAME COLUMN telefono TO telefono_movil;

drop table descuento;

alter table pedido
drop constraint PEDIDO_ID_CLIENTE_FKEY;

alter table pedido add constraint PEDIDO_ID_CLIENTE_FKEY
foreign key (id_cliente) references cliente(id_cliente) on
delete cascade;

insert into public.pedido(
	id_pedido, id_cliente, fecha_pedido, forma_pago,enviado)
	values(1,7,'01-10-2022', 'TARJETA', TRUE);
	
delete from cliente where id_cliente=7;