create database my_classicmodels;

use my_classicmodels;

create table productlines(
	productLine VARCHAR(50) not null,
	textDescription VARCHAR(4000) not null,
	htmlDescription MEDIUMTEXT not null,
	image MEDIUMBLOB not null,
	primary key(productLine)
) engine=innoDB default charset=utf8;

create table products(
	productCode VARCHAR(15) not null,
	productName VARCHAR(70) not null,
	productLine VARCHAR(50) not null,
	productSale VARCHAR(10) not null,
	productVendor VARCHAR(50) not null,
	productDesciption TEXT not null,
	quantityInStock SMALLINT(6) not null,
	buyPrice DOUBLE not null,
	primary key(productCode)	
) engine=innoDB default charset=utf8;

create table orders(
	orderNumber INT(11) not null AUTO_INCREMENT,
	orderDate DATETIME not null,
	requiredDate DATETIME not null,
	shippedDate DATETIME not null,
	status VARCHAR(15) not null,
	comments TEXT not null,
	customerNumber INT(11) not null,
	primary key(orderNumber)
) engine=innoDB default charset=utf8;

create table orderdetails(
	orderNumber INT(11) not null,
	productCode VARCHAR(15) not null,
	quantityOrdered INT(11) not null,
	priceEach DOUBLE not null,
	orderLineNumber SMALLINT(6),
	primary key(orderNumber, productCode)	
) engine=innoDB default charset=utf8;

alter table products add foreign key(productLine) references productlines(productLine) ON UPDATE CASCADE;
alter table orderdetails add foreign key(orderNumber) references orders(orderNumber) ON UPDATE CASCADE;
alter table orderdetails add foreign key(productCode) references products(productCode) ON UPDATE CASCADE;
