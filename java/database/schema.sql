BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS pet_information;
DROP TABLE IF EXISTS volunteer_information;

DROP SEQUENCE IF EXISTS seq_pet_id;
DROP SEQUENCE IF EXISTS seq_volunteer_app_id;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
INCREMENT BY 1
START WITH 3001
NO MAXVALUE;

CREATE TABLE users (
	user_id int NOT NULL DEFAULT nextval('seq_user_id') PRIMARY KEY,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	first_name varchar(50),
	last_name varchar(50),
	phone_number int,
	email_address varchar(80)
);

CREATE SEQUENCE seq_pet_id
INCREMENT BY 1
START WITH 1001
NO MAXVALUE;

CREATE TABLE pet_information (
	pet_id int NOT NULL DEFAULT nextval('seq_pet_id') PRIMARY KEY,
	pet_name varchar(50) NOT NULL,
	pet_type varchar(50) NOT NULL,
	pet_age int,
	pet_gender varchar(50),
	pet_special_needs varchar(50),
	adopted boolean,
	pet_picture varchar(1000),
	personality_traits varchar(100),
	good_with_kids boolean,
	good_with_other_animals boolean
);

CREATE SEQUENCE seq_volunteer_app_id
INCREMENT BY 1
START WITH 2001
NO MAXVALUE;

CREATE TABLE volunteer_information(
	application_id int NOT NULL DEFAULT nextval('seq_volunteer_app_id') PRIMARY KEY,
	volunteer_user_id int,
	over_eighteen boolean,
	approved varchar(20),
	
	CONSTRAINT FK_volunteer_user_id FOREIGN KEY (volunteer_user_id) REFERENCES users (user_id)
);

COMMIT TRANSACTION;
