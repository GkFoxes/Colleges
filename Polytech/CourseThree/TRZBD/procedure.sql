DELIMITER |
CREATE PROCEDURE getClient()
BEGIN
	SELECT * FROM client;
END
DELIMITER |
CALL getClient();

DELIMITER |
CREATE PROCEDURE getClient1(IN name varchar(20) )
BEGIN
	SELECT * FROM client WHERE name_client=name;
END

DELIMITER |
CALL getClient1('Иванов И.И.');



