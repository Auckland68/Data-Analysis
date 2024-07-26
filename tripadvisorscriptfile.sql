/* IMOGEN HULL CODE FIRST GIRLS PROJECT JULY 2024

SECTION A. THIS CODE CREATES THE DATABASE FOR TRIPADVISOR REVIEWS. 
COMMENT OUT THIS SECTION TO AVOID DUPLICATING ENTRIES

Core requirements:
1) Create a database with minimum of 5 tables  
2) Set Primary and Foreign Key contraints 
*/

-- Create database
CREATE DATABASE IF NOT EXISTS tripadvisor;
USE tripadvisor;

-- Create table restaurants
CREATE TABLE IF NOT EXISTS restaurants(
    rest_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rest_name VARCHAR(50) NOT NULL,
    address VARCHAR(50),
    postcode VARCHAR(10) NOT NULL,
    telephone VARCHAR(30),
    email VARCHAR(50),
    num_reviews INT NOT NULL,
    trip_stars FLOAT NOT NULL
    );
    
       
-- Insert data into restaurants
INSERT INTO restaurants (
rest_name, address, postcode, telephone, email, num_reviews,trip_stars)
VALUES
('Havant Tandoori', '30 Market Parade',	'PO91QF',	'tel:+44 23 9247 0856',	'havanttandoori@hotmail.co.uk',86,4.0),
('Fourteas Tearoom',	'68 West Street',	'PO91LN',	'tel:+44 23 9247 6333',	'betty@19fourteashavant.co.uk',527,4.5),
('Royal Oak',	'19 Langstone High Street',	'PO91RY',	'tel:+44 23 9248 3125',	'7955@Greeneking.co.uk',1252,3.5),				
('The Old House at Home',	'2 South Street',	'PO91DA',	'tel:+44 23 9248 3464',	'oldhouse.havant@gmail.com',402,4.5),
('KFC', '2 Park Way',	'PO91HH',	'tel:+44 23 9248 1192',NULL,78,2.0),
( 'Station Café',	'20 Market Parade',	'PO91QF',	'tel:+44 23 9247 0999',NULL,84,4.5),	
('The Heron Hungry Horse',	'Petersfield Road',	'PO92EN',	'tel:+44 23 9248 3788',	'7812@greeneking.co.uk',677,4.5),
('Rusty Cutter',	'65 Bedhampton Hill Road',	'PO93JN',	'tel:+44 23 9247 2619',	'Havant.rustycutter@whitbread.com',2031,4.5),
('Aroma Oriental',	'43 North Street',	'PO91PP',	'tel:+44 23 9249 9876',	'info@aromaoriental.co.uk',202,4.5),
('Red Chilli',	'51 North Street',	'PO91PP',	'tel:+44 23 9245 4555',	'contact@redchillihavant.com',202,4.0),
('Boswells Café',	'Meridian Centre',	'PO91UW',	'tel:+44 23 9249 2901',NULL,98,4.0),
('German Doner Kebab',	'Unit 1 Central Retail Park',	'PO91HH',	'tel:+44 23 9252 7777',	'feedback@germandonerkebab.com',75,4.0),
('Costa',	'2-4 Meridian Centre', 	'PO91UW',	'tel:+44 23 9247 8084',NULL,63,3.5),
('Lime Leaf',	'3 Market Parade',	'PO91PY',	'tel:+44 23 9219 1060',	'info@limeleaffusion.co.uk',60,4.0),
('Burger King',	'Park Road South',	'PO91ER',	'tel:+44 23 9245 4454',NULL,85,2.5),
('The Parchment Makers',	'1 Park Road North',	'PO91HE',	'tel:+44 23 9247 4023', NULL,243,3.5),
('Deep Blue',	'94 Bedhampton Road',	'PO93EZ',	'tel:+44 23 9245 4824',NULL,87,3.5),
('Wheelwrights Arms',	'27 Emsworth Road',	'PO92SN',	'tel:+44 23 9247 6502',	'info@wheelwrightshavant.co.uk',703,4.0),
('McDonalds',	'Larchwood Avenue',	'PO93BW',	'tel:+44 23 9245 1754',NULL,68,2.0),
('Langbrook Farm',	'2A Langstone Road',	'PO91RE',	'tel:+44 23 9248 0204',	'5207@greeneking.co.uk',3154,4.0),
('McDonalds',	'31/33 West Street',	'PO91ER',	'tel:+44 23 9249 8778',NULL,68,2.5),
('The Bear',	'15 East Street',	'PO91AA', 'tel:+44 23 9248 6501	9110', '@greeneking.co.uk',154,3.5),
('Shapla Tandoori',	'27 Market Parade',	'PO91PY',	'tel:+44 23 9249 9532', NULL,55,2.5),
('Dobbies Restaurant', 'Bartons Road', 'PO95NA', 	'tel:+44 23 9245 6200', NULL,72,3.0),
('The Ship Inn',	'Langstone Road',	'PO91RD',	'tel:+44 23 9247 1719',	'Ship.Langstone@fullers.co.uk',1290,4.0),
('Lavender Tea Rooms',	'8 North Street', 	'PO91PR',	'tel:+44 23 9217 8068',	'roxybrierley@ajdaccounting.co.uk',284,4.5);

-- Create table of cuisines
CREATE TABLE IF NOT EXISTS cuisines(
cuisine_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
cuisine_type VARCHAR(20));

-- Insert values into cuisines table
INSERT INTO cuisines
(cuisine_type)
VALUES
( 'Asian'),('Balti'),('Bangladeshi'),('Bar'),('British'),('Café'),('Cantonese'),('Chinese'),('European'),('Fast Food'),('Fusion'),('German'),
('Grill'),('Health'),('Hong Kong'),('Indian'),('Pub'),('Steakhouse'),('Indian'),('Seafood'),('Gastropub'),('Local cuisine'),('American'),
('Contemporary'),('Eastern European');

/*Create a bridging table for restaurants and cuisines (restaurants can have many cuisines and cuisines can be associated with many
-- restaurants*/
CREATE TABLE restaurants_cuisines (
    rest_id INT,
    cuisine_id INT,
    CONSTRAINT restcuisine_fk_restaurants FOREIGN KEY (rest_id)
        REFERENCES restaurants (rest_id),
    CONSTRAINT restcuisine_fk_cuisines FOREIGN KEY (cuisine_id)
        REFERENCES cuisines (cuisine_id)
);

-- Insert data into restaurants_cuisines table
INSERT INTO restaurants_cuisines(rest_id, cuisine_id)
VALUES
(1, 11), 
(2,6),
(2,5), 
(2,14),
(3,4), 
(3,5),
(3,13), 
(3,17),
(4,22), 
(4,4),
(4,5),
(4,17),
(4,13),
(5,10),
(6,6),
(6,5),
(7,4),
(7,5),
(7,17),
(8,18),
(8,4),
(8,5),
(9,8),
(9,7),
(9,15),
(10,16),
(10,1),
(10,2),
(10,3),
(11,6),
(11,5),
(12,12),
(12,10),
(12,9),
(12,13),
(12,11),
(12,14),
(13,6),
(14,16),
(15,10),
(16,4),
(16,5),
(16,17),
(17,20),
(17,10),
(17,5),
(18,4),
(18,5),
(18,17),
(18,21),
(19,23),
(19,10),
(20,5),
(20,17),
(21,10),
(22,4),
(22,5),
(22,24),
(22,17),
(23,16),
(23,10),
(23,2),
(23,25),
(24,6),
(24,5),
(25,4),
(25,5),
(25,17),
(26,5);


-- Create table users
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    join_date DATE,
    contributions INT,
    location VARCHAR(30)
);

# Insert user data into users table
INSERT INTO users 
(user_name, join_date, contributions, location)
VALUES
('Olivia M','2016-06-01', 1, NULL),
('grahamwelsh24','2018-05-01',16, NULL),
('Graham Y','2015-11-01', 19, NULL),
('Stephen B','2019-12-01',1,NULL),
('Carol P','2007-12-01',2, NULL),
('Samuel Edelman','2024-03-01',1, NULL),
('julietJ5537AX', '2017-10-01',27, NULL),
('Debbie K', '2013-01-01',1, NULL),
('David Bridle','2013-06-01',25,'Chichester'),
('Chris K', '2013-03-01',216, 'Portsmouth'),
('Deb L','2020-12-01',4,NULL),
('Callum','2024-05-01',1,'Guildford'),
('Sean H','2012-09-01',27,'Tamworth'),
('kevinmD2504QS','2015-02-01',3,'Hampshire'),
('Luke','2024-06-01',2,NULL),
('Nicky M','2021-07-01',6,NULL),
('Seaside652562','2016-06-01',7,NULL),
('Low Low','2022-09-01',8,'Portsmouth'),
('Samantha C','2020-06-01',1,'Italy'),
('Marcus S','2024-06-01',0, NULL),
('saayling70','2017-10-01',1, NULL),
('Matt H','2012-03-01',2, NULL),
('Phillip S','2024-06-01',0, NULL),
('ajay','2019-09-01',7,NULL),
('Gemmap494','2013-07-01',8,'Selsey'),
('Tamara G','2019-06-01',3,NULL),
('Shannon S','2022-07-01',1,NULL),
('Kyle A','2021-08-01',4	,NULL),
('Ann B','2024-06-01',1,NULL),
('William S','2024-02-01',3,NULL),
('Sammie B','2024-05-01',2,NULL),
('RR2002','2021-05-01',9,NULL),
('Jill K','2021-01-01',1,NULL),
('Mary P','2024-04-01',2,NULL),
('jeramaiha','2009-07-01',8,'Portsmouth'),
('Hayley M','2021-06-01',2,NULL),
('rayzor014','2007-12-01',65,'Eccleshall'),
('Matt B', '2024-06-01',2, NULL),
('Mandy S',	'2024-06-01',1,'Havant'),
('Mervyn R','2021-09-01',2, NULL),
('Lewis A',	'2023-06-01',2, NULL),
('elaine1408','2012-10-01',458,'UK'),
('L_A','2015-05-01',16,NULL),	
('Matters','2019-01-01',17,NULL),
('Tony V','2016-02-01',3,NULL),
('Christine D','2024-06-01',1,NULL),
('Eileen','2018-08-01',15,NULL),
('Megan S','2024-06-01',1,'Havant'),
('Voyage13712389854','2019-12-01',1,NULL),
('Michelle H','2007-11-01',2,'Portsmouth'),
('Neil H','2020-07-01',3, NULL),
('Lindsey J','2024-05-01',2, NULL),
('Butler Retired','2008-08-01',639,'Emsworth'),
('honest70','2017-10-01',22,NULL),
('KJV','2013-10-01',25,'Hambledon'),
('Graham & Marion','2022-05-01',3,NULL),
('Keith C','2024-05-01',1,NULL),
('Rich V','2023-04-01',2,NULL),
('Stuart C','2011-04-01',3816,'Bournemouth'),
('Michelle M','2024-01-01',1, NULL),
('Roxine R','2024-02-01',1,NULL),
('Pompeychic1',	'2008-02-01',595,'Portsmouth'),
('L B',	'2017-06-01',16,NULL),
('Lee P','2024-02-01',1,NULL),	
('Gerry R','2020-02-01',3,NULL),	
('sharon672024','2024-06-01',1,'Portsmouth'),
('Camper28086587862','2019-09-01',2,NULL),	
('JSV','2013-12-01',66,'Portsmouth'),
('eilidhmaria','2006-11-01',155,'Hampshire'),
('OLIVIA','2011-01-01',12,'Chichester'),
('Jak Parish','2020-09-01',2,'Fareham'),
('Kevin A','2014-06-01',62,'Havant'),
('Martin C','2024-06-01',1, NULL),
('Hannah W','2024-06-01',1, NULL),
('ella q','2024-06-01',1,NULL),	
('Liz R','2013-08-01',5,'Portsmouth'),
('michaela t','2024-06-01',1,NULL),
('Eddie T','2020-05-01',2,'Croydon'),
('Paul D','2024-06-01',1,NULL),
('Adam D','2024-06-01',1,NULL),	
('Ruby C','2024-06-01',1,NULL),
('Nicola D','2014-08-01',18,NULL),
('J M','2022-12-01',1, NULL),
('Sharon E','2024-06-01',1, NULL),
('Kayleigh J','2016-05-01',3, NULL),
('Kate W','2016-02-01',2,	'England'),
('Anthony C','2024-06-01',2, NULL),
('Alison H','2016-09-01',2, NULL),
('Shannon D','2019-08-01',1, NULL),
('Bethany K','2024-06-01',1, NULL),
('Yasmin A','2024-06-01',1, NULL),
('portsmouthtracey','2010-05-01',34, NULL),
('Daydream57772048473','2019-07-01',1, NULL),
('Ben C','2023-03-01',3, NULL),
('North Koreas only fan','2009-02-01',3,'Havant'),
('Angus M',	'2024-06-01',1, NULL),
('Paul B','2022-06-01',6,'Oxford'),
('Kimberley S',	'2023-07-01',2, NULL),
('Steph L',	'2024-06-01',0, NULL),
('Clare S', '2024-06-01',0, NULL),
('Discover30766084396','2019-06-01',0, NULL),	
('Joe C','2024-06-01',0,NULL),
('Dawn I','2010-05-01',0,'Portsmouth'),
('Issy G','2024-06-01',1,NULL),
('Safari37875804285','2024-06-01',0,NULL),
('ttg','2017-12-01',3,'Titchfield'),
('David T','2024-03-01',1,NULL),
('John J','2023-05-01',1,NULL),
('Sara C','2014-05-01',6,'Fareham'),
('J S', '2021-04-01',42,NULL),
('Felix L','2024-06-01',2,NULL),
('Alexandra P',	'2022-01-01',23,'Fishbourne'),
('Bérénice M','2016-08-01',320,'London'),
('Lee W','2012-08-01',11,NULL),
('leonyoung379','2018-02-01',89,	'Fareham'),
('Jakob M',	'2024-05-01',1, NULL),
('Les S','2020-03-01',1, NULL),
('Karen B','2014-10-01',6, NULL),	
('Olivia R','2023-06-01',4, NULL),
('Serendipitytotheend',	'2017-07-01',12,	'Hayling Island'),
('João Marcus R','2024-06-01',1, NULL),
('Debbie P','2018-10-01',1,'Sunbury-on-thames'),
('Sandy H',	'2023-02-01',1, NULL),
('Scott D',	'2017-03-01',25,'Gosport');


-- Create table ratings with constraints
CREATE TABLE IF NOT EXISTS ratings (
    rating_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rest_id INT,
    user_id INT,
    review_date DATE,
    overall_rating INT,
    value_rating INT,
    food_rating INT,
    service_rating INT,
    atmosphere_rating INT,
    CONSTRAINT check_ratings CHECK ((overall_rating IS NULL
        OR (overall_rating BETWEEN 1 AND 5)
        AND (food_rating IS NULL)
        OR (food_rating BETWEEN 1 AND 5))
        AND (value_rating IS NULL
        OR (value_rating BETWEEN 1 AND 5))
        AND (service_rating IS NULL
        OR (service_rating BETWEEN 1 AND 5))
        AND (atmosphere_rating IS NULL)
        OR (atmosphere_rating BETWEEN 1 AND 5)),
    CONSTRAINT ratings_fk_restaurants FOREIGN KEY (rest_id)
        REFERENCES restaurants (rest_id),
    CONSTRAINT ratings_fk_users FOREIGN KEY (user_id)
        REFERENCES users (user_id)
);

-- Insert data into ratings table
INSERT INTO ratings(rest_id, user_id, review_date, overall_rating, 
food_rating,value_rating,service_rating,atmosphere_rating)
VALUES
( 1, 1, '2024-06-01', 1,1,1,1,1),
( 2, 2, '2024-05-22', 5,5,5,5,5),
(2,3,'2024-05-08',5,5,5,5,5),
(2,4,'2024-05-05',5,2,3,5,5),
(2,5,'2024-04-08',1,1,3,3,3),
(2,6,'2024-04-05',5,5,4,4,5),
(3,7,'2024-06-25',2,NULL, NULL, NULL, NULL),
(3,8,'2024-06-24',1,2,2,2,1),
(3,9,'2024-06-20',3,2,2,3,4),
(3,10,'2024-06-20',3,NULL, NULL, NULL, NULL),
(3,11,'2024-06-16',5,5,5,5,5),
(3,12,'2024-06-14',5,5,5,5,5),
(3,13,'2024-06-11',4,NULL, NULL, NULL, NULL),
(3,14,'2024-06-07',5,5,5,5,5),
(3,15,'2024-06-05',5,5,5,5,5),
(3,16,'2024-06-01',5,NULL, NULL, NULL, NULL),
(3,17,'2024-05-30',5,5,5,5,5),
(3,18,'2024-05-28',5,NULL, NULL, NULL, NULL),
(3,19,'2024-05-28',4,3,3,5,5),
(4,20,'2024-06-17',5,NULL,NULL,NULL,NULL),
(4,21,'2024-06-17',5,4,5,5,5),
(4,22,'2024-06-14',5,NULL,NULL,NULL,NULL),
(4,23,'2024-05-01',1,1,1,1,4),
(5,24,'2024-04-02',5,5,5,5,5),
(6,25,'2024-06-16',5,NULL,NULL,NULL,NULL),
(7,26,'2024-06-25',5,5,5,5,5),
(7,27,'2024-06-25',5,5,5,5,5),
(7,28,'2024-06-23',5,5,5,5,5),
(7,29,'2024-06-21',5,5,5,5,5),
(7,30,'2024-06-19',5,NULL,NULL,NULL,NULL),
(7,31,'2024-06-19',5,5,5,5,5),
(7,32,'2024-06-18',5,NULL,NULL,NULL,NULL),
(8,33,'2024-06-23',5,5,4,5,5),
(8,34,'2024-06-22',5,NULL,NULL,NULL,NULL),
(8,35,'2024-06-21',5,4,4,5,4),
(8,36,'2024-06-21',5,5,5,5,4),
(8,37,'2024-06-19',4,NULL,NULL,NULL,NULL),
(8,38,'2024-06-17',5,5,5,5,5),
(8,39,'2024-06-16',5,5,5,5,5),
(8,40,'2024-06-16',5,4,5,5,4),
(8,41,'2024-06-13',5,NULL,NULL,NULL,NULL),
(8,42,'2024-06-10',2,NULL,NULL,NULL,NULL),
(8,43,'2024-06-09',5,5,5,5,5),
(8,44,'2024-06-09',5,5,5,5,5),
(8,45,'2024-06-05',5,5,5,5,5),
(8,46,'2024-06-04',5,NULL,NULL,NULL,NULL),
(8,47,'2024-06-04',5,NULL,NULL,NULL,NULL),
(8,48,'2024-06-01',5,NULL,NULL,NULL,NULL),
(8,49,'2024-06-01',5,NULL,NULL,NULL,NULL),
(8,50,'2024-06-01',5,5,5,5,5),
(8,51,'2024-05-29',5,5,5,5,5),
(8,52,'2024-05-27',5,5,5,5,4),
(9,53,'2024-03-17',1,3,1,4,1),
(9,54,'2024-03-09',3,NULL,NULL,NULL,NULL),
(10,55,'2024-05-06',4,NULL,NULL,NULL,NULL),
(10,56,'2024-01-08',1,1,1,2,1),
(11,57,'2024-05-20',5,NULL,5,5,5),
(12,58,'2024-03-06',5,5,5,5,5),
(13,59,'2024-03-10',4,NULL,NULL,NULL,NULL),
(14,60,'2024-01-20',1,1,1,1,1),
(15,61,'2024-02-12',5,5,5,5,5),
(16,62,'2023-11-13',3,NULL,NULL,NULL,NULL),
(16,63,'2023-11-02',1,1,1,1,1),
(17,64,'2024-02-15',1,NULL,NULL,NULL,NULL),
(18,65,'2024-06-20',5,5,5,5,5),
(18,66,'2024-06-19',5,NULL,NULL,NULL,NULL),
(18,67,'2024-06-04',5,NULL,NULL,NULL,NULL),
(18,68,'2024-05-29',4,3,4,3,4),
(18,69,'2024-05-27',4,3,4,5,4),
(18,70,'2024-05-02',5,5,5,5,5),
(18,71,'2024-05-01',5,NULL,NULL,NULL,NULL),
(19,72,'2024-05-12',1,NULL,NULL,NULL,NULL),
(20,73,'2024-06-25',5,5,5,5,5),
(20,74,'2024-06-25',5,NULL,NULL,NULL,NULL),
(20,75,'2024-06-24',5,5,5,5,5),
(20,76,'2024-06-23',5,5,5,5,5),
(20,77,'2024-06-23',5,5,5,5,5),
(20,78,'2024-06-18',5,5,5,5,5),
(20,79,'2024-06-16',5,NULL,NULL,NULL,NULL),
(20,80,'2024-06-16',5,NULL,NULL,NULL,NULL),
(20,81,'2024-06-16',5,5,5,5,5),
(20,82,'2024-06-15',5,5,5,5,5),
(20,83,'2024-06-15',4,NULL,NULL,NULL,NULL),
(20,84,'2024-06-15',1,1,1,1,1),
(20,85,'2024-06-14',5,NULL,NULL,NULL,NULL),
(20,86,'2024-06-13',5,NULL,NULL,NULL,NULL),
(20,87,'2024-06-13',5,5,5,5,5),
(20,88,'2024-06-13',5,NULL,NULL,NULL,NULL),
(20,89,'2024-06-13',5,NULL,NULL,NULL,NULL),
(20,90,'2024-06-13',4,5,5,5,5),
(20,91,'2024-06-12',5,NULL,NULL,NULL,NULL ),
(20,92,'2024-06-12',5,NULL,NULL,NULL,NULL),
(20,93,'2024-06-12',5,5,5,5,5),
(20,94,'2024-06-10',4,NULL,NULL,NULL,NULL),
(20,95,'2024-06-10',5,4,5,4,5),
(20,96,'2024-06-10',5,NULL,NULL,NULL,NULL),
(20,97,'2024-06-10',5,5,5,5,5),
(20,98,'2024-06-09',5,NULL,NULL,NULL,NULL),
(20,99,'2024-06-09',5,5,5,5,5),
(20,100,'2024-06-09',5,5,5,5,5),
(20,101,'2024-06-09',4,NULL,NULL,NULL,NULL),
(20,102,'2024-06-08',5,NULL,NULL,NULL,NULL),
(20,103, '2024-06-08',5,NULL,NULL,NULL,NULL),
(20,104,'2024-06-08',5,NULL,NULL,NULL,NULL),
(21,105, '2024-06-09',1,NULL,NULL,NULL,NULL),
(22,106,'2024-03-31',5,5,5,4,4),
(22,107,'2024-03-13',5,NULL,NULL,NULL,NULL),
(23,108,'2024-04-14',2,NULL,NULL,NULL,NULL),
(24,109,'2024-06-09',5,NULL,NULL,NULL,NULL),
(25,110,'2024-06-30',5,NULL,NULL,NULL,NULL),
(25,111,'2024-06-29',4,NULL,NULL,NULL,NULL),
(25,112,'2024-06-26',5,NULL,NULL,NULL,NULL),
(25,113,'2024-06-25',5,NULL,NULL,NULL,NULL),
(25,114,'2024-06-25',5,5,5,5,5),
(25,115,'2024-06-23',5,NULL,NULL,NULL,NULL),
(25,116,'2024-06-10',5,NULL,NULL,NULL,NULL),
(25,117,'2024-06-08',1,1,1,3,3),
(25,118,'2024-06-06',5,5,5,5,5),
(25,95,'2024-06-04',5,5,5,5,5),
(25,119,'2024-06-03',5,NULL,NULL,NULL,NULL),
(25,120,'2024-06-03',5,4,5,5,5),
(25,121,'2024-06-02',5,NULL,NULL,NULL,NULL),
(26,122,'2023-04-17',1,1,1,1, NULL),
(26,123,'2023-02-17',1,NULL,NULL,NULL,NULL),
(26,124,'2023-01-14',5,NULL,NULL,NULL,NULL);

-- Create table of reviews
CREATE TABLE IF NOT EXISTS reviews (
    review_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rating_id INT,
    review_title VARCHAR(200),
    review_text TEXT,
    CONSTRAINT reviews_fk_ratings FOREIGN KEY (rating_id)
        REFERENCES ratings (rating_id)
    );

-- Insert data into review table
INSERT INTO reviews (rating_id, review_title, review_text)
VALUES
(1,'DO NOT EAT THEY SERVE RAW CHICKEN','Stay away from Havant tandoori. When phoned and complained that the chicken is clearly raw they argued and said that they cook there chicken so it is pink'),
(2, 'Breakfast','What a wonderful place. The atmosphere is so good with all the furniture and items from the era. There are paper cuttings and objects to read and look at. The food and staff are excellent. We went for the Lancaster breakfast which was excellent value and cooked perfectly.'),
(3, 'Another lovely lunchtime','Another lovely lunch time meal and drinks at this unique café. The staff are always polite and attentive and cater for food allergens. The coffee was delicious - not bitter like other cafes. Panini with sides was delicious too and perfectly toasted. My husband had a toastie that was cooked just the way he requested. Prices were appropriate for the food quality and service we received. Thank you everyone once again for a lovely experience. 10/10'),
(4, 'Apart from disappointing brekki I rate it 10/10','Thought breakfast expensive for what u get not keen on sausages at all. Lovely lovely people lovely place just think brekki needs looking at'),
(5, 'Ripped off','I booked 3 Adults and one child for afternoon tea. I got questioned over the age of the child who is 11. Only realising today that the child portion was charged as an adults. I was not informed at the payment that this was going to happen. Clearly a child of 11 is not a child any longer. Will not be returning'),
(6, 'A great spot!','A great spot for some breakfast & coffee with a cosy atmosphere, as well as good service. A wonderful place to stop by and check out.'),
(7, 'Profit over service. Shoddy meal and response.','Shocking experience. Two of us ordered award winning pies which came with absolutely NO MEAT (v tasty gravy tbf!). Staff said someone else had complained also. Asked for the manager who said it was a supplier problem not the pub’s. Tried to make recompense by offering a portion of another meal. But had to be less in value, could not give a free drink for eg. So with beef gravy one had some scampi pieces, another had gammon strips fried up. In this view should have replaced the entire meal or offered a free drink etc. not our fault the supplier had messed up. Shocking handling of a valid and polite complaint. And a lime and soda at £2.75? Profit over service here.'),
(8, 'Beautiful location shame about the pub!','Great location have been many times over the years as local but will not be going again! Decor dated, female toilets disgusting, one broken the other toilet roll holder broken and toilet roll on the floor. We were sat at a window table but asked to move due to flies gathered all over the window and a hole in the top filled with a cloth and masking tape! On top of that what I can only describe as children running up and down in the room above us all night - very noisy! Such a shame, food not great either beautiful location what a waste!'),
(9, 'A great location let down by the chef','A lovely location and a lovely sunny day, unfortunately the food gets a NO. The Mediterranean vegetables in the Halloumi wrap were over done and the chorizo on the king prawn risotto was over cooked and crisp!'),
(10, 'Great location but...',"Great location but overall, disappointed with the food and service. There was no skimping on portions and this may have led us to not having so much of an appetite after the starters. That said, the starters seemed to take an age to reach us - and the pub wasn't really that busy. The squid was rather tasteless so, even though there was loads of it, it wasn't the best I'd ever had. My partner, however, loved the baked mini camembert and the copious amount of garlic focaccia that came with it. After another long wait the mains arrived; thus far, no-one has asked what we thought of the meals nor, indeed, whether or not we had any allergies. Her salad was loaded with rocket which she can't eat. They were asked to make sure there was none on the plate but apparently, this was not doable. The halloumi, on the other hand, was good. I had a huge beef and ale pie which, whilst lacking in chunks of beef, was hot, tasty and filled with a delicious gravy. The buttered mash however, was a small lump of dry stuff which tasted only slightly better when soaked in the gravy. The brocolli was limp and rather tasteless too. So, lovely place and great portions but otherwise, disappointing."),
(11, 'Great atmosphere and food','Lovely pub and great food. I had the Katsu chicken curry which i can highly recommend, and the others had the steak and ale pie which they said was delicious. We have been before and have never beendisappointed. We just want to thank Michael and irina (hopefully correct spelling) for making our visit a memorable one. Both of them were so welcoming and nothing was too much trouble. Our Niece was visiting from Canada and loved it. 😍'),
(12, 'Business','Came back here to visit for a work meeting. Again greeted by Mike, he was professional yet funny. Made for a real lighthearted meeting. Definitely be holding work lunches here more often. Also the view are incredible. Thank you Mike'),
(13, 'A Nice choice for a family meal','The food was lovely, a good selection and what we chose was well prepared and presented. The pub was busy and a little understaffed so the service was a little slow through no fault of the staff who worked hard to keep up with demand. They were attentive and polite. It was good value for money too which is always welcomed'),
(14, 'Recommend','We were really pleased with the meal. The waiter - Mike- was extremely helpful, nothing was too much trouble. Difficult to fault, great view, lovely food very welcoming'),
(15, 'Lovely','Stopped in for some drinks and ended up having dinner! Food was lovely and so were the views. Will be back again. All the staff were nice, Michael especially who was chatty and got us trying new drinks.'),
(16, 'Happy Experience',"Just wanted to share mine and my daughter's experience today, The Royal Oak is a gorgeous pub / restaurant in a fabulous location and also has very welcoming team behind bar and front oh house. However today they now have very friendly funny and professional Mike and lovely smiley Lou considering they were busy bar service was smooth and quickish and lunch was very quick it was what it said on the tin wholesome and filling . Thank you all and well done on employing people with people qualities and good customer service skills. We will be back very soon and recommend friends to visit too. Kind regards nicky and Holly xx"),
(17, 'Lovely lunch spot with hound.','Great food with good vegan options, friendly service and doggy treats from the manager, Micheal. Will be back for a visit again soon.'),
(18, 'Lovely friendly pub','Beautiful pub on the shoreline on Langstone. On arrival greeted by great barman then over to lovely Mike with a smile. It seemed our booking didn’t go through due to new system change over, no problem at all Mike went all out to make sure we still got our table. Gluten Free menu with delicious choices for myself, very impressed. Friends enjoyed their meal with great value too. Mike gave the pub a great vibe always asking if everything was ok and saw to our needs! I must say he is a true credit to your local pub thank you The Royal Oak, highly recommend 4 happy ladies !!'),
(19, 'Great service','I had a lovely afternoon in the beer garden. The service was service, and the bartenders were very friendly, especially Mike!'),
(20, 'Fathers Day','Was taken to the old house at home , havant for Father’s Day , had an excellent roast dinner, with amazing staff who were very attentive and polite . Would highly recommend and will be back soon .'),
(21, 'Lovely old pub with a friendly atmosphere','I have been to this pub several times now and the staff are friendly and welcoming, especially Amie the manager. The food is good and the building itself has a lot of character due to its 400 year age, along with a nice pub garden to sit in during the summer months. The Bands/ singers they have on a Saturday night get a lot of people dancing and the atmosphere is really good The Sunday dinners by the way are amazing!!'),
(22, 'Friendly and welcoming','Friendly staff and a great selection of beer. Euros available to watch and live music on a Friday!! Prices not too bad considering.'),
(23, 'Awful','In my honest opinion, this pub is still a far stretch from where it should be. My partner ordered pork belly which was anything but tender. The burger I ordered was ok but totally basic. It’s also very expensive, £17+ for two drinks. I don’t think the bar staff are particularly professional. There was no effort to do any St George’s day celebrations, staff were not even aware of it. Our last visit was the worst, chairs had been left out in the rain overnight and had been put back around a table, nice and ready for unsuspecting customers to park themselves, (which we did), resulting in wet trousers all around. Although we received a round of drinks, this was the last straw for us. We will not be returning to this pub for a very long time. Fullers need to take this pub back and sort it out!!'),
(24, 'Fast & Easy','Easy drive through, accessible, ordered on the app prior to arrival. Food was made hot considering it was quiet at the venue. Quick and easy!'),
(25, 'The best breakfast in town!','INCREDIBLE!! We go in here often and the service is the best around, the best breakfast I have ever had! The owner always takes his time to walk around and say hello to everyone and you can tell the staff care about everyone especially their regulars.'),
(26, 'Cheap and cheerful','Lovely food and service from Louise. Great value. Had mix up grill with chicken and the jerk chicken and wings platter. Can’t go wrong at the Heron Thank you.'),
(27, 'Lunch in the sun','Had a lovely lunch, nice food in the sun. Brilliant service from louise, nice chilled atmosphere. Obviously shall be back'),
(28, 'Good food good atmosphere','Good for a cheap meal with the family but still great service, thanks from harlee, kayleigh and kaylee for an amazing experience'),
(29, 'Friday lunch','Lovely lunch, great atmosphere, staff attentive and knowledgeable! Decent price so doesn’t break the bank! Definitely worth a visit!'),
(30, '10/10','Food was great as always, welcoming and friendly staff, ash was very helpful with me and my family and welcoming would highly recommend'),
(31, 'Pub lunch','Visited today with 2 friends we opted for the baguettes and fries and a cheeky cider in the pub garden! The food was hot and filled with flavour. Our server Harley was very attentive and polite and even recommended the donut pudding!'),
(32, 'Thank you Heron!','I visited on Sunday evening for the England match as I came here before for football and the atmosphere is amazing! The heron didn’t disappoint, all staff happy and smiling! Credit to Faith and Yvonne for upselling me anything and everything every time I approached the bar! I’ll be back for sure! 🙂🏴󠁧󠁢󠁥󠁮󠁧󠁿'),
(33, 'Closing','Such a shame once again lovely evening with really wonderful staff and good food and they are closing soon will be missed'),
(34, 'Great food, great venue but…..','To repeat the previous two comments that the five of us had a very enjoyable and impromptu dinner this early evening served by Will. Grandchildren ate what they ordered which was a pleasant surprise for us. We have been going to this venue for more than 20 years and are so disappointed that it is closing in less than two weeks time. Shame on the group for removing such a popular venue. We travel extensively in the USA and know what eating houses are like. We do not want McDonald’s all the time but are being forced to choose less appropriate places to eat.  Read less'),
(35, 'Great service','Will our was so attentive from start to finish. Checking on us during the meal to ensure everything was satisfactory can’t praise him enough food was good and fairly priced. Shame the venue is closing down.'),
(36,'Good Roast Dinner', 'Visited the Rusty cutter with family for lunch, had the roast beef which was lovely. Served by Will who was friendly and efficient as always. Would recommend a lovely roast dinner good quality food and value for money.'),
(37, 'Evening meal 5 stars breakfast 2.5',"We used the restaurant for our overnight stay with our three year old and the same as the previous year we had two contrasting meals. The evening meal was excellent. The food was a good amount, hot, tasted really good and a great selection on the menu. The breakfast wasn't the worst I've ever had but not brilliant. The beans had a skin on and were cold not even warm, the bacon was inedible as it was that cold and hard it was like leather, my poached eggs were perfect but the sausages again were warm not hot. We had more bacon and beans to replace the ones we couldn't eat but they were the same again. A good selection for the continental breakfast but would be good if there were decaf options which there weren't that day. Staff were busy but attentive for both meals and helpful when needed especially making sure our son was seen to."),
(38, 'Great Visit',"Went here for Fathers day, served by Will. Great service and great food as always. Ridiculous that they're closing this place down - terrible decision"),
(39, 'Great food and service', "Had a wonderful meal with family of 7 for Fathers Day. Waiting staff (Will) was amazing and although they were busy the food arrived in good time and was great value for money. Shame if this closes to public as we often eat here and the food and staff are always great."),
(40, 'Good','Shame it’s going. Went for a Father’s Day lunch with family. Had good food and service from Will. Had lovely breakfast especially with children'),
(41, 'Our go to for the last 10 years','Great value for money meals and great midweek night out. Been coming here for the last 10 years and staff have always been great. Always recieved extra money of vouchers too'),
(42, 'Birthday meal',"We booked a table for 1600 arrived and admit we were 5 minutes late howevervtable wasn't ready would have understood if busy but lots of empty tables we went to the bar and served by a very miserable male then sat down to eat. We had a3 year old and an 18 month old with us. Will was our server we had a voucher for 40% off main meals and my daughter whose birthday had a free birthday meal voucher on her rewards usually you cannot use two together so my daughter checked first with the manager who told her she could. We have an awkward order for Will and he got it right however it took nearly an hour for our mains to come out others in restaurant served and gone before us and we had to ask for refills twice before they came 15 mins after the last time of asking. We ordered more chips unlimited and by the time they came we had finished our meals they took ages. I have To comment on Wills attitude you could tell he was angry with us for some reason and the service lacked totally from him. I had asked for a pancake for the two children as they were getting noisy as you imagine that age you have a time frame for keeping them occupied 20 minutes passed still had not arrived my daughter whose children they were stopped will and said don't worry about the pancake got to go then when they had coats on he brought the pancakes out but obviously too late. Then will did the bill forgetting to take the free birthday meal voucher. We always leave a 12.5% tip however due to the lack of customer service did not leave one. The food was ok for 5 of us but the birthday meal the food was cold No point in complaining at the time as we could not catch wills attention. Felt I had to put on the review"),
(43, 'Love this Beefeater!','Always an amazing meal here and the staff are always friendly. Super quick service and prices are very good. Well worth being a loyalty member too as easy to collect points for money off. Which my local Beefeater was as good as this 1.'),
(44, 'Mixed Grill',"Please don't close this beefeater to locals. It's a sad day. But had a fantastic mixed grill and a few beers. Brilliant service even though the staff will be out of a job soon."),
(45, 'Great place to eat','Popped in for our son’s birthday dinner. Food was great, tasty and hot. Drinks good and service by Lisa was excellent… very friendly and welcoming. Will be back again!'),
(46, 'Sad to hear of soon to be closed','We love this restaurant . It is very good value for money . Very good for meeting up with family . Breakfast always brilliant and freshly topped up. Very upset to hear we will not be able to use soon . It’s perfectly placed for all the locals .'),
(47, 'A great night out','A relaxing evening as always. The food was excellent value with a reasonable choice and good quality food. We received exceptional service from Will.'),
(48, 'Birthday meal','Superb evening with great service from our server Will. Great atmosphere and excellent food. Always enjoy coming here for special occasions'),
(49, 'Excellent service from staff.','Our server was Will, he was Excellent, friendly, attentive, helpful and very approachable. He Made the day that extra bit special.'),
(50, 'Lunch time visit for 3','Fab food, brilliant service from Will . Most enjoyable meal thank you . Always great service at the rusty cutter one of our favourite restaurants to visit'),
(51, 'Very nice visit','Excellent visit, good value with voucher, made more pleasant by attentive staff member, Will, Thanks Beefeater, Havant'),
(52, 'Birthday celebration at The Rusty Cutter',"Visited the Rusty Cutter to celebrate a Birthday. The food arrived hot and was absolutely delicious 😋 Will, our waiter, was attentive, polite and cheerful. As my main course steak was so tasty I decided to order pud - New York Style Cheesecake, and I'm so glad I did 😋 All together a very enjoyable evening and I left feeling happy and full. Thanks Will for looking after us so well 🌟"),
(53, 'Rubbish',"I am really disappointed Having been here many times and I’ve rated it above the ones in Emsworth etc To be let down was very upsetting I ordered after walking in ….ok My food arrived in Literally 2 minutes HOW When I got home 5 minute drive the food was only warm and lacking in flavour The crispy chilli beef wasn’t it was soft It all felt like it had been cooked in the microwave 😡"),
(54, 'Not great',"After waiting an hour and a half, called restaurant, to be told would be another 10 minutes. Food arrived, chow mein luke warm, other items warm, not hot or to temperature. Ordered Singapore noodles , not given just mixed noodle. Very disappointed, didn't call restaurant as was a pre mothers day meal that my son brought for me."),
(55, 'Great Value Wednesday’s',"Always good food . Exceptional value on Wednesday banquet night. Any Starter, Main, Side, Rice or Nan, Coffee. £15.95."),
(56, 'Garbage - Worst Indian meal in over 70 years',"The food and service in this restaurant used to be very good indeed - but I haven't been there since Covid and I think that management/ownership must have changed. There is not a single good word I can say about it.The service was very average and the food was appalling. The papadams were so thin that they literally fragmented in your fingers - you couldn't really use them to hold the various chutneys that came with them. I think that some of the meats had been pre-cooked and put aside to be added to various dishes as they were ordered. Every part/piece of the mixed tandoori starter was overdone and as tough as boots. The chicken tikka was the same, whilst that in the korma tasted as if it had been cooked separately (earlier?) and simply covered in the warmed sauce for presentation/service. My own Jalfrezi - supposedly semi hot - was absolutely tasteless.I was born and have lived for many years in the Far East before coming home to UK, so I know what a good curry should taste like. I have had many excellent ones in this country. - But NOT at Red Chilli. The whole meal was honestly the WORST curry I (and my friends) have ever experienced. None of us will ever go back there again!!!"),
(57, 'A decent pot of tea','The service was prompt and the staff were polite saying good morning when I walked in. I bought a pot of Tea which was nice and hot and was the right strength whereby it had a lot of flavour without being too strong.'),
(58, 'Best for food in Havant','GDK is by far the best option for food in Havant (which has a lot of choices). The place is clean, staff are friendly and food is amazing.'),
(59, 'The standard coffee thing…','Standard Costa coffee shop. Selling all the standard items, some had run out. Staff friendly, coffee quick, all the usual?'),
(60, 'Awful food','Delivery turned up an hour late. Food was terrible meat was chewy and also the pappdoms was also soft and soggy. Meal ended up in the bin. Worst meal that we have ever had'),
(61, 'Would definitely come back food was delicious,very fast service','I rate this a very good service from the drive thru I was served fast and food was hot, tia was very polite would definitely come back .'),
(62, 'Cheap beer', 'Well, be prepared, it’s rough. I wouldn’t eat in here and the staff look like they’d punch you if you complained about anything. Toilets were clean. Beer is cheap 2 pints £6'),
(63, 'Null Pois','What a god-forsaken dump...Tim Martin is in serious trouble if this sorry place is a reflection of his idea of the hospitality industry. Tepid, nuked food served on cold plates by surly waiting staff. Filthy chairs and tables. . Cleanliness.....0 Ambiance.....0 Food...........0 Service.......0'),
(64, 'Don’t buy from these robbing companies','Very disappointed with this place I brought two meal deals cod and chips large yes the cod was large ok but I’ve had more cod in a fish finger the whole thing was batter and very little fish and the chips were covered in salt😡 there only thing going for this meal was the drink which they didn’t mess up £18.99 each. We the people are struggling to get through life as it is and when we treat our selfs we get ripped of by our local chippy I hope they lose there business soon greedy beggers. I should of got some pictures but I was so angry I just threw away😡'),
(65, 'Family Sunday Lunch for Fathers Day','We were a party of 16 for Fathers Day Sunday lunch. The booking was easy to make with quick responses to emails. On arrival we were given a really friendly greeting by all the staff but we would particularly like to thank the 2 girls that served us and went out of their way to ensure we had a good experience. Everyone in our party was really happy with their lunches. I wish I had got the name of the 2 girls as they should really have a big pat on the back for all their hard work, not just for our party but they worked so hard all the time we were there and always had a smile on their faces.'),
(66, "Father's Day meal",'Had a lovely family meal. Nothing was too much trouble for the friendly staff. Food was excellent Looking forward to trying more of their menu soon'),
(67, 'Meal at the Wheelwrights','Great place to meet with friends for supper, good ambience and outstanding service from the front of house and bar staff.'),
(68, 'Very good',"I recently visited for lunch and a roast in a week and both were excellent. Both times I started with the prawn cocktail and it was very good. Big juicy prawns with plenty of sauce, fresh salad and bread.. My roast beef was perfectly cooked and I think the carrot was the best I've eaten. The chicken, ham and leek pie was lovely with a wonderful buttery smooth mash."),
(69, 'Good Sunday roast','This is our local and we usually pop in for Happy Hour a few times a month and have Sunday roast now and again. Roast is very good and plentiful and the service is always excellent. After our meal, we wanted to sit outside but unfortunately, both of the outside areas are also smoking/vaping areas, so we had to stay indoors. It would be great if just one of the outside areas could be smoke free. I was used to ordering a large Sauvignon blanc which was about £9.00 per glass (Petal and Stem), so when I ordered my wine yesterday, I didn’t notice any change in the taste and presumed it was Petal and Stem, when we paid the bill we were both shocked to see that the large glass of wine was £14.95 per glass. The wine has now changed to New Zealand ‘Frost Pocket” which retails at £12 per bottle. I appreciate there is always a mark up but £14.95 per glass is quite shocking. Going to have Happy Hour at home instead from now on but will be back for Sunday Roast.'),
(70, 'Lucky us “ it’s our local”','Really lovely spontaneous lunch. Weather for May dreadful 🤷‍♀️ Wheelwrights welcoming, warm and food hit the spot. Managed to intercept the lovely chef and Thank her personally , staff ( Cerys & Jo) very attentive, without being intrusive, a credit to their profession. They have found the perfect balance here at the wheelwrights, whether front of house or behind the scene all the well oiled cogs make the wheels go round here at the wheelwrights ( no pun intended) Fantastic local for us. Thank you everyone.'),
(71, 'Great pub!','I regularly come in here for a pint with my work colleagues after work and the bar staff are always so friendly and are quick to serve. Best pint in Havant . And pleased to have Asahi on tap now .'),
(72, "Worst useless joke of a McDonald's","Worst McDonald's ever went through drive through had to wait in car park ten minutes with a lot of others went in to get order first girl just laughed and the manager just couldn't be bothered got food it was cold and burger was a mess I'm gonna drive to waterlooville McDonald's and I'll never use this s**t show of a McDonald's again"),
(73, 'Eating at Langbrooke Farm','This location is excellent for the family to have a comfortable and welcoming meal. We were served by Frazer whose experience and knowledge of the catering industry showed in his polite and outgoing attitude. The food was top grade so the chef knew his trade very well. As for the bar staff they were polite and caring at all times.'),
(74, 'excellent wait staff!','Frazer was a brilliant waiter and so kind and attentive. The food came out quickly and was super tasty. We really enjoyed sitting in the garden'),
(75, 'great food','great food and fantastic service. great location, easy to get to. friendly staff. good selection of food. will come again.'),
(76, 'Lovely fresh food, with great service','Had a really nice visit for a sunday. cavery. Food was fresh and hot, service was great from Fraser. Would highly recommend visiting.'),
(77, 'Brilliant food and lovely service','The food was cooked beautifully carvery was yummy and the service was outstanding very helpfull polite everything was clean'),
(78, 'Amazing buffet breakfast 5*','First time visiting but not the last, wow great value and amazing food / customer service! If you enjoy buffet breakfast then this is worth the gamble. Now our go to spot according to my partner.'),
(79, 'Great','I had a delightful dining experience! The meal was exquisitely prepared, bursting with fresh flavors and vibrant presentation. Each bite was a delightful journey, with perfectly balanced spices and textures. The staff was attentive and the ambiance was warm and inviting, making it a truly memorable culinary experience. Highly recommended!'),
(80, 'Vg','Very good place to eat, great selection and will bring the whole family here. Drinks are a bit pricey but apart from that perfect'),
(81, 'fathers day','food was delicious and my sister loved the egg yolks they were cooked to perfection. my brother loves macking cheese with protein..'),
(82, 'Attentive staff','Yummy food, massive portions! We sat in the family area and Fraser worked so hard constantly cleaning/clearing tables and making sure we had everything we needed during our visit. It’s so nice to have such an attentive staff member. You need to keep hold of him! Thanks Fraser'),
(83, 'Great evening','We had a lovely time with family with a great menu and friendly staff. The staff went above and beyond to seat us together (party of 10) despite being busy.'),
(84, 'Very poor customer service',"Visited hear today . Asked to move tables as was put in the middle no movement after 20mins so went and asked the manager finally moved tables ordered our food one being a carvery which was poor only 3 types of veg available not good choice or selection. Myself ordered the steak asked for medium came well done Chips where cold steak was chewy full of fat Don't recommend coming here"),
(85, "Great for family's",'Kids loved their food and the ice cream was yummy. Service very good lady at till super helpful and frazer was friendly and great service. Thank you'),
(86, 'Very enjoyable dinner treat','Came here for after school treat with grandchildren (age 7) Its perfect as there is a small play area. We all had carvery which was delicious. Serving staff were cheery and helpful. Special shout out to Frazer who was happy and very accomodating. Would definately come back.'),
(87, 'Family meal', 'Arrived with my daughter grandson and son in law. Got to sit in the play area which was great. Food didn’t take long to come out and was good value for money'),
(88, 'Fraser is great', 'good food Fraser is so helpful give him a raise very informative and chatty chef at carvery if also bought and engaging great service'),
(89, 'Very enjoyable and lovely food','We had a lovely meal at Langbrook Farm. Fraser was very helpful and he ensured we were happy with our food. The carvery was delicious!'),
(90, 'Great team','Great staff and great food, lovely cakes and lovely breakfast. Come every month for breakfast and same great experience every time'),
(91, 'Overall satisfactory service :)','Overall satisfied with the service, we were seated by a young girl, who was friendly and quick to serve us, however upon waiting for service at the till to order we waited a wile to be served, The staff on till service were down the side of the bar chatting. Service was quickly turned around when we were seated with our meals by Fraser a happy, bubbly and friendly guy who went above and beyond to make sure we were happy with our meals and the service, he mentioned he was leaving and my mum was sad to hear this as she visits regularly with my nan and grandad and always has a lovely experience. Sorry I couldn’t add review quicker as the connection was poor but thankyou for our cakes much appriciated and thankyou again to Fraser and the young girl on waitressing along side him :)'),
(92, 'Nice food for low prices low price drinks too service was quick and the building is lovely too would recommend for a visit','Quick service friendly staff from fraser too trying to help out as best as he could quick to tidy up too so happy with my visit'),
(93, 'Fantastic place and staff so friendly great food','Stayed at the premier inn next to langbrook farm we went for meal the staff were fantastic from start to finish of our meal . Food was great plus one of our party has an allergy and we’re totally up to date on everything this. Next time we are in Havant will definitely be visiting again . Big thanks to Langbrook farm'),
(94, 'Satisfied customer','Really enjoy popping of an evening after work bar staff are amazing an eric is really welcoming an the rest of the staff work really hard'),
(95, 'Good experience','Had a meal with friends, atmosphere was good, however it gets busy and not enough staff on bar. BETH was outstanding, always working hard'),
(96, 'Great','Had a wonderful experience today at langbrook was served by a lovely cheerful girl called Beth was quick to help me in everything I needed as well as great service from Mia will be coming back'),
(97, 'Great value and food','As always carvery is excellent value with loads to choose from, staff always friendly and helpful, highly recommend a visit.'),
(98, 'Everything’s amazing cannot fault them','Went with my family for a roast which was absolutely delicious and i devoured in much joy ! there cakes are to die for they are so tasty and look gorgeous! this was my second visit as im now obsessed and want to go every week lol . the service is great ,they are quick at getting you a table , have lovely food , an enjoyable and entertaining kids area ,great outside seating and overall amazing will definitely be going again multiple times ! cannot thank the staff enough who are so kind happy and caring!!'),
(99, 'Great food','Amazing service and great food. Very happy. And stuffed! Came for my birthday and a family meal, quick service and good customer service.'),
(100, 'Family get together','We were a party of 12 and the service was very good. The food quality was lovely too. Most of our party had carvery however, a couple ordered off of the menu. Portion sizes were generous'),
(101, 'Family meal','Good carvery today we enjoyed it waitung for dessert quite fast service included gluten free might come again next week'),
(102, 'Nice family friendly restaurant]','Food was very nice big portions for. Really good price and staff very friendly with baby. Great area for kids to play aswell.'),
(103, 'Lunch at Langbrook','Went here for a family lunch today. The food was delicious with very generous portions. Our two children had lots to choose from and particularly enjoyed their ice cream pots at the end of the meal. Fraser looked after us today and he is a real credit to the team at Langbrook Farm… he was incredibly attentive, was very friendly and went above and beyond to make sure we had a lovely meal. The children enjoyed the play area too!'),
(104, 'Overall lovely','Lovely roast Veg is all fresh Staff are very friendly Vegan roast should be cheaper then the normal meat one Very clean environment'),
(105, 'WORST MACCIES EVER… raw food and half missing','Honestly the worst mc Donald’s in and delivery I have previous got food poisoning.. thought it has been months and I would trust forgot half our food it was cold drinks not even full. I was refused my paid for order as of there ‘ Financial cost’ what about mine? This is the 3rd issue with them now. The staff were rude and managed it poorly I work in fast food and I would never treat a customer like this! Don’t go because I certainly won’t be coming back. 0/10 stars really. ⭐️'),
(106, 'Easter sunday','Visited the bear on a Easter Sunday, sat in the bar with friends and we enjoyed our meals and drinks here the woman behind the bar was amazing to deal with the awkwardness of my friends defo recommend and defo go back'),
(107, 'Relaxing','This is a very relaxing and quaint place. The staff were lovely, room comfortable, and the atmosphere was pleasant. It was great to be somewhere that had a sense of the past.'),
(108, 'It’s a shame','We used to eat here all the time but after a few bad meals we stopped, we tried again and it’s just not what it used to be, the onion bajee are far to big so they don’t cook all the way through, curry’s are to oily and the meat is tough. It’s a shame as we used to eat here a lot.'),
(109, 'Fabulous workshop and afternoon tea','Visited for the build a summer planter workshop with afternoon tea. The afternoon tea was fantastic, plenty of food both savory and sweet and the planting course with Sandie a real treat. Sandie has an exceptional knowledge of plants and is very helpful when describing the better plants to put together. It is well worth doing this event if you want a very pleasant way to spend an afternoon, Matt and his team will make you feel most welcome and you will take home a lovely planter for your garden.'),
(110, 'Delicious roast, table with a view and a lovely walk','Visited with my two sisters for a birthday. We all chose the roast from the Specials Board but there was plenty of choice on the main menu too. It arrived promptly - pork rolled with herbs and a crackling crust, with three veg, plus cauliflower cheese, plenty of roast potatoes, a huge Yorkshire pudding, delicious gravy and a home made apple sauce. It was absolutely delicious and at £18.50 really good value. We’d booked a table outside overlooking the harbour and went for a lovely walk past the mill afterwards. A really lovely day in a great spot. Everyone should go!'),
(111, 'Great lunch on the harbour','Lovely spot in Langstone, great view of the Harbour, delicious food, very attentive service from Jana and the team, will definitely revisit!'),
(112, 'Lovely experience','Really lovely pub, very relaxed and the atmosphere is really welcoming. The food and drinks are always amazing and speedy. Thank you to Welder, our server, for making our experience so much more enjoyable and peaceful. Will certainly be back soon!⭐️⭐️⭐️⭐️⭐️'),
(113, 'Great pub!','We came the first time for a coffee and the service was not very good tbh (long story they ran out of tees and gave us green tea instead of black tea without notifying us, and they gave take away cups however we wanted to seat in and everybody else had normal cups….) BUT we tried a second visit and we don’t regret it! This time we came for food and it was actually really good ! Staff was very kind and the seating area upstairs is great! Food was excellent !'),
(114, 'A must visit classic pub with high standard food!','Amazing location and fantastic food. Jana our host was perfect. A must visit if you are in the area. We had the ham and leak pie, super yummy!'),
(115, 'Perfect spot for lunch',"Arrived at The Ship Inn for lunch whilst cycling around Hayling island. Enquired about a table and we were provided with an outside table right next to the waterfront. Jana provided excellent service throughout. Beautiful views, delicious Ploughman's lunch and looked after very well by Jana too. Will definitely return."),
(116, 'Quiz night fananza!!!','Here for quiz night and the buzz around the building was incredible! The bar team were so friendly upon arrival, especially Alice and Liv. Will definitely be back every Monday from now on!'),
(117, 'Cold food twice',"Regrettably it's a poor review. 3 of us sat at 7pm starters 20 mins later waited almost an hour for mains. 2x pie mash 1x fish. The mash on both pies was cold and was sent back. however when the meals returned the mash was warm at one end cold at other. What type of chef does not check the temperature of the food served. Food sent back .paid for starters and drinks then left. Very very disappointed."),
(118, 'Lovely lunch as the Ship','Lovely venue for a birthday lunch. Easy to book in advance online, staff polite and attentive, plenty to choose from on the menu with additional ‘specials’ available too. Very happy that I picked The Ship to celebrate becoming an OAP!'),
(119, 'Sunny day drinks','As regular I always enjoy the atmosphere and the staff always work hard, Amy is especially welcoming and makes you want to come back again.'),
(120, 'Monday night quiz was fantastic','Had an absolutely brilliant time at the quiz! Jakob and Laura were great - Table service was fantastic and we were very well looked after'),
(121, 'Great night out!','Another brilliant Monday night quiz! We were looked after by Laura, who always has a smile on her face! Great night as always.'),
(122, 'Spectacular','First visit to the Ship in many years. Phoned in advance to check availability and support for Coeliacs / Gluten Free. Welder was Very helpful on the phone and booked us a table for 3. Service was excellent throughout by Welder and Yana. Sirloin Roast looked and tasted really good.'),
(123, 'Terrible customer service!',"Having previously had a good experience, my 90 year old mum and I went for lunch. We ordered prawn salads with falafel and humus from the menu. The last two items were missing on our plates, but when queried we were told that nobody ordered those so they didn't have any! We asked for an alternative and were given half a slice of bread each! I then found a hair in my salad, but when I reported this, I was told that the kitchen staff had dark hair so it wasn't theirs! I was too stunned to reply! Then I was told we couldn't expect a refund, because the hair wasn't theirs. I explained we didn't want a refund, just an apology. Never again!"),
(124, 'Disappointing!',"Very disappointed after waiting nearly an hour for a cheese scone I ordered that didn't appear, I ordered this as I was in a hurry. Its annoying when someone after you orders a jacket potato then receives their order before you!!! I won't be coming back!!"),
(125, 'Perfect light lunch','Popped for a quick lunch when out shopping with Mum. A little busy, but got lucky with a table just leaving as we arrived. Quick drinks and a little wait for the food. But when you know it’s fresh and independent you don’t mind waiting. It was well worth the wait. Good portions, hot and full of flavour. Emma (the name on the receipt) was spot on, attentive and friendly. We will definitely be back');

-- ------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------
/* SECTION B. THIS CODE ADDRESSES THE FOLLOWING CORE REQUIREMENTS:

	3) Create a view that combines multiple tables in a logical way
	4) Create a stored function that can be applied to a query in your database
	5) Prepare and example query with a subquery to demonstrate how to extract data for analysis */


/* 3) Create a view that combines tables. Create a view for the most highly rated restaurants for food and value
Which restaurants
-  serve British, pub or bar cuisine 
-  have more than 100 reviews
-  have a trip advisor rating of 4.5 or above
-  score at least one food rating and one value rating of 4.5 or above */

USE TRIPADVISOR;

CREATE VIEW vw_rest AS
    SELECT DISTINCT
        r.rest_name, num_reviews, trip_stars
    FROM
        restaurants r
            INNER JOIN
        ratings ra ON r.rest_id = ra.rest_id
            INNER JOIN
        restaurants_cuisines rc ON ra.rest_id = rc.rest_id
            INNER JOIN
        cuisines c ON rc.cuisine_id = c.cuisine_id
    WHERE
        cuisine_type IN ('British' , 'Pub',  'Bar')
            AND num_reviews >100
            AND trip_stars >=4.5
            AND food_rating >4.5
            AND value_rating >4.5
		ORDER BY num_reviews DESC;
            
            
 /* 4) Create a stored function that can be applied to a query in your database. In this example 
 calculates the number of months a user has been a member of the site based on the input of user id. */
 
USE tripadvisor;
DELIMITER //  
CREATE FUNCTION months_member(id INT)
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE joining_date DATE;
DECLARE months_joined INT;

SELECT join_date INTO joining_date 
FROM users 
WHERE user_id = id;

SET months_joined = TIMESTAMPDIFF(MONTH, joining_date,NOW());

RETURN (months_joined);
END //
DELIMITER ;
 
 /* Another example. Here the stored function takes in the rating of a restaurant and returns a string indicating whether the restaurant
 is ranked as excellent, good etc based on that rating*/

USE tripadvisor;
DELIMITER //  
CREATE FUNCTION toprestaurant(overall_rating INT)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
DECLARE rest_ranking VARCHAR(20);
    IF overall_rating = 5 THEN
        SET rest_ranking = 'Excellent';
	ELSEIF overall_rating = 4 THEN
		SET rest_ranking = 'Good';
	ELSEIF overall_rating = 3 THEN
        SET rest_ranking = 'Fair';
	ELSEIF overall_rating = 2 THEN
        SET rest_ranking = 'Poor';
	ELSEIF overall_rating = 1 THEN
        SET rest_ranking = 'Very poor';
    END IF;
 RETURN (rest_ranking);
END //
DELIMITER ;


-- 5) Prepare and example query with a subquery to demonstrate how to extract data for analysis 
/* This query finds those users who left a review and rating for restaurant id 20 (Langbrook Farm) 
and selects the user name, join date, number of contributions and location of user for that restaurant */
SELECT u.user_name, join_date, contributions, location
FROM users u
WHERE user_id IN (
    SELECT user_id
    FROM ratings
    WHERE rest_id = 20
);

-- ------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------
-- SECTION C. THIS CODE ADDRESSES THE ADVANCED REQUIREMENTS OF THE PROJECT:

-- 1. In your database, create a stored procedure and demonstrate how it runs
/* This query creates a stored procedure to update the ratings table to add a new rating including
the restaurant id the user id, the review date, overall rating, food rating, value rating, service rating
and atmosphere rating:*/

-- Change Delimiter
DELIMITER //
-- Create Stored Procedure
CREATE PROCEDURE new_rating(
IN rest_id INT,
IN user_id INT,
IN review_date DATE,
IN overall_rating INT,
IN food_rating INT,
IN value_rating INT,
IN service_rating INT,
IN atmosphere_rating INT)
BEGIN
INSERT INTO ratings(rest_id, user_id, review_date, overall_rating, 
food_rating, value_rating, service_rating, atmosphere_rating)
VALUES (rest_id, user_id, review_date, overall_rating, 
food_rating, value_rating, service_rating, atmosphere_rating);
END//
-- Change Delimiter again
DELIMITER ;

-- Call the procedure and enter data
CALL new_rating (20,95,'2024-07-15', 5,5,5,5,5);

-- Check the entry in the ratings table 
SELECT * FROM ratings;

-- Delete the entry in the ratings table
DELETE FROM ratings
WHERE rating_id = 126;

-- 2. In your database, create a trigger and demonstrate how it runs
/* This query creates a trigger to automatically update the number of previous contributions for a user 
in the `users` table whenever a new contribution is added to a separate ratings table:*/

-- Create the trigger
USE tripadvisor
DELIMITER //
CREATE TRIGGER UpdateContributionsCount
AFTER INSERT ON ratings
FOR EACH ROW
BEGIN
    UPDATE users
    SET contributions = contributions + 1
    WHERE user_id = NEW.user_id;
END //
DELIMITER ;

-- show trigger
SHOW triggers;

-- Add a new rating to the ratings table
CALL new_rating (25,119,'2024-01-01', 4,4,4,4,4);

SELECT * FROM users;

-- Set the rating value back to 4 for user 119
UPDATE users
SET contributions = 4 
WHERE user_id = 119;

-- Delete the entry in the ratings table
DELETE FROM ratings
WHERE rating_id = 127;

-- 3. In your database, create an event and demonstrate how it runs
/*This event is to calculate the total number of reviews on a monthly basis.
The event  is 'calculate_total_reviews' and is scheduled to run every minute, starting from the 
current timestamp. It calculates the total number of reviews and inserts this 
information into a separate table 'minute_review_totals' with the timestamp.*/

USE tripadvisor;
-- Enable the event scheduler if it is not already enabled
SET GLOBAL event_scheduler = ON;

-- create a table to store the total number of reviews
CREATE TABLE minute_review_totals (
    total_reviews INT,
    minute_start_time DATETIME
);

-- Create a new event to calculate the total number of reviews every minute. 
DELIMITER //

CREATE EVENT calculate_total_reviews
ON SCHEDULE
    EVERY 1 MINUTE
    STARTS CURRENT_TIMESTAMP
DO
BEGIN
    DECLARE total_reviews INT;
    
    SELECT COUNT(*) INTO total_reviews
    FROM reviews;
    
    INSERT INTO minute_review_totals (total_reviews, minute_start_time)
    VALUES (total_reviews, NOW());
END //
DELIMITER ;

-- Check the event has been created
SHOW EVENTS;

-- Check the table has updated
SELECT * FROM minute_review_totals;

/* Disable the event to pause it from occurring
ALTER EVENT calculate_total_reviews
DISABLE;*/

/*-- Enable the event to resume its scheduled execution
ALTER EVENT calculate_total_reviews
ENABLE;*/


/*-- 4. Create a view that uses at least 3-4 base tables. This query finds the fast food restaurants
that have a cuisine of fast food and review count less than 100 and an overall rating of less than 3
 */
 CREATE VIEW vw_rests2 AS
    SELECT DISTINCT
        r.rest_name, r.address, r.telephone, ra.overall_rating
    FROM
        restaurants r
            INNER JOIN
        ratings ra ON r.rest_id = ra.rest_id
            INNER JOIN
        restaurants_cuisines rc ON ra.rest_id = rc.rest_id
            INNER JOIN
        cuisines c ON rc.cuisine_id = c.cuisine_id
    WHERE
        cuisine_type = 'Fast Food'
            AND num_reviews < 100
            AND overall_rating <= 3
    ORDER BY overall_rating DESC;

/*-- 5. Prepare an example query with group by and having to demonstrate how to extract data from your DB for 
analysis. This query categorises the overall ratings from excellent to poor and shows the number of reviews
and the percentage of total reviews allocated to those categories. GROUP BY is used to group the results under the
rating description categories*/

SELECT 
    rating_description,
    COUNT(*) AS Number_reviews,
    CONCAT(FORMAT(COUNT(*) / (SELECT COUNT(*) FROM reviews) * 100, 0), '%') AS Percentage_reviews
FROM (
    SELECT 
        CASE 
            WHEN overall_rating = 5 THEN 'Excellent' 
            WHEN overall_rating = 4 THEN 'Very Good' 
            WHEN overall_rating = 3 THEN 'Good' 
            WHEN overall_rating = 2 THEN 'Fair' 
            ELSE 'Poor' 
        END AS rating_description
    FROM ratings
) AS rating_description
GROUP BY rating_description;

-- ------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------

/* SECTION D. THIS CODE INVESTIGATES THE DATABASE FURTHER WITH MORE QUERIES BASED ON THE TAUGHT MATERIAL OF THE COURSE
TO IDENTIFY SOME INTERESTING INSIGHTS AND AS SUCH IS ADDITIONAL TO THE CORE AND ADVANCED REQUIREMENTS OF THE ASSESSED PROJECT*/

-- 1. Which restaurant has the most reviews?
SELECT 
    rest_name, num_reviews
FROM
    restaurants
ORDER BY num_reviews DESC
LIMIT 5;

-- 2. Return the restaurant email information adding 'no email' if none available
SELECT 
    rest_name,
    address,
    CASE
        WHEN email IS NULL THEN 'No email available'
        ELSE email
    END AS email
FROM
    restaurants
ORDER BY rest_name;

-- 3. Concat the address and postcode columns and then the address with the town name 'Havant'
SELECT rest_name, CONCAT(address,' ,', postcode) AS address FROM restaurants;
SELECT rest_name, CONCAT(address,' ,', 'Havant') AS address FROM restaurants;

-- 4. Set the user names to remove all spaces and then set to lower case
SELECT 
    LOWER(REPLACE(user_name, ' ', '')) AS user_name
FROM
    users;

-- 5. Select a piece of the Postcode as a substring
SELECT 
    rest_name, SUBSTRING(postcode, 4, 3) AS extracted_postcode
FROM
    restaurants;

-- 6. Select just the telephone number address after the '+' sign and add a zero in front of it
SELECT 
    rest_name, 
    CONCAT("0", SUBSTRING_INDEX(telephone, '+44', - 1)) AS phone
FROM
    restaurants;
    
SELECT * FROM ratings;
    
-- 7. Which dates have the largest number of reviews written? [Around father's day]
SELECT 
    review_date, COUNT(review_date) AS rating_count
FROM
    ratings
GROUP BY review_date
ORDER BY rating_count DESC
LIMIT 10;

-- 8. Repeat the above query but use HAVING Also to limit the GROUP BY results
SELECT 
    review_date, COUNT(review_date) AS rating_count
FROM
    ratings
GROUP BY review_date
HAVING rating_count > 6
ORDER BY rating_count DESC;

-- 9. How many reviews were written between Saturday 8th June and Saturday 22 June?
SELECT 
    COUNT(review_date) AS review_count
FROM
    ratings
WHERE
    review_date BETWEEN '2024-06-08' AND '2024-06-22';
    
-- 10. Get the minimum and maximim length of review 
SELECT 
    MIN(LENGTH(review_text)) AS Min_length,
    MAX(LENGTH(review_text)) AS MAX_length
FROM
    reviews;

-- 11. Length of reviews written rated 5 in number of characters
SELECT 
    overall_rating, AVG(LENGTH(review_text)) AS average_text_length
FROM
    reviews r
LEFT JOIN ratings ra ON r.rating_id = ra.rating_id
WHERE overall_rating = 5;

-- 12. Length of review titles rated 1
SELECT 
    ra.overall_rating, AVG(LENGTH(review_text)) AS average_title_length
FROM
    reviews r
LEFT JOIN ratings ra ON r.rating_id = ra.rating_id
WHERE overall_rating = 1;

-- 13. Which user is the biggest contributor?
SELECT user_id, user_name, SUM(contributions) AS Num_contributions
FROM users 
GROUP BY user_id
ORDER BY Num_contributions DESC
LIMIT 5;

-- 14. What is the average overall rating, food, service, value and atmosphere rating for all restaurants
SELECT 
    AVG(overall_rating) AS Average_overall_rating,
    AVG(food_rating) AS Average_food_rating,
    AVG(service_rating) AS Average_service_rating,
    AVG(value_rating) AS Average_value_rating,
    AVG(atmosphere_rating) AS Average_atmosphere_rating
FROM
    ratings;

    
-- 15. Update table 
UPDATE restaurants
SET rest_name = 'McDonalds West Street'
WHERE rest_id = 21;

-- 16. Top 5 cuisines
SELECT c.cuisine_type, COUNT(*) AS cuisine_count
FROM restaurants r
JOIN restaurants_cuisines rc ON r.rest_id = rc.rest_id
JOIN cuisines c ON rc.cuisine_id = c.cuisine_id
GROUP BY c.cuisine_type
ORDER BY cuisine_count DESC
LIMIT 5;

-- 17. Which restaurants have Indian or Chinese cuisines?
SELECT r.rest_name, c.cuisine_type
FROM restaurants r
JOIN restaurants_cuisines rc ON r.rest_id = rc.rest_id
JOIN cuisines c ON rc.cuisine_id = c.cuisine_id
WHERE cuisine_type = 'Indian' OR cuisine_type = 'Chinese';

-- 18. Which restaurants have cuisines in a selected group?
SELECT r.rest_name, GROUP_CONCAT(c.cuisine_type SEPARATOR ', ') AS cuisines
FROM restaurants r
JOIN restaurants_cuisines rc ON r.rest_id = rc.rest_id
JOIN cuisines c ON rc.cuisine_id = c.cuisine_id
WHERE cuisine_type IN ('Indian', 'Bangladeshi', 'Balti', 'Asian')
GROUP BY r.rest_name;

-- 19. Which restaurants are the most highly rated?
SELECT 
    r.rest_name, COUNT(overall_rating) AS Number_reviews, AVG(overall_rating) AS Average_rating
FROM
    ratings ra
        LEFT JOIN
    restaurants r ON ra.rest_id = r.rest_id
GROUP BY rest_name
ORDER BY Average_rating DESC
LIMIT 10;

-- 20. Highest rated for food (top 5)
SELECT 
    r.rest_name, COUNT(overall_rating) AS Number_reviews, AVG(food_rating) AS Average_food_rating
FROM
    ratings ra
        LEFT JOIN
    restaurants r ON ra.rest_id = r.rest_id
GROUP BY rest_name
ORDER BY Average_food_rating DESC, rest_name
LIMIT 10;

-- 21. Which restaurants have the most 5* reviews as a percentage of total reviews?
 SELECT 
       COUNT(CASE WHEN r.overall_rating = 5 THEN 1 END) AS five_star_reviews,
       COUNT(*) AS total_reviews,
       (COUNT(CASE WHEN r.overall_rating = 5 THEN 1 END) / COUNT(*)) * 100 AS percentage,
       n.rest_name
FROM ratings r
JOIN restaurants n ON r.rest_id = n.rest_id
GROUP BY r.rest_id, n.rest_name
ORDER BY percentage DESC;

SELECT * FROM reviews;

-- 22. Which review title contain the words 'Good' or 'Excellent' and which user wrote these
SELECT 
    ra.user_id, r.review_title, ra.overall_rating, u.user_name
FROM
    reviews r
        INNER JOIN
    ratings ra ON r.rating_id = ra.rating_id
        INNER JOIN
    users u ON ra.user_id = u.user_id
WHERE
    r.review_title LIKE '%good%'
        OR r.review_title LIKE '%excellent%'
ORDER BY overall_rating DESC , user_name;

-- 23. Which review titles contain the words 'Awful' or 'Terrible' and which user wrote these
SELECT 
    ra.user_id, r.review_title, ra.overall_rating, u.user_name
FROM
    reviews r
        INNER JOIN
    ratings ra ON r.rating_id = ra.rating_id
        INNER JOIN
    users u ON ra.user_id = u.user_id
WHERE
    r.review_title LIKE '%terrible%'
        OR r.review_title LIKE '%awful%'
ORDER BY overall_rating DESC , user_name;   

-- Add fulltext to allow match searches
ALTER TABLE reviews ADD FULLTEXT(review_text);

-- 24. Choose those reviews that mention the word 'expensive' and show which restaurants it is associated with
SELECT 
    review_text, overall_rating, rest_name
FROM
    reviews r
LEFT JOIN ratings ra ON r.rating_id = ra.rating_id
LEFT JOIN restaurants rs on ra.rest_id = rs.rest_id
WHERE
    MATCH (review_text) AGAINST ('expensive' IN NATURAL LANGUAGE MODE);
    
-- 25. Choose those reviews that mention the word 'relaxing' and show which restaurants it is associated with
SELECT 
    review_text, overall_rating, rest_name
FROM
    reviews r
LEFT JOIN ratings ra ON r.rating_id = ra.rating_id
LEFT JOIN restaurants rs on ra.rest_id = rs.rest_id
WHERE
    MATCH (review_text) AGAINST ('relaxing' IN NATURAL LANGUAGE MODE);


