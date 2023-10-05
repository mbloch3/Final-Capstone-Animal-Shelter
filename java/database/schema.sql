
BEGIN TRANSACTION;

DROP TABLE IF EXISTS users, pet_information, volunteer_information CASCADE;

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
	phone_number varchar(20),
	email_address varchar(80),
	has_logged_in boolean DEFAULT false
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
	pet_picture varchar(2000),
	personality_traits varchar(100),
	good_with_kids boolean,
	good_with_other_animals boolean
);

--CREATE TABLE pet_information (
--	pet_id int NOT NULL DEFAULT nextval('seq_pet_id') PRIMARY KEY,
--	pet_name varchar(50) NOT NULL,
--	pet_type varchar(50) NOT NULL,
--	pet_age int,
--	pet_gender varchar(50),
--	pet_special_needs varchar(50),
--	adopted boolean,
--	pet_picture BYTEA,
--	personality_traits varchar(100),
--	good_with_kids boolean,
--	good_with_other_animals boolean
--);


CREATE SEQUENCE seq_volunteer_app_id
INCREMENT BY 1
START WITH 2001
NO MAXVALUE;

CREATE TABLE volunteer_information(

	application_id int NOT NULL DEFAULT nextval('seq_volunteer_app_id') PRIMARY KEY,
	first_name varchar(20),
	last_name varchar(20),
	phone_number varchar(20),
	email_address varchar(50),
	over_eighteen boolean,
	approved varchar(20) DEFAULT 'pending',
	skills varchar (1000),
	mold boolean,
    house_cleaners boolean,
    other_allergies varchar(1000),
    animal_care boolean,
    grooming boolean,
    cleaning_kennels boolean,
    walking_dogs boolean,
    cat_whisperer boolean,
    customer_service boolean,
    lift_over_thirty_pounds boolean,
    laundry boolean,
    stocking_supplies boolean,
    dander boolean,
    pollen boolean

);

INSERT INTO pet_information (pet_name, pet_type, pet_age, pet_gender, pet_special_needs, adopted, pet_picture, personality_traits, good_with_kids, good_with_other_animals)
VALUES ('peanut', 'dog', 6, 'female', 'no', 'yes', 'https://tse1.mm.bing.net/th?q=homophobic%20dog%20template', 'lazy, nervous', 'yes', 'yes');

INSERT INTO pet_information (pet_name, pet_type, pet_age, pet_gender, pet_special_needs, adopted, pet_picture, personality_traits, good_with_kids, good_with_other_animals)
VALUES ('clifford', 'dog', 9, 'female', 'no', 'yes', 'https://m.media-amazon.com/images/I/81F0PqLk8yL._UF1000,1000_QL80_.jpg', 'larger than life, red', 'yes', 'yes');

INSERT INTO pet_information (pet_name, pet_type, pet_age, pet_gender, pet_special_needs, adopted, pet_picture, personality_traits, good_with_kids, good_with_other_animals)
VALUES ('doggy', 'dog', 16, 'male', 'yes - diabetes', 'no', 'https://www.thesprucepets.com/thmb/HKCGLfgi4t2x34XDNLZ8_iK-HAk=/6000x0/filters:no_upscale():strip_icc()/rules-for-walking-your-dog-1117437-06-c93d684a3f3149958c316fb2dc6c7f57.jpg', 'loves going on walks', 'no', 'no');

INSERT INTO pet_information (pet_name, pet_type, pet_age, pet_gender, pet_special_needs, adopted, pet_picture, personality_traits, good_with_kids, good_with_other_animals)
VALUES ('fluffy', 'cat', 8, 'female', 'yes- blind', 'no', 'https://media.istockphoto.com/id/499170514/photo/cat-going-blind-with-cataracts.jpg?s=612x612&w=0&k=20&c=BaGypwr4cb38QOJktK2V0RlzU2i082AWma7eB2rxbO4=', 'hides often', 'no', 'yes');

INSERT INTO pet_information (pet_name, pet_type, pet_age, pet_gender, pet_special_needs, adopted, pet_picture, personality_traits, good_with_kids, good_with_other_animals)
VALUES ('frizzle', 'bird', 8, 'female', 'no', 'yes', 'https://assets.petco.com/petco/image/upload/f_auto,q_auto/Bird%20600x400', 'loud, loves to bite', 'yes', 'no');

INSERT INTO pet_information (pet_name, pet_type, pet_age, pet_gender, pet_special_needs, adopted, pet_picture, personality_traits, good_with_kids, good_with_other_animals)
VALUES ('king julien', 'lemur', 18, 'male', 'no', 'yes', 'https://www.akronzoo.org/sites/default/files/styles/uncropped_xl/public/2022-05/Ring-tailed-lemur-main.png?itok=T7g7bQt6', 'loud, loves to sing', 'yes', 'yes');

INSERT INTO pet_information (pet_name, pet_type, pet_age, pet_gender, pet_special_needs, adopted, pet_picture, personality_traits, good_with_kids, good_with_other_animals)
VALUES ('jimbo', 'dog', 11, 'lady', 'yes- sleep apnea', 'yes', 'https://www.thisdogslife.co/wp-content/uploads/2019/02/marnie-hero-3.png', 'raging termagant, i mean look at that hat', 'no', 'no');

INSERT INTO pet_information (pet_name, pet_type, pet_age, pet_gender, pet_special_needs, adopted, pet_picture, personality_traits, good_with_kids, good_with_other_animals)
VALUES ('funbun', 'rabbit', 8, 'female', 'yes- cant jump', 'no', 'https://images.squarespace-cdn.com/content/v1/54ff9a97e4b063025cf9895c/1562176262623-5QYBI3C51T1TTDIS2JOJ/Sable+chinchilla+holland+lop+buck?format=2500w', 'old and sad, crisis-mode activated', 'no', 'no');

INSERT INTO pet_information (pet_name, pet_type, pet_age, pet_gender, pet_special_needs, adopted, pet_picture, personality_traits, good_with_kids, good_with_other_animals)
VALUES ('chubs', 'chinchilla', 9, 'male', 'yes- incontinence', 'no', 'https://a-z-animals.com/media/2021/12/Silver-animals-Chinchilla.jpg', 'happy, dusty', 'yes', 'yes');

INSERT INTO pet_information (pet_name, pet_type, pet_age, pet_gender, pet_special_needs, adopted, pet_picture, personality_traits, good_with_kids, good_with_other_animals)
VALUES ('snowball', 'rat', 4, 'female', 'no', 'no', 'https://i.redd.it/z74e00rt1m151.jpg', 'energetic, loves to snuggle', 'yes', 'no');



--Testing Volunteer Directory:
--INSERT INTO users (username, password_hash, role, first_name, last_name, phone_number, email_address, has_logged_in)
--VALUES ('newperson', 'password', 'user', 'Bob', 'Smith', '123-456-7890', 'bobsmith@gmail.com', true);

COMMIT TRANSACTION;
