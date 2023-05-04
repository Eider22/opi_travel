use opiTravel;

########################SOLUCIÓN CONSULTAS SOLICITADAS##################################
    
#a.Número de personas que han consultado vuelos mayores a un valor de 5000.000 de pesos.
SELECT COUNT(DISTINCT Customer.id) as quantity_people
from Customer
inner join Request_travel on Customer.id =  Request_travel.customer_id
inner join Travel on Request_travel.travel_id =  Travel.id
inner join Transport_type on Travel.transport_type_id =  Transport_type.id
inner join City on Customer.city_id = City.id
inner join Document_type on Customer.document_type_id= Document_type.id
where Travel.selling_price > 5000000
and
Transport_type.type = "Plane" and Transport_type.id = 1;

#b.Personas que han tomado los vuelos y han hecho el pago en efectivo.
SELECT first_name, second_name, first_lastname, other_lastnames, 
email, date_of_birth, City.name as city, Document_type.name as document_type, document_number,
Transport_type.type as transport_type, Payment_type.name as payment_type, Request_state.name as request_state
from Customer
inner join Request_travel on Customer.id =  Request_travel.customer_id
inner join Travel on Request_travel.travel_id =  Travel.id
inner join Transport_type on Travel.transport_type_id =  Transport_type.id
inner join Payment_type on Request_travel.payment_type_id = Payment_type.id
inner join City on Customer.city_id = City.id
inner join Document_type on Customer.document_type_id= Document_type.id
inner join Request_state on Request_travel.request_state_id = Request_state.id
where Payment_type.name = "Efectivo" and Payment_type.id = 1 
and
Transport_type.type = "Plane" and Transport_type.id = 1
group by Customer.id
order by Customer.id;


#c. Personas mayores a 40 años y que viven en la ciudad de Bogotá.
# NOTA IMPORTANTE: A continuación se presentarán 2 maneras de obtener esta consulta,
#  una usando una consulta simple y otra creando una función.
#Way 1 → Simple query
SELECT first_name, second_name, first_lastname, other_lastnames, date_of_birth,
email, date_of_birth, City.name, Document_type.name, document_number
FROM Customer
inner join City on Customer.city_id = City.id
inner join Document_type on Customer.document_type_id= Document_type.id
WHERE year(NOW()) - year(date_of_birth) > 40
or(
	year(NOW()) - year(date_of_birth) = 40 and
    month(NOW()) > month(date_of_birth)     
)
or
(
	year(NOW()) - year(date_of_birth) = 40 and
    month(NOW()) = month(date_of_birth) and    
    day(NOW()) >= day(date_of_birth)
);


#Way 2 → Using function
#Primero creamos la función
DELIMITER $$

CREATE FUNCTION Fn_checkAge(dateOfBirth DATE,ageExpected INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
	DECLARE ageYears INT;
	DECLARE ageMonths INT;
	DECLARE ageDays INT;
	DECLARE yes BOOLEAN;

	SET ageYears = YEAR(dateOfBirth);
	SET ageMonths = MONTH(dateOfBirth);
	SET ageDays = DAY(dateOfBirth);
	SET yes = FALSE;

	IF (YEAR(CURRENT_TIMESTAMP()) - ageYears > ageExpected) THEN
		SET yes = TRUE;
	ELSEIF (YEAR(CURRENT_TIMESTAMP()) - ageYears = ageExpected) THEN
		IF (MONTH(CURRENT_TIMESTAMP()) > ageMonths) THEN
			SET yes = TRUE;
		ELSEIF (MONTH(CURRENT_TIMESTAMP()) = ageMonths) THEN
			IF (DAY(CURRENT_TIMESTAMP()) >= ageDays) THEN
				SET yes = TRUE;
			END IF;
		END IF;
	END IF;
RETURN yes;
END $$
DELIMITER ;

#Ahora usamos la función
SELECT first_name, second_name, first_lastname, other_lastnames,
email, date_of_birth, City.name as city, Document_type.name as document_type, document_number
FROM Customer
inner join City on Customer.city_id = City.id
inner join Document_type on Customer.document_type_id= Document_type.id
WHERE  Fn_checkAge(Customer.date_of_birth, 40) = true;
    
    
#d. Listar los tipos de viajes turísticos y de negocios que se han hecho con pago con tarjeta de crédito.
#  NOTA IMPORTANTE:Realmente ya que los viajes son solicitados por diferentes clientes 
#	para el mismo viaje puede pasar que algunas personas lo pueden pagar con tarjeta y otras en efectivo, por lo que
#	interpreto que el enunciado se refiere a:
#	"Listar los tipos de viajes turísticos y de negocios que ha hecho un cliente específico con pago a través de tarjeta de crédito".
#	Teniendo en cuenta lo anterior, en este ejemplo listaré los resultados para el customer con id=1
SELECT Customer.id as customer_id, first_name, second_name, first_lastname,
Travel.selling_price as price, Travel_type.name as travel_type
from Customer
inner join Request_travel on Customer.id =  Request_travel.customer_id
inner join Travel on Request_travel.travel_id =  Travel.id
inner join City on Customer.city_id = City.id
inner join Document_type on Customer.document_type_id= Document_type.id
inner join Travel_type on Travel.travel_type_id = Travel_type.id
inner join Payment_type on Request_travel.payment_type_id = Payment_type.id
where (Travel_type.name = "Turismo" or Travel_type.name = "Negocios")
and
Payment_type.name = "Tarjeta de crédito"
and Customer.id = 1
order by Customer.id;



#e. Listar los viajes activos y cancelados
select selling_price, reservation_price, departure_date, 
c_origin.name as origin_city_name, c_target.name as target_city_name, 
Travel_type.name as travel_type, Travel_state.name as travel_state, Transport_type.type
from Travel
inner join Travel_state on Travel.travel_state_id = Travel_state.id
inner join City c_origin on Travel.origin_cyty_id = c_origin.id
inner join City c_target on Travel.target_cyty_id = c_target.id
inner join Travel_type on  Travel.travel_type_id = Travel_type.id
inner join Transport_type on Travel.transport_type_id = Transport_type.id
where Travel_state.id =1 and Travel_state.name = 'Activo'
or
Travel_state.id =3 and Travel_state.name = 'Cancelado'
group by Travel.id;