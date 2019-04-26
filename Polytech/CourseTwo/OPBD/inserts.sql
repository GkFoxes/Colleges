insert into client (name_client, passport, phone)
values
('Иванов И.И.',94727793249491,29870123001),
('Журов В.В.',61866619263352,5356891213),
('Камышев В.А.',46728939186817,98897676288),
('Васильченко А.П.',40976473658964,16349326512),
('Кошкина И.И.',63396377092021,87725621482),
('Домнина А.А.',49177498689194,38609430807),
('Сидоров В.В.',99455310666608,27260862970),
('Петров А.А.',84738127013335,97963043006);

insert into type_number (name_type, price_day)
values
('люкс',5000),
('полулюкс',3500),
('двуместный',3000),
('одноместный',2000),
('трехместный',4000);

insert into numbers (id_type_number)
values
(1),
(3),
(3),
(4),
(2),
(2),
(4),
(4),
(2),
(4),
(5);

insert into booking (id_client, date_start, date_finish, id_number, come)
values
insert into booking (id_client, date_start, date_finish, id_number, come)
values
(5,'06.03.2019','15.03.2019',1,1),
(6,'07.03.2019','16.03.2019',2,1),
(7,'12.03.2019','17.03.2019',3,1),
(7,'16.03.2019','19.03.2019',4,1),
(5,'22.03.2019','23.03.2019',5,1),
(3,'25.03.2019','25.03.2019',6,1),
(6,'01.04.2019','02.04.2019',7,1),
(2,'02.04.2019','03.04.2019',8,1),
(4,'10.04.2019','12.04.2019',9,1),
(2,'13.04.2019','14.04.2019',10,1),
(5,'14.04.2019','17.04.2019',1,0),
(7,'17.04.2019','23.04.2019',2,0),
(8,'20.04.2019','25.04.2019',3,0),
(1,'26.04.2019','02.05.2019',4,0),
(7,'30.04.2019','03.05.2019',5,0);
insert into service (name_service, price_service)
values

('завтрак',1000),
('экскурсия',3000),
('трансфер',3000),
('бытовые услуги',700);

insert into order_service (id_booking, id_service)
values

(1,1),
(2,2),
(3,3),
(4,4),
(5,1),
(6,2),
(7,3),
(8,4),
(1,1),
(2,2),
(3,3),
(4,4),
(5,1),
(6,2),
(7,3),
(8,4);


insert into payment (id_booking, sum_booking, total_sum)
SELECT   booking.id_booking, sum(type_number.price_day * (TO_DAYS(date_finish) - TO_DAYS(date_start))), sum(service.price_service) + sum(type_number.price_day * (TO_DAYS(date_finish) - TO_DAYS(date_start)))
FROM         booking INNER JOIN
                      numbers ON booking.id_number = numbers.id_number INNER JOIN
                      type_number ON numbers.id_type_number = type_number.id_type INNER JOIN
                      order_service ON booking.id_booking = order_service.id_booking INNER JOIN
                      service ON order_service.id_service = service.id_service
  where come = 1 
  group by booking.id_booking    

