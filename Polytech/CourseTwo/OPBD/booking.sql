CREATE TABLE client
( 
	id_client            integer  NOT NULL AUTO_INCREMENT,
	name_client          varchar(20)  NULL ,
	passport             varchar(14)  NULL ,
	phone                varchar(11)  NULL, 
	PRIMARY KEY (id_client)
)
;

CREATE TABLE service
( 
	id_service           integer NOT NULL AUTO_INCREMENT,
	name_service         varchar(20)  NULL ,
	price_service        integer  NULL,
	PRIMARY KEY (id_service) 
)
;

CREATE TABLE type_number
( 
	id_type              integer NOT NULL AUTO_INCREMENT,
	name_type            varchar(20)  NULL,
	price_day            integer  NULL, 
	PRIMARY KEY (id_type)
)
;

CREATE TABLE numbers
( 
	id_number            integer NOT NULL AUTO_INCREMENT,
	id_type_number       integer  NULL ,
	PRIMARY KEY (id_number),
	FOREIGN KEY (id_type_number) REFERENCES type_number(id_type)
)
;

CREATE TABLE booking
( 
	id_booking           integer NOT NULL AUTO_INCREMENT,
	id_client            integer  NULL ,
	date_start           datetime  NULL ,
	date_finish          datetime  NULL ,
	id_number            integer  NULL,
	come			bit NULL,
	PRIMARY KEY (id_booking),
	FOREIGN KEY (id_client) REFERENCES client(id_client),
	FOREIGN KEY (id_number) REFERENCES numbers(id_number)
)
;



CREATE TABLE order_service
( 
	id_order             integer NOT NULL AUTO_INCREMENT,
	id_booking           integer  NULL ,
	id_service           integer  NULL,
	PRIMARY KEY (id_order),
	FOREIGN KEY (id_booking) REFERENCES booking(id_booking),
	FOREIGN KEY (id_service) REFERENCES service(id_service) 
)
;

CREATE TABLE payment
( 
	id_payment           integer NOT NULL AUTO_INCREMENT,
	id_booking           integer  NULL ,
	sum_booking          integer  NULL ,
	total_sum            integer  NULL,
	PRIMARY KEY (id_payment),
	FOREIGN KEY (id_booking) REFERENCES booking(id_booking)
)
;















