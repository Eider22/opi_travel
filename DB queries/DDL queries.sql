create database if not exists opiTravel;
use opiTravel;

create table if not exists Payment_type(
	id  int not null auto_increment,
    name varchar(100) unique not null,
    description varchar(500) null,
    primary key(id)
);

create table if not exists Document_type(
	id  int not null auto_increment,
    name varchar(75) unique not null,
    description varchar(500) null,
    primary key(id)
);

create table if not exists Travel_type(
	id  int not null auto_increment,
    name varchar(150) unique not null,
    description varchar(1000) null,
    primary key(id)
);

create table if not exists Request_type(
	id  int not null auto_increment,
    name varchar(150) unique not null,
    description varchar(1000) null,
    primary key(id)
);

create table if not exists Transport_type(
	id  int not null auto_increment,
    type varchar(150) unique not null,
    model varchar(150) unique not null,
    primary key(id)
);

create table if not exists Travel_state(
	id  int not null auto_increment,
    name varchar(100) unique not null,
    description varchar(500) null,
    primary key(id)
);

create table if not exists Request_state(
	id  int not null auto_increment,
    name varchar(100) unique not null,
    description varchar(500) null,
    primary key(id)
);

create table if not exists Country(
	id  int not null auto_increment,
    name varchar(150) unique not null,
    primary key(id)
);

create table if not exists Region(
	id  int not null auto_increment,
    name varchar(150) not null,
    country_id int not null,
    primary key(id),
    constraint fk_region_country foreign key(country_id) references Country(id)
);

create table if not exists City(
	id  int not null auto_increment,
    name varchar(150) not null,
    region_id int not null,
    primary key(id),
    constraint fk_city_region foreign key(region_id) references Region(id)
);

create table if not exists Customer(
	id  int not null auto_increment,
    first_name varchar(150) not null,
    second_name varchar(150) null,
    first_lastname varchar(150) not null,
    other_lastnames varchar(150) null,
    email varchar(200) unique not null,
    date_of_birth date not null,
    document_number varchar(20) not null,
    city_id int not null,
    document_type_id int not null,
    primary key(id),
	constraint fk_customer_city foreign key(city_id ) references City(id),
    constraint fk_customer_documenttype foreign key(document_type_id) references Document_type(id)
);

create table if not exists Travel(
	id  int not null auto_increment,
    selling_price float null,
    reservation_price float null,
    departure_date date null,
    origin_cyty_id int not null,
    target_cyty_id int not null,
    travel_type_id int not null,
    travel_state_id int not null,
    transport_type_id int not null,
	primary key(id),  
    constraint fk_origin_travel_city foreign key(origin_cyty_id) references City(id),
    constraint fk_target_travel_city foreign key(target_cyty_id) references City(id),
    constraint fk_travel_traveltype foreign key(travel_type_id) references Travel_type(id),
    constraint fk_travel_travelstate foreign key(travel_state_id) references Travel_state(id),
    constraint fk_travel_transporttype foreign key(transport_type_id) references Transport_type(id),
    constraint chk_unique_origin_target_cities check(origin_cyty_id <> target_cyty_id)
);

create table if not exists Request_travel(
	id  int not null auto_increment,
    request_type_id int null,
    payment_type_id int not null,
    travel_id int not null,
    customer_id int not null,
    request_state_id int not null,
    primary key(id),
    constraint fk_requesttravel_requesttype foreign key(request_type_id) references Request_type(id),
    constraint fk_requesttravel_paymenttype foreign key(payment_type_id) references Payment_type(id),
    constraint fk_requesttravel_travel foreign key(travel_id) references Travel(id),
    constraint fk_requesttravel_customer foreign key(customer_id) references Customer(id),
    constraint fk_requesttravel_requeststate foreign key(request_state_id) references Request_state(id)	
);

create table if not exists Additional_service(
	id  int not null auto_increment,
	name varchar(300) not null,
	description varchar(2000) not null,
    price float not null,    
    travel_id int not null,
    primary key(id),
    constraint fk_additionalservice_travel foreign key(travel_id) references Travel(id)
);

create table if not exists Preference(
	id  int not null auto_increment,
    additional_service_id int not null,
    request_travel_id int not null,
    primary key(id),
    constraint preference_additionalservice foreign key(additional_service_id) references Additional_service(id),
    constraint preference_requesttravel foreign key(request_travel_id) references Request_travel(id)
);

create table if not exists Seat(
	id  int not null auto_increment,
    seat_number int not null,    
    ubication varchar(150) null,
    transport_type_id int not null,
    primary key(id),
    constraint seat_transporttype foreign key(transport_type_id) references Transport_type(id)
);

create table if not exists Seat_reservation(
	id  int not null auto_increment,
    seat_id int not null,
    request_travel_id int not null,
    primary key(id),
    constraint fk_seatreservation_seat foreign key(seat_id) references Seat(id),
    constraint fk_seatreservation_requesttravel foreign key(request_travel_id) references Request_travel(id)
);