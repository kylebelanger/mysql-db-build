
INSERT INTO `library`.`city` (`city_name`) VALUES ('Baltimore');
INSERT INTO `library`.`city` (`city_name`) VALUES ('Annapolis');
INSERT INTO `library`.`city` (`city_name`) VALUES ('St. Marys');
INSERT INTO `library`.`city` (`city_name`) VALUES ('Prince Frederick');
INSERT INTO `library`.`city` (`city_name`) VALUES ('Calvert');
INSERT INTO `library`.`city` (`city_name`) VALUES ('Haverford');


INSERT INTO `library`.`state` (`state_name`) VALUES ('MD');
INSERT INTO `library`.`state` (`state_name`) VALUES ('FL');
INSERT INTO `library`.`state` (`state_name`) VALUES ('PA');
INSERT INTO `library`.`state` (`state_name`) VALUES ('OH');
INSERT INTO `library`.`state` (`state_name`) VALUES ('ME');
INSERT INTO `library`.`state` (`state_name`) VALUES ('VA');
INSERT INTO `library`.`state` (`state_name`) VALUES ('OR');



INSERT INTO `library`.`branch` (`branch_name`, `branch_address`, `branch_city`, `branch_state`,`branch_phone`)
VALUES 
('Enoch Pratt Free Library', '400 Cathedral St', '1', '1', '(410) 396-5430'),
('Orleans Public Library', '1303 Orleans St', '1', '1', '(410) 396-0970'),
('Forest Park Branch Library', '3023 Garrison Blvd', '1', '1', '(410) 396-0942'),
('Langsdale Library', '1415 Maryland Ave', '1', '1', '(410) 837-4260'),
('George Peabody Library', '17 E Mt. Vernon Pl', '1', '1', '(410) 234-4943');


INSERT INTO `library`.`catalog_type` (`catalog_type_id`, `catalog_type`)
VALUES
('1', 'Book'),
('2', 'Audio'),
('3', 'DVD'),
('4', 'Other');


# Genres
INSERT INTO `library`.`genre` (`genre_name`) VALUES ('non-fiction');
INSERT INTO `library`.`genre` (`genre_name`) VALUES ('fiction');
INSERT INTO `library`.`genre` (`genre_id`, `genre_name`) VALUES ('', 'fantasy');
INSERT INTO `library`.`genre` (`genre_id`, `genre_name`) VALUES ('', 'alternative');
INSERT INTO `library`.`genre` (`genre_id`, `genre_name`) VALUES ('', 'jazz');
INSERT INTO `library`.`genre` (`genre_id`, `genre_name`) VALUES ('', 'rock');
INSERT INTO `library`.`genre` (`genre_id`, `genre_name`) VALUES ('', 'reggae');
INSERT INTO `library`.`genre` (`genre_id`, `genre_name`) VALUES ('', 'essay');
INSERT INTO `library`.`genre` (`genre_id`, `genre_name`) VALUES ('', 'art');
INSERT INTO `library`.`genre` (`genre_id`, `genre_name`) VALUES ('', 'poem');


INSERT INTO `library`.`catalog` (`catalog_type_id`, 'genre_id', `catalog_name`, `catalog_author`, `catalog_publisher`)
VALUES
('1', '1', 'The Call of the Wild', 'Jack London', NULL),
('1', '2', 'Down and Out in Paris and London', 'George Orwell', NULL),
('2', '2', 'Modern Guilt', 'Beck', NULL),
('2','1', 'Oh, Inverted World', 'The Shins', NULL),
('2','1', 'Pet Sounds', 'The Beach Boys', NULL),
('3', '4', 'The Apartment', 'Billy Wilder', NULL),
('1','4', 'Maryland Law Review, Volume I', NULL, NULL),
('1','8', 'Starting Out With Java', 'Tony Gaddis', 'Pearson');



INSERT INTO `library`.`items` (`catalog_id`, `branch_id`, `item_available`)
VALUES
('1', '1', '1'),
('1', '1', '1'),
('2', '1', '1'),
('2', '2', '1'),
('2', '3', '1'),
('3', '5', '1'),
('4', '5', '1'),
('5', '1', '1'),
('6', '1', '1'),
('7', '4', '1'),
('8', '4', '1');


INSERT INTO `library`.`members` (`branch_id`, `member_first_name`, `member_last_name`, `member_email`, `member_phone`, `member_city`, `member_state`) VALUES ('1', 'Kyle', 'Belanger', 'kyle.belanger@ubalt.edu', '(240) 298-4664', '1', '1');
INSERT INTO `library`.`members` (`branch_id`, `member_first_name`, `member_last_name`, `member_email`, `member_phone`, `member_city`, `member_state`) VALUES ('1', 'Jack', 'Black', 'jack@black.com', '(410) 323-2323', '1', '1');
INSERT INTO `library`.`members` (`branch_id`, `member_first_name`, `member_last_name`, `member_email`, `member_phone`, `member_city`, `member_state`) VALUES ('2', 'Thomas', 'Desulms', 'tom@desulms.com', '(410) 232-3222', '2', '1');
INSERT INTO `library`.`members` (`branch_id`, `member_first_name`, `member_last_name`, `member_email`, `member_phone`, `member_city`, `member_state`) VALUES ('4', 'Matthew', 'Delgetty', 'matt@navy.mil', '(301) 293-3201', '2', '1');
INSERT INTO `library`.`members` (`branch_id`, `member_first_name`, `member_last_name`, `member_email`, `member_phone`, `member_city`, `member_state`) VALUES ('5', 'Nick', 'Cape', 'nick@one.com', '(301) 293-2932', '3', '2');



INSERT INTO `library`.`checkout` (`checkout_date`, `checkout_due`, `member_ID`, `item_ID`) 
VALUES 
('2014/07/20', '2014/08/20', '1', '1'),
('2014-07-20', '2014-08-20', '1', '2'),
('2014-07-20', '2014-08-20', '2', '4');
