-- create the db 
DROP DATABASE IF EXISTS library;
CREATE DATABASE library;

-- select the db
USE library;


-- BEGIN CREATING TABLES

CREATE TABLE city 
(
	city_id			INT				PRIMARY KEY		AUTO_INCREMENT,
	city_name		VARCHAR(15)		NOT NULL 		UNIQUE
);

CREATE TABLE state 
(
	state_id		INT				PRIMARY KEY		AUTO_INCREMENT,
	state_name		VARCHAR(2)		NOT NULL 		UNIQUE
);

-- this is kinda unorganized, but examples: 
-- for books: fiction, non-fiction, fantasy, essay, etc.
-- for cd's: alternative, rock, jazz, etc.
-- no way of knowing wheather a specific genre belongs to specifc item_type
CREATE TABLE genre 
(
	genre_id		INT				PRIMARY KEY		AUTO_INCREMENT,
	genre_name		VARCHAR(20)		NOT NULL 		UNIQUE
);

CREATE TABLE branch 
(
	branch_id		INT				PRIMARY KEY		AUTO_INCREMENT,
	branch_name		VARCHAR(50)		NOT NULL		UNIQUE,
	branch_address	VARCHAR(50)		NOT NULL		UNIQUE,
	branch_city		INT 			NOT NULL,
	branch_state	INT 			NOT NULL, 
	branch_phone	VARCHAR(15)		NOT NULL,

	CONSTRAINT branch_fk_city
		FOREIGN KEY (branch_city) 
		references city (city_id),

	CONSTRAINT branch_fk_state
		FOREIGN KEY (branch_state) 
		references state (state_id)
);

# Example of catalog type: book, cd, dvd, etc.
CREATE TABLE catalog_type  
(
	catalog_type_id 	INT 			PRIMARY KEY 		AUTO_INCREMENT,
	catalog_type 		VARCHAR(25)		NOT NULL 			UNIQUE
);

-- catalog table provides name/description for a unique item
CREATE TABLE catalog
(
	catalog_id				INT 			PRIMARY KEY 	AUTO_INCREMENT,
	catalog_type_id			INT 			NOT NULL,
	genre_id 				INT 			NOT NULL,
	catalog_name 			VARCHAR(50)		NOT NULL		UNIQUE,
	catalog_author			VARCHAR(50),
	catalog_publisher		VARCHAR(50),

	CONSTRAINT catalog_fk_catalog_type
		FOREIGN KEY (catalog_type_id) 
		references catalog_type (catalog_type_id),

	CONSTRAINT catalog_fk_genre
		FOREIGN KEY (genre_id) 
		references genre (genre_id)
);

-- item table is for /all/ items available for checkout, could include several copies of the same catalog item
CREATE TABLE items
(
	item_id				INT 	PRIMARY KEY 	AUTO_INCREMENT,
	catalog_id 			INT 	NOT NULL,
	branch_id 			INT 	NOT NULL,
	item_available		BIT,
	
	# FK: catalog_ID referances catalog table for name/description
	CONSTRAINT item_fk_catalog
		FOREIGN KEY (catalog_id) 
		references catalog (catalog_id),
	# FK: branch_ID refers to item location
	CONSTRAINT item_fk_branch
		FOREIGN KEY (branch_id) 
		references branch (branch_id)
);


create table staff
(
	staff_id				INT				PRIMARY KEY		AUTO_INCREMENT,
	branch_id 				INT 			NOT NULL,
	staff_first_name		VARCHAR(50) 	NOT NULL,
	staff_last_name 		VARCHAR(50)		NOT NULL,

	CONSTRAINT staff_fk_branch
		FOREIGN KEY (branch_id) 
		references branch (branch_id)
);

Create table staff_contact
(
	staff_contact_id		INT				PRIMARY KEY		AUTO_INCREMENT,
	staff_id				INT				NOT NULL,
	branch_id 				INT 			NOT NULL,	
	staff_email				VARCHAR(75)		NOT NULL		UNIQUE,
	staff_phone				VARCHAR(15)		NOT NULL,
	staff_city 				INT 			NOT NULL,
	staff_state 			INT 			NOT NULL,

	CONSTRAINT staff_contact_fk_staff
		FOREIGN KEY (staff_id)
		references staff (staff_id),

	CONSTRAINT staff_fk_city
		FOREIGN KEY (staff_city) 
		references city (city_id),

	CONSTRAINT staff_fk_state
		FOREIGN KEY (staff_state) 
		references state (state_id)
);

CREATE TABLE members  
(
	member_id				INT				PRIMARY KEY		AUTO_INCREMENT,
	branch_id 				INT 			NOT NULL,
	member_first_name		VARCHAR(50) 	NOT NULL,
	member_last_name 		VARCHAR(50)		NOT NULL,

	CONSTRAINT members_fk_branch
		FOREIGN KEY (branch_id) 
		references branch (branch_id)
);

CREATE TABLE members_contact
( 
	member_contact_id		INT				PRIMARY KEY		AUTO_INCREMENT,
	member_id 				INT 			NOT NuLL,
	branch_id 				INT 			NOT NULL,	
	member_email			VARCHAR(75)		NOT NULL		UNIQUE,
	member_phone			VARCHAR(15)		NOT NULL,
	member_city 			INT 			NOT NULL,
	member_state 			INT 			NOT NULL,

	CONSTRAINT members_contact_fk_members
		FOREIGN KEY (member_id)
		references members (member_id),

	CONSTRAINT members_fk_city
		FOREIGN KEY (member_city) 
		references city (city_id),

	CONSTRAINT members_fk_state
		FOREIGN KEY (member_state) 
		references state (state_id)
);

CREATE TABLE checkout
(
	checkout_id		INT			PRIMARY KEY 	AUTO_INCREMENT,
	checkout_date	DATE,	
	checkout_due	DATE,
	member_ID 		INT 		NOT NULL,
	item_ID 		INT 		NOT NULL,

	# FK: member_ID referances member table for name/branch
	CONSTRAINT checkout_fk_members
		FOREIGN KEY (member_id) 
		references members (member_id),

	# FK: item_ID refers to specifc item(s)
	CONSTRAINT checkout_fk_items
		FOREIGN KEY (item_ID) 
		references items (item_ID)
);

Create table checkin
(
	checkin_id		INT			PRIMARY KEY 	AUTO_INCREMENT,
	checkin_date	DATE,	
	past_due		BIT,
	member_ID 		INT 		NOT NULL,
	item_ID 		INT 		NOT NULL,

	# FK: member_ID referances member table for name/branch
	CONSTRAINT checkin_fk_members
		FOREIGN KEY (member_id) 
		references members (member_id),

	# FK: item_ID refers to specifc item(s)
	CONSTRAINT checkin_fk_items
		FOREIGN KEY (item_ID) 
		references items (item_ID)
);

CREATE TABLE inventory
(
	inventory_ID	INT			PRIMARY KEY		AUTO_INCREMENT,
	item_ID 		INT 		NOT NULL,
	branch_id		INT,
	last_update		timestamp,

CONSTRAINT inventory_fk_items
	FOREIGN KEY (item_ID) 
	references items (item_ID),

CONSTRAINT inventory_fk_branch
	FOREIGN KEY (branch_id) 
	references branch (branch_id)
);


-- create index for catalog name
CREATE INDEX catalog_catalog_name_ix
	ON catalog (catalog_name DESC);