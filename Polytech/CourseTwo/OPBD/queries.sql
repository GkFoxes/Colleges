SELECT     numbers.id_number, type_number.name_type, type_number.price_day, client.name_client, booking.date_start, booking.date_finish
FROM         booking INNER JOIN
                      client ON booking.id_client = client.id_client INNER JOIN
                      numbers ON booking.id_number = numbers.id_number INNER JOIN
                      type_number ON numbers.id_type_number = type_number.id_type
where booking.come = 0;

SELECT     name_service, price_service
FROM         service;

SELECT     client.name_client, type_number.name_type, numbers.id_number, booking.date_start, booking.date_finish
FROM         booking INNER JOIN
                      client ON booking.id_client = client.id_client INNER JOIN
                      numbers ON booking.id_number = numbers.id_number INNER JOIN
                      type_number ON numbers.id_type_number = type_number.id_type
where CURDATE() between booking.date_start and booking.date_finish and come = 1