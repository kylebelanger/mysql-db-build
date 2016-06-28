# INNER JOINS
# where branch state = MD
SELECT b.*, s.*
	FROM branch b
    inner join state s on b.branch_state = s.state_id
    WHERE b.branch_state = 1;

--

# where member city = Annapolis
SELECT m.*, c.*
	FROM members m
    inner join city c on m.member_city = c.city_id
    WHERE m.member_city = 2;

--

# where member state = PA
SELECT m.*, s.*
	FROM members m
    inner join state s on m.member_city = s.state_id
    WHERE m.member_state = 2;

--

# All Audio or Books in catalog
SELECT c.*, t.*
	FROM catalog c
	inner join catalog_type t on c.catalog_type_id = t.catalog_type_id
	WHERE c.catalog_type_id = 2 OR c.catalog_type_id = 3;

--

# All availabe CD's in stocklist (item's)
SELECT i.*, c.*
    FROM items i
    inner join catalog c on i.catalog_id = c.catalog_type_id
    WHERE c.catalog_type_id = 2;

--

# All items available at Enoch Pratt (branch ID: 1)
SELECT i.*, b.*
    FROM items i
    inner join branch b on i.branch_id = b.branch_id
    WHERE b.branch_id = 1;

--

# All books available at branch 1
SELECT i.*, c.*, b.*
    FROM items i
    inner join catalog c on i.catalog_id = c.catalog_id
    inner join branch b on i.branch_id = b.branch_id
    WHERE c.catalog_type_id = 1 AND b.branch_id = 1;

--

# All books by Mark Twain availabe in the Baltimore libraries
SELECT i.*, c.*, b.*
    FROM items i
    inner join catalog c on i.catalog_id = c.catalog_id
    inner join branch b on i.branch_id = b.branch_id
    WHERE c.catalog_author = "Mark Twain" AND b.branch_city = 1;

--

# All books by Jack London availabe in the MD libraries
SELECT i.*, c.*, b.*
    FROM items i
    inner join catalog c on i.catalog_id = c.catalog_id
    inner join branch b on i.branch_id = b.branch_id
    WHERE c.catalog_author = "Jack London" AND b.branch_state = 1;

--

# member initials
SELECT member_first_name, member_last_name,
	CONCAT(LEFT(member_first_name, 1),
			LEFT(member_last_name, 1)) AS initials
	FROM members

--

# simple select
SELECT * FROM members WHERE member_last_name = "Belanger"

--

# state = PA
SELECT * FROM members WHERE member_state = 2

--

SELECT CONCAT(member_first_name, ' ', member_last_name) 
	AS full_name 
	FROM members

--

SELECT branch_name,
	CONCAT(branch_city, branch_state)
		AS address
	FROM branch

--

# DISTINCT / Elimate duplicate rows / p.93
SELECT DISTINCT branch_city, branch_state
	FROM branch
	ORDER BY branch_city

--

SELECT * FROM branch 
	WHERE branch_state NOT IN ('DE', 'PA')

--

# Regexp to search keywords ("The")
# example: and item with "the" as a string
# returns: The Help, The Shins, The Book Theif, etc.
SELECT * FROM catalog
	WHERE catalog_name REGEXP '^The'

--

# Search keywords ("Ge")
SELECT * FROM catalog
	WHERE catalog_name LIKE 'GE%'

--

# Select all from catalog with limit and desending sort
SELECT * FROM catalog
	ORDER BY catalog_name DESC
	LIMIT 5;

--

# All DVD's and CD's in catalog
SELECT * FROM catalog 
	WHERE catalog_type_id = 2 OR catalog_type_id = 3;

--

SELECT * FROM catalog
	WHERE catalog_author = "Beck";

--

# exclude Joseph Heller from results
SELECT * FROM catalog
	WHERE catalog_author <> "Joseph Heller";

--

# All itmes that are not available for checkout
SELECT * FROM items
	WHERE item_available <> 1;

--

SELECT * FROM catalog
	WHERE catalog_author = "Beck" OR catalog_author = "The Shins";

--



