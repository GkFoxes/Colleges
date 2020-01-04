CREATE TABLE type_number1
( 
	id_type              integer NOT NULL AUTO_INCREMENT,
	name_type            varchar(20)  NULL,
	price_day            integer  NULL, 
	PRIMARY KEY (id_type)
)
;
select * FROM type_number1;
DELIMITER |
CREATE TRIGGER `update_type_number1` AFTER INSERT ON `type_number`
FOR EACH ROW BEGIN
   INSERT INTO type_number1 Set name_type = NEW.name_type, price_day = NEW.price_day;
END









