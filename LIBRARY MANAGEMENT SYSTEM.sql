CREATE DATABASE UNIVERSAL_LIBRARY;
USE UNIVERSAL_LIBRARY;
CREATE SCHEMA LIBRARY_;
GO


DROP TABLE LIBRARY_.LIBRARY_STAFF;

DESCRIBE LIBRARY_.book_details;
DROP TABLE LIBRARY_.BOOK_DETAILS;
CREATE TABLE LIBRARY_.CLASSIFICATION_AND_CATALOGING(
DDC DECIMAL,
LCC VARCHAR(255),
GENRE  VARCHAR(255),
SUBJECTS_HEADINGS VARCHAR(255)
);


 -- creating a variable stored procedure--
 CREATE PROCEDURE LIBRARY_.LIBBOOKDETAILS
  @AUTHOR VARCHAR(256) --variable declaration 
  AS
 BEGIN 
 SELECT TITLE, AUTHOR, AGE
 FROM LIBRARY_.BOOK_DETAILS
 WHERE AUTHOR= @AUTHOR;
 END
 -- NOW CALLING THE VARIABLE PROCEDURE FOR SEARCHING THE AUTHOR--
 EXEC LIBRARY_.LIBBOOKDETAILS 'SALLY ROONEY'

 -- CREATED A PROCEDURE THAT ACCEPTS A BOOK ID AND RETURNS PHYSICAL INFORMATION OF THE BOOK
 CREATE PROCEDURE RETURNDETAILS
 @BookID  INT 
 AS
 BEGIN 
 SELECT SHELF_LOCATION, AVAILABILITY_STATUS
 FROM LIBRARY_.PHYSICAL_INFORMATION
 WHERE BookID = @BookID;
 END
 --CALLING THE BOOK ID--
 EXEC RETURNDETAILS 19;
--Create a procedure to insert a new staff member In the library staff --
 CREATE PROC INSERTSTAFFMEM
 @NAME VARCHAR(255), @JOB_TITLE VARCHAR(255),  @DEPARTMENT VARCHAR(255),
@CONTACT_NO BIGINT, @OUALIFICATIONS VARCHAR(255), @WORK_EXPERIENCE VARCHAR(655), @ACHIEVEMENTS_AND_AWARDS VARCHAR(657),
@AGE INT
AS 
BEGIN 
INSERT INTO LIBRARY_.LIBRARY_STAFF( NAME, JOB_TITLE, DEPARTMENT, CONTACT_NO, OUALIFICATIONS, WORK_EXPERIENCE, ACHIEVEMENTS_AND_AWARDS, AGE)
VALUES(@NAME , @JOB_TITLE, @DEPARTMENT,@CONTACT_NO, @OUALIFICATIONS, @WORK_EXPERIENCE ,@ACHIEVEMENTS_AND_AWARDS ,@AGE );
END;

EXEC INSERTSTAFFMEM 'YASH WILSON' , 'SENIOR LIBRARIAN', 'REFERNCE AND RESEARCH', 8947542893,' MASTERS OF LIBRARY SCIENCE MLS', '10 YEARS', 'Outstanding librarian award in 2020 AND a village that is search paper on information literacy in a peer-reviewed journal', 40
-- CREATE A PROCEDURE TO UPDATE THE STOCK OF A BOOK IN THE BOOKS TABLE--
ALTER PROC UPDATETHEBOOKSTOCK
@ISBN VARCHAR(356)
AS
BEGIN 
UPDATE LIBRARY_.BOOK_DETAILS 
SET PUBLICATION_DATE ='12-09-2009'
WHERE ISBN = @ISBN;
END
--CALLING OR EXECUTING THE UPDATE THE BOOK STOCK PROCEDURE--
EXEC UPDATETHEBOOKSTOCK '978-0307387899'


CREATE TABLE LIBRARY_.PHYSICAL_INFORMATION(
 BookID INT PRIMARY KEY IDENTITY(1,1),
SHELF_LOCATION VARCHAR(255) NOT NULL,
BOOK_CONDITION VARCHAR(255) NOT NULL,
AVAILABILITY_STATUS VARCHAR(80) NOT NULL
);

SELECT *FROM  LIBRARY_.PHYSICAL_INFORMATION;
INSERT INTO LIBRARY_.PHYSICAL_INFORMATION (SHELF_LOCATION, BOOK_CONDITION, AVAILABILITY_STATUS) 
VALUES('Shelf A1', 'New', 'Available'),
('Shelf A2', 'New', 'Available'),
('Shelf A3', 'Good', 'Checked Out'),
('Shelf A4', 'Good', 'Available'),
('Shelf A5', 'Fair', 'Available'),
('Shelf A6', 'Good', 'Available'),
('Shelf A7', 'Good', 'Checked Out'),
('Shelf A8', 'New', 'Available'),
('Shelf A9', 'Good', 'Available'),
('Shelf A10', 'Good', 'Available'),

('Shelf B1', 'Good', 'Available'),
('Shelf B2', 'Fair', 'Available'),
('Shelf B3', 'Good', 'Available'),
('Shelf B4', 'New', 'Available'),
('Shelf B5', 'Good', 'Checked Out'),
('Shelf B6', 'Good', 'Available'),
('Shelf B7', 'Fair', 'Available'),
('Shelf B8', 'Good', 'Available'),
('Shelf B9', 'Good', 'Checked Out'),
('Shelf B10', 'New', 'Available'),

('Shelf C1', 'Good', 'Available'),
('Shelf C2', 'Good', 'Available'),
('Shelf C3', 'New', 'Available'),
('Shelf C4', 'Fair', 'Available'),
('Shelf C5', 'Good', 'Available'),
('Shelf C6', 'Good', 'Checked Out'),
('Shelf C7', 'New', 'Available'),
('Shelf C8', 'Good', 'Available'),
('Shelf C9', 'Good', 'Available'),
('Shelf C10', 'Fair', 'Checked Out'),

('Shelf D1', 'Good', 'Available'),
('Shelf D2', 'Good', 'Available'),
('Shelf D3', 'New', 'Available'),
('Shelf D4', 'Fair', 'Available'),
('Shelf D5', 'Good', 'Checked Out'),
('Shelf D6', 'Good', 'Available'),
('Shelf D7', 'New', 'Available'),
('Shelf D8', 'Good', 'Available'),
('Shelf D9', 'Fair', 'Checked Out'),
('Shelf D10', 'Good', 'Available'),

('Shelf E1', 'New', 'Available'),
('Shelf E2', 'Good', 'Available'),
('Shelf E3', 'Fair', 'Checked Out'),
('Shelf E4', 'Good', 'Available'),
('Shelf E5', 'New', 'Available'),
('Shelf E6', 'Good', 'Available'),
('Shelf E7', 'Good', 'Checked Out'),
('Shelf E8', 'Fair', 'Available'),
('Shelf E9', 'New', 'Available'),
('Shelf E10', 'Good', 'Available'),

('Shelf F1', 'Good', 'Available'),
('Shelf F2', 'Good', 'Checked Out'),
('Shelf F3', 'New', 'Available'),
('Shelf F4', 'Fair', 'Available'),
('Shelf F5', 'Good', 'Available'),
('Shelf F6', 'Good', 'Available'),
('Shelf F7', 'Fair', 'Checked Out'),
('Shelf F8', 'New', 'Available'),
('Shelf F9', 'Good', 'Available'),
('Shelf F10', 'Good', 'Checked Out'),

('Shelf G1', 'Good', 'Available'),
('Shelf G2', 'New', 'Available'),
('Shelf G3', 'Fair', 'Checked Out'),
('Shelf G4', 'Good', 'Available'),
('Shelf G5', 'Good', 'Available'),
('Shelf G6', 'New', 'Available'),
('Shelf G7', 'Good', 'Available'),
('Shelf G8', 'Fair', 'Checked Out'),
('Shelf G9', 'Good', 'Available'),
('Shelf G10', 'Good', 'Available'),

('Shelf H1', 'New', 'Available'),
('Shelf H2', 'Good', 'Available'),
('Shelf H3', 'Good', 'Checked Out'),
('Shelf H4', 'Fair', 'Available'),
('Shelf H5', 'Good', 'Available'),
('Shelf H6', 'New', 'Available'),
('Shelf H7', 'Good', 'Available'),
('Shelf H8', 'Fair', 'Checked Out'),
('Shelf H9', 'Good', 'Available'),
('Shelf H10', 'Good', 'Available'),

('Shelf I1', 'Good', 'Available'),
('Shelf I2', 'New', 'Available'),
('Shelf I3', 'Fair', 'Checked Out'),
('Shelf I4', 'Good', 'Available'),
('Shelf I5', 'Good', 'Checked Out'),
('Shelf I6', 'New', 'Available'),
('Shelf I7', 'Good', 'Available'),
('Shelf I8', 'Good', 'Available'),
('Shelf I9', 'Fair', 'Checked Out'),
('Shelf I10', 'Good', 'Available'),

('Shelf J1', 'Good', 'Available'),
('Shelf J2', 'New', 'Available'),
('Shelf J3', 'Fair', 'Available'),
('Shelf J4', 'Good', 'Available'),
('Shelf J5', 'New', 'Checked Out'),
('Shelf J6', 'Good', 'Available'),
('Shelf J7', 'Fair', 'Checked Out'),
('Shelf J8', 'Good', 'Available'),
('Shelf J9', 'New', 'Available'),
('Shelf J10', 'Good', 'Available'),
('Shelf K2', 'Good', 'Checked Out'),
('Shelf K3', 'Fair', 'Available'),
('Shelf K4', 'Good', 'Available'),
('Shelf K5', 'New', 'Available'),
('Shelf K6', 'Good', 'Available'),
('Shelf K7', 'Fair', 'Checked Out'),
('Shelf K8', 'Good', 'Available'),
('Shelf K9', 'New', 'Available'),
('Shelf K10', 'Good', 'Available');

CREATE TABLE LIBRARY_.BORROWING_AND_CIRCULATION(
BORROWER_ID INT,
CHECKOUT_DATE DATETIME,
DUE_DATE DATE,
BORROWER_NAME VARCHAR(255),
FEE_INFORMATION INT,
Book_ID INT,
PRIMARY KEY( Book_ID, BORROWER_ID),
FOREIGN  KEY (Book_ID)REFERENCES LIBRARY_.PHYSICAL_INFORMATION(BookID)
);

SELECT LIBRARY_.PHYSICAL_INFORMATION.SHELF_LOCATION, LIBRARY_.PHYSICAL_INFORMATION.BookID,
LIBRARY_.PHYSICAL_INFORMATION.AVAILABILITY_STATUS
FROM LIBRARY_.PHYSICAL_INFORMATION
LEFT JOIN LIBRARY_.BORROWING_AND_CIRCULATION
ON LIBRARY_.PHYSICAL_INFORMATION.BookID =LIBRARY_.BORROWING_AND_CIRCULATION.Book_ID;




INSERT INTO LIBRARY_.BORROWING_AND_CIRCULATION(BORROWER_ID, CHECKOUT_DATE, DUE_DATE, BORROWER_NAME, FEE_INFORMATION, BOOK_ID) 
VALUES
(1, '2024-01-10 10:00:00', '2024-01-24', 'Alice Johnson', 0, 45),
(2, '2024-01-12 11:30:00', '2024-01-26', 'Bob Smith', 5, 67),
(3, '2024-01-15 14:00:00', '2024-01-29', 'Carol White', 0, 12),
(4, '2024-01-16 09:00:00', '2024-01-30', 'David Brown', 2, 33),
(5, '2024-01-18 13:45:00', '2024-02-01', 'Eva Green', 0, 98),
(6, '2024-01-20 15:00:00', '2024-02-03', 'Frank Black', 10, 5),
(7, '2024-01-22 16:30:00', '2024-02-05', 'Grace Blue', 0, 76),
(8, '2024-01-24 17:15:00', '2024-02-07', 'Henry Gray', 3, 54),
(9, '2024-01-26 18:00:00', '2024-02-09', 'Isla Yellow', 0, 83),
(10, '2024-01-28 19:00:00', '2024-02-11', 'Jack Red', 5, 27),
(11, '2024-01-30 10:00:00', '2024-02-14', 'Kara Orange', 0, 101),
(12, '2024-02-01 11:30:00', '2024-02-16', 'Liam Purple', 4, 9),
(13, '2024-02-03 14:00:00', '2024-02-18', 'Mia Pink', 0, 60),
(14, '2024-02-05 09:00:00', '2024-02-20', 'Nina Cyan', 2, 34),
(15, '2024-02-07 13:45:00', '2024-02-22', 'Oliver Teal', 0, 91),
(16, '2024-02-09 15:00:00', '2024-02-24', 'Paula Indigo', 1, 20),
(17, '2024-02-11 16:30:00', '2024-02-26', 'Quinn Magenta', 0, 104),
(18, '2024-02-13 17:15:00', '2024-02-28', 'Ryan Brown', 5, 72),
(19, '2024-02-15 18:00:00', '2024-03-02', 'Sophie White', 0, 37),
(20, '2024-02-17 19:00:00', '2024-09-19', 'Tom Black', 3, 50),
(21, '2024-03-01 10:00:00', '2024-03-15', 'Uma Gray', 0, 109),
(22, '2024-03-02 11:30:00', '2024-03-16', 'Vera Blue', 2, 25),
(23, '2024-03-03 14:00:00', '2024-03-17', 'Will White', 0, 84),
(24, '2024-03-04 09:00:00', '2024-03-18', 'Xena Black', 1, 13),
(25, '2024-03-05 13:45:00', '2024-03-19', 'Yara Red', 0, 64),
(26, '2024-03-06 15:00:00', '2024-03-20', 'Zane Green', 4, 43),
(27, '2024-03-07 16:30:00', '2024-03-21', 'Ava Yellow', 5, 6),
(28, '2024-03-08 17:15:00', '2024-03-22', 'Blake Orange', 0, 95),
(29, '2024-03-09 18:00:00', '2024-03-23', 'Chloe Purple', 2, 88),
(30, '2024-03-10 19:00:00', '2024-03-24', 'Dylan Cyan', 0, 2),
(31, '2024-03-11 10:00:00', '2024-03-25', 'Ella Magenta', 3, 57),
(32, '2024-03-12 11:30:00', '2024-03-26', 'Finn Black', 0, 31),
(33, '2024-03-13 14:00:00', '2024-03-27', 'Gina Gray', 4, 74),
(34, '2024-03-14 09:00:00', '2024-03-28', 'Hugo Brown', 0, 19),
(35, '2024-03-15 13:45:00', '2024-03-29', 'Ivy White', 5, 102),
(36, '2024-03-16 15:00:00', '2024-03-30', 'Jake Blue', 0, 78),
(37, '2024-03-17 16:30:00', '2024-03-31', 'Lila Red', 2, 17),
(38, '2024-03-18 17:15:00', '2024-04-01', 'Milo Green', 0, 93),
(39, '2024-03-19 18:00:00', '2024-04-02', 'Nora Orange', 3, 48),
(40, '2024-03-20 19:00:00', '2024-04-03', 'Owen Purple', 0, 22),
(41, '2024-04-01 10:00:00', '2024-04-15', 'Penny Cyan', 0, 81),
(42, '2024-04-02 11:30:00', '2024-04-16', 'Quinn Yellow', 2, 4),
(43, '2024-04-03 14:00:00', '2024-04-17', 'Riley Black', 0, 63),
(44, '2024-04-04 09:00:00', '2024-04-18', 'Sam Brown', 1, 36),
(45, '2024-04-05 13:45:00', '2024-04-19', 'Tina Green', 0, 92),
(46, '2024-04-06 15:00:00', '2024-04-20', 'Ulysses White', 4, 8),
(47, '2024-04-07 16:30:00', '2024-04-21', 'Violet Red', 5, 105),
(48, '2024-04-08 17:15:00', '2024-04-22', 'Willow Blue', 0, 28),
(49, '2024-04-09 18:00:00', '2024-04-23', 'Xander Gray', 2, 71),
(50, '2024-04-10 19:00:00', '2024-04-24', 'Yasmine Yellow', 0, 14),
(51, '2024-04-11 10:00:00', '2024-04-25', 'Zara Purple', 3, 99),
(52, '2024-04-12 11:30:00', '2024-04-26', 'Aiden Black', 0, 24),
(53, '2024-04-13 14:00:00', '2024-04-27', 'Brooke White', 4, 47),
(54, '2024-04-14 09:00:00', '2024-04-28', 'Carter Red', 0, 85),
(55, '2024-04-15 13:45:00', '2024-04-29', 'Daisy Green', 5, 16),
(56, '2024-04-16 15:00:00', '2024-04-30', 'Ethan Blue', 0, 66),
(57, '2024-04-17 16:30:00', '2024-05-01', 'Fiona Yellow', 2, 3),
(58, '2024-04-18 17:15:00', '2024-05-02', 'Gabe Orange', 0, 102),
(59, '2024-04-19 18:00:00', '2024-05-03', 'Holly Black', 3, 39),
(60, '2024-04-20 19:00:00', '2024-05-04', 'Ian Green', 0, 53),
(61, '2024-05-01 10:00:00', '2024-05-15', 'Jade White', 0, 100),
(62, '2024-05-02 11:30:00', '2024-05-16', 'Kyle Purple', 2, 7),
(63, '2024-05-03 14:00:00', '2024-05-17', 'Liam Red', 0, 77),
(64, '2024-05-04 09:00:00', '2024-05-18', 'Mona Brown', 1, 5),
(65, '2024-05-05 13:45:00', '2024-05-19', 'Nate Yellow', 0, 22),
(66, '2024-05-06 15:00:00', '2024-05-20', 'Olivia Blue', 4, 78),
(67, '2024-05-07 16:30:00', '2024-05-21', 'Paul Gray', 5, 4),
(68, '2024-05-08 17:15:00', '2024-05-22', 'Quincy White', 0, 81),
(69, '2024-05-09 18:00:00', '2024-05-23', 'Rita Green', 2, 3),
(70, '2024-05-10 19:00:00', '2024-05-24', 'Steve Red', 0, 1),
(71, '2024-05-11 10:00:00', '2024-05-25', 'Tina Black', 3, 86),
(72, '2024-05-12 11:30:00', '2024-05-26', 'Uma Yellow', 0, 72),
(73, '2024-05-13 14:00:00', '2024-05-27', 'Victor Blue', 4, 17),
(74, '2024-05-14 09:00:00', '2024-05-28', 'Wendy Purple', 0, 2),
(75, '2024-05-15 13:45:00', '2024-05-29', 'Xena Black', 5, 69),
(76, '2024-05-16 15:00:00', '2024-05-30', 'Yasmine Green', 0, 91),
(77, '2024-05-17 16:30:00', '2024-05-31', 'Zach Red', 2, 62),
(78, '2024-05-18 17:15:00', '2024-06-01', 'Amy White', 0, 73),
(79, '2024-05-19 18:00:00', '2024-06-02', 'Brad Black', 3, 39),
(80, '2024-05-20 19:00:00', '2024-06-03', 'Cathy Green', 0, 67),
(81, '2024-06-01 10:00:00', '2024-06-15', 'Derek Blue', 0, 96),
(82, '2024-06-02 11:30:00', '2024-06-16', 'Ella Red', 2, 45),
(83, '2024-06-03 14:00:00', '2024-06-17', 'Fiona Yellow', 0, 10),
(84, '2024-06-04 09:00:00', '2024-06-18', 'George Black', 1, 94),
(85, '2024-06-05 13:45:00', '2024-06-19', 'Holly White', 0, 50),
(86, '2024-06-06 15:00:00', '2024-06-20', 'Ian Green', 4, 55),
(87, '2024-06-07 16:30:00', '2024-06-21', 'Jack Blue', 5, 7),
(88, '2024-06-08 17:15:00', '2024-06-22', 'Kara Red', 0, 19),
(89, '2024-06-09 18:00:00', '2024-06-23', 'Leo Black', 2, 11),

(90, '2024-06-10 19:00:00', '2024-06-24', 'Mia Green', 0, 33),
(91, '2024-06-11 10:00:00', '2024-06-25', 'Nina White', 0, 76),
(92, '2024-06-12 11:30:00', '2024-06-26', 'Owen Yellow', 2, 49),
(93, '2024-06-13 14:00:00', '2024-06-27', 'Paula Purple', 0, 61),
(94, '2024-06-14 09:00:00', '2024-06-28', 'Quinn Gray', 1, 20),
(95, '2024-06-15 13:45:00', '2024-06-29', 'Ryan Blue', 0, 9),
(96, '2024-06-16 15:00:00', '2024-06-30', 'Sophie Black', 4, 87),
(97, '2024-06-17 16:30:00', '2024-07-01', 'Tom White', 5, 18),
(98, '2024-06-18 17:15:00', '2024-07-02', 'Uma Red', 0, 24),
(99, '2024-06-19 18:00:00', '2024-07-03', 'Vera Green', 2, 99),
(100, '2024-06-20 19:00:00', '2024-07-04', 'Willow Blue', 0, 15),
(101, '2024-06-21 10:00:00', '2024-07-05', 'Xena Purple', 0, 66),
(102, '2024-06-22 11:30:00', '2024-07-06', 'Yara Yellow', 2, 12),
(103, '2024-06-23 14:00:00', '2024-07-07', 'Zane Black', 0, 54),
(104, '2024-06-24 09:00:00', '2024-07-08', 'Ava Brown', 1, 30),
(105, '2024-06-25 13:45:00', '2024-07-09', 'Brad Gray', 0, 11),
(106, '2024-06-26 15:00:00', '2024-07-10', 'Cathy White', 4, 83),
(107, '2024-06-27 16:30:00', '2024-07-11', 'Derek Green', 5, 41),
(108, '2024-06-28 17:15:00', '2024-07-12', 'Ella Blue', 0, 95),
(109, '2024-06-29 18:00:00', '2024-07-13', 'Finn Red', 2, 88);

--GROUPING HERE BY THE GENRE OF BOOKS
SELECT COUNT(DDC)AS DDC, GENRE
FROM LIBRARY_.CLASSIFICATION_AND_CATALOGING
GROUP BY GENRE;



SELECT *FROM LIBRARY_.CLASSIFICATION_AND_CATALOGING;

SELECT *FROM LIBRARY_.PHYSICAL_INFORMATION;
--SEEING DUPLICATES IN SHELF COULMN
SELECT *
FROM  LIBRARY_.PHYSICAL_INFORMATION
WHERE SHELF_LOCATION IN (
    SELECT COUNT(*)
    FROM  LIBRARY_.PHYSICAL_INFORMATION
    GROUP BY SHELF_LOCATION
    HAVING COUNT(*) > 1
);
--SELECTING THE DISTINCT VALUES IN THIS TABLE NOW
SELECT DISTINCT BOOKID
FROM LIBRARY_.PHYSICAL_INFORMATION;

SELECT COUNT(*) AS Total
FROM LIBRARY_.PHYSICAL_INFORMATION;  -- Adjust this to the actual books table name

--TOTAL COUNT OF BORROWING TABLE
SELECT COUNT(*) AS Total
FROM LIBRARY_.BORROWING_AND_CIRCULATION;

-- WE ARE HERE DELETING  EXTRA ROW THAT WE HAVE
DELETE FROM  LIBRARY_.BORROWING_AND_CIRCULATION
WHERE BOOK_ID= 1;
--SAME DELETION
DELETE FROM LIBRARY_.PHYSICAL_INFORMATION
WHERE BOOK_CONDITION ='FAIR';
SELECT MIN(BORROWER_NAME) AS BORROWER_NAME, BORROWER_ID
FROM LIBRARY_.BORROWING_AND_CIRCULATION
GROUP BY BORROWER_ID;

SELECT BORROWER_NAME, BORROWER_ID
FROM LIBRARY_.BORROWING_AND_CIRCULATION
GROUP BY BORROWER_ID, BORROWER_NAME;

SELECT *
FROM LIBRARY_.BORROWING_AND_CIRCULATION
WHERE BOOK_ID = 93;




SELECT *FROM LIBRARY_.BORROWING_AND_CIRCULATION;

--FOR BOOK_ID 88
SELECT Borrower_ID, Checkout_Date, Due_Date, Borrower_Name
FROM LIBRARY_.BORROWING_AND_CIRCULATION
WHERE Book_ID = 88
AND Checkout_Date <= '2024-07-13'  -- Finn Red's due date
AND Due_Date >= '2024-03-09';      -- Chloe Purple's checkout date

 
INSERT INTO LIBRARY_.CLASSIFICATION_AND_CATALOGING (DDC, LCC, GENRE, SUBJECTS_HEADINGS)
VALUES('133.1', 'FIC', 'Fiction', 'Spirituality, Adventure, Self-discovery'),
('813.6', 'FIC', 'Thriller', 'Psychological Thriller, Suspense'),
('370.19', 'BIO', 'Memoir', 'Education, Family Dynamics'),
('842.9', 'FIC', 'Fiction', 'Nature, Coming of Age, Mystery'),
('920', 'BIO', 'Biography', 'Public Life, Personal Journey'),
('930', 'NONFIC', 'Non-Fiction', 'Human Evolution, History'),
('823.9', 'FIC', 'Dystopian', 'Totalitarianism, Surveillance'),
('783.2', 'FIC', 'Fiction', 'American Dream, Social Issues'),
('823.912', 'FIC', 'Classic', 'Literary Fiction, American History'),
('813.54', 'FIC', 'Fiction', 'Racial Injustice, Coming of Age'),
('831.93', 'FIC', 'Dystopian', 'Future Society, Technology'),
('813.6', 'FIC', 'Fantasy', 'Adventure, Quest, Mythology'),
('813.3', 'FIC', 'Classic', 'Adventure, Sea Stories'),
('875.98', 'FIC', 'Mystery', 'Art, Religion, Mystery'),
('813.6', 'FIC', 'Dystopian', 'Survival, Totalitarianism, Coming of Age'),
('813.6', 'FIC', 'Dystopian', 'Survival, Revolution, Coming of Age'),
('813.6', 'FIC', 'Dystopian', 'Survival, War, Political Intrigue'),
('823.914', 'FIC', 'Fantasy', 'Magic, Adventure, Friendship'),
('823.914', 'FIC', 'Fantasy', 'Magic, Adventure, Friendship'),
('823.914', 'FIC', 'Fantasy', 'Magic, Adventure, Friendship'),
('823.914', 'FIC', 'Fantasy', 'Magic, Adventure, Friendship'),
('823.914', 'FIC', 'Fantasy', 'Magic, Adventure, Friendship'),
('823.914', 'FIC', 'Fantasy', 'Magic, Adventure, Friendship'),
('823.914', 'FIC', 'Fantasy', 'Magic, Adventure, Friendship'),
('823.912', 'FIC', 'Fantasy', 'Magic, Adventure, Quest'),
('813.6', 'FIC', 'Dystopian', 'Survival, Adventure, Post-Apocalyptic'),
('813.6', 'FIC', 'Dystopian', 'Survival, Adventure, Post-Apocalyptic'),
('813.6', 'FIC', 'Dystopian', 'Survival, Adventure, Post-Apocalyptic'),
('813.6', 'FIC', 'Dystopian', 'Survival, Choice, Society'),
('813.6', 'FIC', 'Dystopian', 'Survival, Choice, Society'),
('813.6', 'FIC', 'Young Adult', 'Illness, Love, Loss'),
('813.6', 'FIC', 'Young Adult', 'Friendship, Grief, Discovery'),
('813.6', 'FIC', 'Young Adult', 'Adventure, Identity, Search for Meaning'),
('813.54', 'FIC', 'Horror', 'Isolation, Madness, Supernatural'),
('813.54', 'FIC', 'Horror', 'Fear, Childhood, Evil'),
('813.54', 'FIC', 'Horror', 'Fear, Family, Supernatural'),
('813.54', 'FIC', 'Horror', 'Isolation, Obsession, Survival'),
('813.54', 'FIC', 'Fantasy', 'Myth, Immortality, Adventure'),
('813.6', 'FIC', 'Contemporary Fiction', 'Race, Family, Identity'),
('813.6', 'FIC', 'Fantasy', 'Magic, Competition, Mystery'),
('813.6', 'FIC', 'Contemporary Fiction', 'Marriage, Love, Relationships'),
('813.6', 'FIC', 'Historical Fiction', 'Slavery, Freedom, Family'),
('813.6', 'FIC', 'Historical Fiction', 'Identity, Family, Secrets'),
('813.6', 'FIC', 'Contemporary Fiction', 'Love, Ambition, Fame'),
('813.6', 'FIC', 'Contemporary Fiction', 'Marriage, Betrayal, Secrets'),
('813.6', 'FIC', 'Contemporary Fiction', 'Mental Health, Loneliness, Growth'),
('813.6', 'FIC', 'Historical Fiction', 'War, Loss, Family'),
('813.6', 'FIC', 'Fantasy', 'Magic, Identity, Adventure'),
('813.6', 'FIC', 'Contemporary Fiction', 'Family, Legacy, Identity'),
('813.6', 'FIC', 'Historical Fiction', 'War, Survival, Family'),
('813.6', 'FIC', 'Contemporary Fiction', 'Love, Grief, Choices'),
('813.6', 'FIC', 'Contemporary Fiction', 'Friendship, Love, Family'),
('813.6', 'FIC', 'Contemporary Fiction', 'Friendship, Loss, Coming of Age'),
('813.6', 'FIC', 'Young Adult', 'Growth, Friendship, Love'),
('813.6', 'FIC', 'Contemporary Fiction', 'Love, Family, Loss'),
('813.6', 'FIC', 'Dystopian', 'Society, Control, Freedom'),
('813.6', 'FIC', 'Mystery', 'Suspense, Relationships, Deception'),
('813.6', 'FIC', 'Contemporary Fiction', 'Identity, Family, Love'),
('813.6', 'FIC', 'Fantasy', 'Adventure, Friendship, Identity'),
('813.6', 'FIC', 'Fantasy', 'Adventure, Discovery, Growth'),
('813.6', 'FIC', 'Fantasy', 'Good vs Evil, Adventure, Family'),
('823.91', 'FIC', 'Fantasy', 'Adventure, Friendship, Growth'),
('823.9', 'FIC', 'Fantasy', 'Adventure, Friendship, Growth'),
('823.93', 'FIC', 'Childrens Literature', 'Nature, Growth, Friendship'),
('843.7', 'FIC', 'Classics', 'Revenge, Justice, Adventure'),
('823.7', 'FIC', 'Gothic Fiction', 'Science, Ethics, Identity'),
('823.7', 'FIC', 'Gothic Fiction', 'Love, Family, Nature'),
('823.8', 'FIC', 'Classics', 'Beauty, Morality, Society'),
('823.9', 'FIC', 'Science Fiction', 'Humor, Adventure, Space'),
('813.54', 'FIC', 'Crime Fiction', 'Power, Family, Loyalty'),
('813.54', 'FIC', 'Satire', 'War, Absurdity, Society'),
('823.8', 'FIC', 'Dystopian Fiction', 'Society, Control, Freedom'),
('813.54', 'FIC', 'Memoir', 'Mental Health, Society, Individual'),
('813.54', 'FIC', 'Literary Fiction', 'Revolution, Society, Time'),
('823.8', 'FIC', 'Literary Fiction', 'Society, Class, Expectations'),
('813.5', 'FIC', 'Literary Fiction', 'Survival, Adventure, Isolation'),
('863.7', 'FIC', 'Literary Fiction', 'Magic, Adventure, Friendship'),
('823.91', 'FIC', 'Literary Fiction', 'Exploration, Identity, Journey'),
('813.54', 'FIC', 'Self-Help', 'Growth, Character, Ethics'),
('813.54', 'FIC', 'Memoir', 'Education, Family, Growth'),
('973.932', 'FIC', 'Memoir', 'Politics, Identity, Growth'),
('813.54', 'FIC', 'Literary Fiction', 'Growth, Survival, Family'),
('813.54', 'FIC', 'Memoir', 'Family, Resilience, Growth'),
('813.54', 'FIC', 'Memoir', 'Resilience, Survival, Identity'),
('813.54', 'FIC', 'Memoir', 'Family, Life, Growth'),
('813.54', 'FIC', 'Literary Fiction', 'Friendship, Life, Choices'),
('813.54', 'FIC', 'Contemporary Fiction', 'Family, Life, Choices'),
('813.54', 'FIC', 'Literary Fiction', 'Life, Family, Friendship'),
('813.54', 'FIC', 'Literary Fiction', 'Adventure, Survival, Identity'),
('813.54', 'FIC', 'Literary Fiction', 'Relationships, Identity, Secrets'),
('813.54', 'FIC', 'Mystery', 'Suspense, Relationships, Deception'),
('813.54', 'FIC', 'Literary Fiction', 'Love, Friendship, Identity'),
('813.54', 'FIC', 'Fantasy', 'Adventure, Magic, Family'),
('813.54', 'FIC', 'Fantasy', 'Adventure, Magic, Friendship'),
('813.54', 'FIC', 'Fantasy', 'Adventure, Magic, Family'),
('813.54', 'FIC', 'Fantasy', 'Adventure, Magic, Family'),
('813.54', 'FIC', 'Fantasy', 'Adventure, Friendship, Growth'),
('813.54', 'FIC', 'Fantasy', 'Adventure, Magic, Identity'),
('813.54', 'FIC', 'Fantasy', 'Adventure, Magic, Family'),
('813.54', 'FIC', 'Fantasy', 'Adventure, Magic, Identity'),
('813.6', 'FIC', 'Space, Survival, Adventure', 'Science Fiction'),  -- The Martian
('813.6', 'FIC', 'Magic, Adventure, Coming of Age', 'Fantasy'),     -- An Ember in the Ashes
('813.6', 'FIC', 'Magic, Family, Identity', 'Fantasy'),            -- Children of Blood and Bone
('813.6', 'FIC', 'Racial Issues, Identity, Friendship', 'Young Adult'),  -- The Hate U Give
('813.6', 'FIC', 'Secrets, High School, Friendship', 'Mystery'),    -- One of Us Is Lying
('813.6', 'FIC', 'Love, Fate, Family', 'Romance'),                  -- The Sun Is Also a Star
('813.6', 'FIC', 'Heists, Friendship, Teamwork', 'Fantasy'),        -- Six of Crows
('813.6', 'FIC', 'Political Intrigue, Family, Betrayal', 'Fantasy'),  -- The Cruel Prince
('813.6', 'FIC', 'Fairy Tales, Romance, Adventure', 'Fantasy');      -- A Court of Thorns and Roses


CREATE TABLE LIBRARY_.LIBRARY_STAFF(
NAME VARCHAR(255),
JOB_TITLE VARCHAR(276),
DEPARTMENT VARCHAR(255),
CONTACT_NO BIGINT,
OUALIFICATIONS VARCHAR(255),
WORK_EXPERIENCE VARCHAR(655) DEFAULT 'N/A',
ACHIEVEMENTS_AND_AWARDS VARCHAR(657) DEFAULT 'N/A',
AGE INT
);
SELECT * FROM LIBRARY_.LIBRARY_STAFF;

SELECT NAME, JOB_TITLE, AGE,WORK_EXPERIENCE
FROM LIBRARY_.LIBRARY_STAFF
WHERE WORK_EXPERIENCE != 'N/A';



INSERT  INTO LIBRARY_.LIBRARY_STAFF( NAME, JOB_TITLE, DEPARTMENT, CONTACT_NO, OUALIFICATIONS, AGE)
VALUES('Arthik shah','Inventory Manager ','Library_Technician', 9797238192, 'B.A', 23),
('Reema Patel', 'Acquisitions Librarian', 'Acquisitions', 9898671234, 'M.LIS', 35),
('Sandeep Kumar', 'Reference Librarian', 'Reference Services', 9876543210, 'M.A. in Library Science', 42),
('Neha Mehta', 'Circulation Desk Manager', 'Circulation', 9781234567, 'B.LIS', 29),
('Vikram Joshi', 'Digital Resources Librarian', 'Digital Services', 9872341234, 'M.Sc. Information Technology', 38),
('Ravi Kapoor', 'Cataloging Librarian', 'Cataloging', 9845671239, 'M.LIS', 33),
('Simran Kaur', 'Library Assistant', 'Circulation', 9874312345, 'Diploma in Library Science', 25),
('Anjali Reddy', 'Archives Specialist', 'Archives', 9876123457, 'M.A. in History', 37);
INSERT INTO LIBRARY_.LIBRARY_STAFF(NAME, JOB_TITLE, DEPARTMENT, CONTACT_NO,WORK_EXPERIENCE, OUALIFICATIONS, AGE)
VALUES('Rajesh Desai', 'IT Support Specialist', 'Technology', 9873412349, '1 YEAR', 'B.Sc. Computer Science', 28);

INSERT INTO LIBRARY_.LIBRARY_STAFF(NAME, JOB_TITLE, DEPARTMENT, CONTACT_NO,WORK_EXPERIENCE,ACHIEVEMENTS_AND_AWARDS, OUALIFICATIONS, AGE)
VALUES('Aarti Gupta', 'Library Director', 'Administration', 9791237654,'6 YEARS','2 AWARDS', 'PhD in Library Science', 45);







DELETE FROM LIBRARY_.LIBRARY_STAFF
WHERE JOB_TITLE = 'managing inventory';  

CREATE TABLE LIBRARY_.BOOK_DETAILS(
TITLE VARCHAR(255),
AUTHOR VARCHAR(276),
PUBLISHER VARCHAR(255),
PUBLICATION_DATE DATE,
ISBN VARCHAR(356),
EDITION VARCHAR(655),
_FORMAT_ VARCHAR(657),
AGE INT
); 
--To give a full name of the book and the author concatenated--
select  title + '    by  ' +  author as book_info
from library_.book_details;

--Using string functions left, right, upper & lower to give 2, 3 characters and upper and lower, replacing too and also length of characters --
SELECT 
      TITLE,
	  LEFT( TITLE,2) AS TITLE2,
	  RIGHT(TITLE, 3) AS TITLE3,
	  UPPER(TITLE) AS UPPERFIRST,
	  LOWER(TITLE) AS LOWERFIRST,
	  LEN(TITLE) AS CHARACTERSINTITLE,
	  REPLACE(TITLE , 'e', '8') AS REPLACEe
	  
	  FROM LIBRARY_.BOOK_DETAILS;
--GIVES CURRENT TIME OF THE SYSTEM--
	  SELECT 
	  GETDATE() AS SYSTEMTIME,
	  DAY(GETDATE()) SYSTEMDAY
	  --Showing the 20 books that are the oldest 
 SELECT TOP 20 
AGE, TITLE FROM LIBRARY_.BOOK_DETAILS;

--HERE I GROUPED THE BOOKS BY THEIR AGE IN A WAY SO I CAN SEE HOW MANY BOOKS ARE HOW MANY YEARS OLD
SELECT COUNT(ISBN) AS BOOKS_TOTAL, AGE
FROM LIBRARY_.BOOK_DETAILS
GROUP BY AGE;


--TO SEE ALL THE BOOKS WHERE AGE IS 10
SELECT TITLE, AUTHOR,AGE
FROM LIBRARY_.BOOK_DETAILS
WHERE AGE = 10;

SELECT *FROM LIBRARY_.BOOK_DETAILS;
WITH CTE AS (
    SELECT 
        BOOK_id,  -- Added a comma here
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS RowNum
    FROM LIBRARY_.BOOK_DETAILS
)
UPDATE LIBRARY_.BOOK_DETAILS
SET BOOK_id = CTE.RowNum
FROM CTE
WHERE LIBRARY_.BOOK_DETAILS.BOOK_id IS not NULL;-- You can add a condition if you only want to update null values


	


--SELECTING DISTINCT BOOKS
SELECT DISTINCT *
FROM LIBRARY_.BOOK_DETAILS;

--DELETEING BECAUSE THERE WERE TWO ALCHEMIST
DELETE FROM LIBRARY_.BOOK_DETAILS
WHERE TITLE = 'THE ALCHEMIST' AND AGE= 30;

INSERT INTO LIBRARY_.BOOK_DETAILS(TITLE, AUTHOR, PUBLISHER, PUBLICATION_DATE, ISBN, EDITION, _FORMAT_, AGE)
VALUES('The Alchemist', 'Paulo Caullo', 'Iisudjios' , '2021-03-21', '9-382470394', '1ST', 'HARDCOVER', 30),
    ('The SilentPatient', 'Alex Michaelides', 'Celadon Books', '2019-02-05', '1-250301697', '1st', 'Hardcover', 18),
    ('Educated', 'Tara Westover', 'Random House', '2018-02-20', '978-0399590504', '1st', 'Paperback', 18),
    ('Where the Crawdads Sing', 'Delia Owens', 'G.P. Putnam�s Sons', '2018-08-14', '978-0735219106', '1st', 'Hardcover', 16),
    ('Becoming', 'Michelle Obama', 'Crown Publishing', '2018-11-13', '978-1524763138', '1st', 'Hardcover', 15),
    ('Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Harper', '2015-02-10', '978-0062316097', '1st', 'Paperback', 14),
    ('1984s', 'George Orwell', 'Secker & Warburg', '1949-06-08', '978-0451524935', '1st', 'Paperback', 16),
    ('The Great Gatsby', 'F. Scott Fitzgerald', 'Charles Scribner Sons', '1925-04-10', '978-0743273565', '1st', 'Hardcover', 13),
    ('To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', '1960-07-11', '978-0061120084', '1st', 'Hardcover', 14),
    ('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', '1951-07-16', '978-0316769488', '1st', 'Paperback', 16),
    ('Pride and Prejudice', 'Jane Austen', 'T. Egerton', '1813-01-28', '978-1503290563', '1st', 'Hardcover', 12),
    ('Brave New World', 'Aldous Huxley', 'Chatto & Windus', '1932-08-30', '978-0060850524', '1st', 'Paperback', 17),
    ('The Road', 'Cormac McCarthy', 'Alfred A. Knopf', '2006-09-26', '978-0307387899', '1st', 'Hardcover', 18),
    ('The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin', '1937-09-21', '978-0547928227', '1st', 'Hardcover', 10),
    ('The Alchemist', 'Paulo Coelho', 'HarperOne', '1988-10-19', '978-0062315007', '1st', 'Paperback', 16),
    ('Moby-Dick', 'Herman Melville', 'Richard Bentley', '1851-11-14', '978-1503280786', '1st', 'Paperback', 14),
    ('The Da Vinci Code', 'Dan Brown', 'Doubleday', '2003-03-18', '978-0385504201', '1st', 'Hardcover', 18),
    ('The Hunger Games', 'Suzanne Collins', 'Scholastic Press', '2008-09-14', '978-0439023528', '1st', 'Hardcover', 15),
    ('Catching Fire', 'Suzanne Collins', 'Scholastic Press', '2009-09-01', '978-0439023498', '1st', 'Hardcover', 15),
    ('Mockingjay', 'Suzanne Collins', 'Scholastic Press', '2010-08-24', '978-0439023511', '1st', 'Hardcover', 16),
    ('Harry Potter and the Sorcerers Stone', 'J.K. Rowling', 'Bloomsbury', '1997-06-26', '978-0747532743', '1st', 'Hardcover', 10),
    ('Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Bloomsbury', '1998-07-02', '978-0747538493', '1st', 'Hardcover', 10),
    ('Harry Potter and the Prisoner of Azkaban', 'J.K. Rowling', 'Bloomsbury', '1999-07-08', '978-0747542155', '1st', 'Hardcover', 10),
    ('Harry Potter and the Goblet of Fire', 'J.K. Rowling', 'Bloomsbury', '2000-07-08', '978-0747546245', '1st', 'Hardcover', 12),
    ('Harry Potter and the Order of the Phoenix', 'J.K. Rowling', 'Bloomsbury', '2003-06-21', '978-0747551003', '1st', 'Hardcover', 13),
    ('Harry Potter and the Half-Blood Prince', 'J.K. Rowling', 'Bloomsbury', '2005-07-16', '978-0747581086', '1st', 'Hardcover', 14),
    ('Harry Potter and the Deathly Hallows', 'J.K. Rowling', 'Bloomsbury', '2007-07-21', '978-0747591054', '1st', 'Hardcover', 15),
    ('The Lord of the Rings: The Fellowship of the Ring', 'J.R.R. Tolkien', 'George Allen & Unwin', '1954-07-29', '978-0261103573', '1st', 'Paperback', 16),
    ('The Lord of the Rings: The Two Towers', 'J.R.R. Tolkien', 'George Allen & Unwin', '1954-11-11', '978-0261102361', '1st', 'Paperback', 16),
    ('The Lord of the Rings: The Return of the King', 'J.R.R. Tolkien', 'George Allen & Unwin', '1955-10-20', '978-0261102378', '1st', 'Paperback', 17),
    ('The Maze Runner', 'James Dashner', 'Delacorte Press', '2009-10-06', '978-0385737956', '1st', 'Hardcover', 16),
    ('The Scorch Trials', 'James Dashner', 'Delacorte Press', '2010-09-18', '978-0385738762', '1st', 'Hardcover', 16),
    ('The Death Cure', 'James Dashner', 'Delacorte Press', '2011-10-11', '978-0385738779', '1st', 'Hardcover', 16),
    ('Divergent', 'Veronica Roth', 'Katherine Tegen Books', '2011-04-25', '978-0062024029', '1st', 'Hardcover', 15),
    ('Insurgent', 'Veronica Roth', 'Katherine Tegen Books', '2012-05-01', '978-0062024043', '1st', 'Hardcover', 15),
    ('Allegiant', 'Veronica Roth', 'Katherine Tegen Books', '2013-10-22', '978-0062024067', '1st', 'Hardcover', 15),
    ('The Fault in Our Stars', 'John Green', 'Dutton Books', '2012-01-10', '978-0525478812', '1st', 'Hardcover', 15),
    ('Looking for Alaska', 'John Green', 'Dutton Juvenile', '2005-03-03', '978-0525475064', '1st', 'Hardcover', 16),
    ('Paper Towns', 'John Green', 'Dutton Books', '2008-10-16', '978-0525478188', '1st', 'Hardcover', 15),
    ('The Shining', 'Stephen King', 'Doubleday', '1977-01-28', '978-0385121675', '1st', 'Hardcover', 18),
    ('It', 'Stephen King', 'Viking Press', '1986-09-15', '978-0670813025', '1st', 'Hardcover', 18),
    ('Carrie', 'Stephen King', 'Doubleday', '1974-04-05', '978-0385086959', '1st', 'Hardcover', 18),
    ('Misery', 'Stephen King', 'Viking Penguin', '1987-06-08', '978-0670813643', '1st', 'Hardcover', 18),
    ('American Gods', 'Neil Gaiman', 'William Morrow', '2001-06-19', '978-0380973650', '1st', 'Hardcover', 18),
('Little Fires Everywhere', 'Celeste Ng', 'Penguin Press', '2017-09-12', '978-0143124168', '1st', 'Hardcover', 20),
('The Night Circus', 'Erin Morgenstern', 'Doubleday', '2011-09-13', '978-0385534635', '1st', 'Hardcover', 18),
('An American Marriage', 'Tayari Jones', 'Algonquin Books', '2018-02-06', '978-1616208769', '1st', 'Hardcover', 16),
('The Water Dancer', 'Ta-Nehisi Coates', 'One World', '2019-09-24', '978-0399590597', '1st', 'Hardcover', 15),
('The Vanishing Half', 'Brit Bennett', 'Riverhead Books', '2020-06-02', '978-0525536963', '1st', 'Hardcover', 14),
('Daisy Jones & The Six', 'Taylor Jenkins Reid', 'Ballantine Books', '2019-03-05', '978-1524798656', '1st', 'Hardcover', 16),
('The Guest List', 'Lucy Foley', 'William Morrow', '2020-02-25', '978-0062868930', '1st', 'Hardcover', 14),
('Eleanor Oliphant Is Completely Fine', 'Gail Honeyman', 'Pamela Dorman Books', '2017-05-09', '978-0735220683', '1st', 'Hardcover', 15),
('The Seven Husbands of Evelyn Hugo', 'Taylor Jenkins Reid', 'Atria Books', '2017-06-13', '978-1501139239', '1st', 'Hardcover', 16),
('The Book Thief', 'Markus Zusak', 'Alfred A. Knopf', '2005-03-01', '978-0375842207', '1st', 'Hardcover', 18),
('Normal People', 'Sally Rooney', 'Hogarth', '2018-04-17', '978-1984801723', '1st', 'Hardcover', 16),
('The Invisible Life of Addie LaRue', 'V.E. Schwab', 'Tor Books', '2020-10-06', '978-0765387561', '1st', 'Hardcover', 14),
('Circe', 'Madeline Miller', 'Little, Brown and Company', '2018-04-10', '978-0316335770', '1st', 'Hardcover', 15),
('Homegoing', 'Yaa Gyasi', 'Knopf', '2016-06-07', '978-1101947135', '1st', 'Hardcover', 14),
('The Nightingale', 'Kristin Hannah', 'St. Martin�s Press', '2015-02-03', '978-0312577223', '1st', 'Hardcover', 14),
('The Light We Lost', 'Jill Santopolo', 'Putnam', '2017-05-09', '978-0735212736', '1st', 'Hardcover', 16),
('The Kite Runner', 'Khaled Hosseini', 'Riverhead Books', '2003-05-29', '978-1594480003', '1st', 'Paperback', 20),
('A Man Called Ove', 'Fredrik Backman', 'Atria Books', '2014-06-03', '978-1476738024', '1st', 'Hardcover', 18),
('The Perks of Being a Wallflower', 'Stephen Chbosky', 'MTV Books', '1999-02-01', '978-0671027346', '1st', 'Paperback', 22),
('It Ends with Us', 'Colleen Hoover', 'Atria Books', '2016-08-02', '978-1501110364', '1st', 'Paperback', 15),
('The Girl on the Train', 'Paula Hawkins', 'Riverhead Books', '2015-01-13', '978-1594634024', '1st', 'Hardcover', 18),
('Gone Girl', 'Gillian Flynn', 'Crown Publishing', '2012-06-05', '978-0307588371', '1st', 'Hardcover', 17),
('The Giver', 'Lois Lowry', 'Houghton Mifflin', '1993-04-26', '978-0544336261', '1st', 'Paperback', 25),
('The Chronicles of Narnia', 'C.S. Lewis', 'Geoffrey Bles', '1950-10-16', '978-0064409421', '1st', 'Hardcover', 30),
('The Secret Garden', 'Frances Hodgson Burnett', 'Frederick Warne & Co.', '1911-01-01', '978-0143136222', '1st', 'Hardcover', 30),
('The Count of Monte Cristo', 'Alexandre Dumas', 'Penguin Classics', '1996-04-01', '978-0140449266', '1st', 'Paperback', 30),
('Frankenstein', 'Mary Shelley', 'Lackington, Hughes, Harding, Mavor & Jones', '1818-01-01', '978-0486282114', '1st', 'Paperback', 35),
('Wuthering Heights', 'Emily Bront�', 'Thomas Cautley Newby', '1847-01-01', '978-0141439556', '1st', 'Paperback', 35),
('The Picture of Dorian Gray', 'Oscar Wilde', 'Lippincotts Monthly Magazine', '1890-07-01', '978-0141439570', '1st', 'Paperback', 30),
('The Hitchhiker�s Guide to the Galaxy', 'Douglas Adams', 'Pan Books', '1979-10-12', '978-0345391803', '1st', 'Paperback', 25),
('The Godfather', 'Mario Puzo', 'G.P. Putnam�s Sons', '1969-03-10', '978-0451205763', '1st', 'Hardcover', 30),
('Catch-22', 'Joseph Heller', 'Simon & Schuster', '1961-11-10', '978-0684833392', '1st', 'Hardcover', 30),
('Brave New World', 'Aldous Huxley', 'Chatto & Windus', '1932-08-30', '978-0060850524', '1st', 'Paperback', 30),
('The Bell Jar', 'Sylvia Plath', 'Heinemann', '1963-01-01', '978-0060834029', '1st', 'Paperback', 25),
('The Road', 'Cormac McCarthy', 'Alfred A. Knopf', '2006-09-26', '978-0307387899', '1st', 'Hardcover', 15),
('A Tale of Two Cities', 'Charles Dickens', 'Chapman & Hall', '1859-01-01', '978-0486417760', '1st', 'Paperback', 35),
('The Great Expectations', 'Charles Dickens', 'Chapman & Hall', '1860-01-01', '978-1503275197', '1st', 'Paperback', 35),
('The Old Man and the Sea', 'Ernest Hemingway', 'Charles Scribner/S Sons', '1952-09-01', '978-0684832517', '1st', 'Paperback', 25),
('One Hundred Years of Solitude', 'Gabriel Garc�a M�rquez', 'Harper & Row', '1970-05-05', '978-0060883287', '1st', 'Paperback', 30),
('The Alchemist', 'Paulo Coelho', 'HarperCollins', '1993-05-01', '978-0062315007', '1st', 'Hardcover', 20),
('The Road to Character', 'David Brooks', 'Random House', '2015-04-15', '978-0812993258', '1st', 'Hardcover', 15),
('Educated', 'Tara Westover', 'Random House', '2018-02-20', '978-0399590504', '1st', 'Hardcover', 14),
('Becoming', 'Michelle Obama', 'Crown Publishing', '2018-11-13', '978-1524763138', '1st', 'Hardcover', 15),
('Life of Pi', 'Yann Martel', 'Knopf Canada', '2001-09-11', '978-0151008117', '1st', 'Hardcover', 20),
('The Kite Runner', 'Khaled Hosseini', 'Riverhead Books', '2003-05-29', '978-1594631931', '1st', 'Paperback', 20),
('The Help', 'Kathryn Stockett', 'Amy Einhorn Books', '2009-02-10', '978-0399155345', '1st', 'Hardcover', 15),
('The Glass Castle', 'Jeannette Walls', 'Scribner', '2005-08-30', '978-0743247542', '1st', 'Paperback', 15),
('The Immortal Life of Henrietta Lacks', 'Rebecca Skloot', 'Crown Publishing', '2010-02-02', '978-1400052189', '1st', 'Hardcover', 12),
('The Five People You Meet in Heaven', 'Mitch Albom', 'Hyperion', '2003-09-23', '978-1401308582', '1st', 'Paperback', 15),
('The Night Circus', 'Erin Morgenstern', 'Doubleday', '2011-09-13', '978-0385534635', '1st', 'Hardcover', 12),
('The Girl on the Train', 'Paula Hawkins', 'Riverhead Books', '2015-01-13', '978-1594633668', '1st', 'Paperback', 10),
('Gone Girl', 'Gillian Flynn', 'Crown Publishing', '2012-06-05', '978-0307588371', '1st', 'Hardcover', 12),
('Big Little Lies', 'Liane Moriarty', 'Amy Einhorn Books', '2014-07-29', '978-0399161001', '1st', 'Hardcover', 10),
('The Rosie Project', 'Graeme Simsion', 'Text Publishing', '2013-04-01', '978-1922079774', '1st', 'Paperback', 10),
('Station Eleven', 'Emily St. John Mandel', 'Knopf', '2014-09-09', '978-0345538930', '1st', 'Hardcover', 8),
('Before the Fall', 'Noah Hawley', 'Holt', '2016-05-31', '978-1250044811', '1st', 'Hardcover', 7),
('The Martian', 'Andy Weir', 'Crown Publishing', '2014-02-11', '978-0553418026', '1st', 'Paperback', 5),
('An Ember in the Ashes', 'Sabaa Tahir', 'Razorbill', '2015-04-28', '978-1595145844', '1st', 'Hardcover', 5),
('Children of Blood and Bone', 'Tomi Adeyemi', 'Henry Holt and Co.', '2018-03-06', '978-1250170972', '1st', 'Hardcover', 5),
('The Hate U Give', 'Angie Thomas', 'Balzer + Bray', '2017-02-28', '978-0062498533', '1st', 'Hardcover', 5),
('One of Us Is Lying', 'Karen M. McManus', 'Delacorte Press', '2017-05-30', '978-1524714680', '1st', 'Hardcover', 5),
('The Sun Is Also a Star', 'Nicola Yoon', 'G.P. Putnam�s Sons', '2016-11-01', '978-0553496680', '1st', 'Hardcover', 5),
('Six of Crows', 'Leigh Bardugo', 'Henry Holt and Co.', '2015-09-29', '978-1627792127', '1st', 'Hardcover', 5),
('The Cruel Prince', 'Holly Black', 'Little, Brown Books for Young Readers', '2018-01-02', '978-0316310314', '1st', 'Hardcover', 5),
('A Court of Thorns and Roses', 'Sarah J. Maas', 'Bloomsbury', '2015-05-05', '978-1619634442', '1st', 'Hardcover', 5)
;

CREATE TABLE LIBRARY_.FINES(
FINE_ID INT PRIMARY KEY IDENTITY(1,1),
BOOK_ID INT,
Borrower_id INT,
ISSUE_DATE DATETIME,
STATUS VARCHAR(32),
FINE_AMOUNT DECIMAL(10,2),
FOREIGN KEY(BOOK_ID,Borrower_id)REFERENCES  LIBRARY_.BORROWING_AND_CIRCULATION(Book_ID, BORROWER_ID)
);
SELECT * FROM LIBRARY_.FINES;
INSERT INTO LIBRARY_.FINES (BOOK_ID, Borrower_id, ISSUE_DATE, STATUS, FINE_AMOUNT)
VALUES
(2,30,'2024-09-01 10:00:00', 'Paid', 5.00),
(2, 74, '2024-09-02 11:00:00', 'Unpaid', 3.00),
(3, 57, '2024-09-03 12:00:00', 'Paid', 2.50),
(3, 69, '2024-09-04 13:00:00', 'Unpaid', 0.00),
(4, 42, '2024-09-05 14:00:00', 'Paid', 10.00),
(4, 67, '2024-09-06 15:00:00', 'Unpaid', 15.00),
(5, 6, '2024-09-07 16:00:00', 'Paid', 8.00),
(5, 64, '2024-09-08 17:00:00', 'Unpaid', 12.00),
(6, 27, '2024-09-09 10:30:00', 'Paid', 4.00),
(7, 62, '2024-09-10 11:30:00', 'Unpaid', 6.00),
(7, 87, '2024-09-11 12:30:00', 'Paid', 9.00),
(8,46 , '2024-09-12 13:30:00', 'Unpaid', 1.00),
(9, 12, '2024-09-13 14:30:00', 'Paid', 2.00),
(9,95 , '2024-09-14 15:30:00', 'Unpaid', 11.00),
(10,83 , '2024-09-15 16:30:00', 'Paid', 7.00),
(11,89 , '2024-09-16 17:30:00', 'Unpaid', 5.50),
(11,105, '2024-09-17 10:45:00', 'Paid', 8.50),
(12,3 , '2024-09-18 11:45:00', 'Unpaid', 2.20),
(12,102 , '2024-09-19 12:45:00', 'Paid', 14.00),
(13,24 , '2024-09-20 13:45:00', 'Unpaid', 13.00),
(14,50 , '2024-09-21 14:45:00', 'Paid', 6.50),
(15,100 , '2024-09-22 15:45:00', 'Unpaid', 9.75),
(16,55, '2024-09-23 16:45:00', 'Paid', 2.30),
(17,37 , '2024-09-24 10:15:00', 'Unpaid', 4.50),
(17, 73, '2024-09-25 11:15:00', 'Paid', 8.25),
(18,97 , '2024-09-26 12:15:00', 'Unpaid', 1.50),
(19,34 , '2024-09-27 13:15:00', 'Paid', 11.25),
(19,88 , '2024-09-28 14:15:00', 'Unpaid', 12.50),
(20, 16, '2024-09-29 15:15:00', 'Paid', 7.75),
(20,94 , '2024-09-30 16:15:00', 'Unpaid', 3.50),
(22,40 , '2024-10-01 10:30:00', 'Paid', 5.25),
(22,65 , '2024-10-02 11:30:00', 'Unpaid', 8.75),
(24,98 , '2024-10-03 12:30:00', 'Paid', 15.00),
(25,22 , '2024-10-04 13:30:00', 'Unpaid', 2.00),
(27, 10, '2024-10-05 14:30:00', 'Paid', 10.25),
(28,48 , '2024-10-06 15:30:00', 'Unpaid', 11.75),
(30,104 , '2024-10-07 16:30:00', 'Paid', 9.00),
(31,32 , '2024-10-08 10:45:00', 'Unpaid', 0.00),
(33,4 , '2024-10-09 11:45:00', 'Paid', 13.00),
(33,90 , '2024-10-10 12:45:00', 'Unpaid', 7.50),
(34,14 , '2024-10-11 13:45:00', 'Paid', 6.00),
(36,44 , '2024-10-12 14:45:00', 'Unpaid', 5.00),
(37,19 , '2024-10-13 15:45:00', 'Paid', 9.25),
(39,59 , '2024-10-14 16:45:00', 'Unpaid', 10.00),
(39,79 , '2024-10-15 10:15:00', 'Paid', 8.00),
(41,107 , '2024-10-16 11:15:00', 'Unpaid', 4.75),
(43,26, '2024-10-17 12:15:00', 'Paid', 7.25),
(45,1 , '2024-10-18 13:15:00', 'Unpaid', 3.75),
(45,82 , '2024-10-19 14:15:00', 'Paid', 12.00),
(47,53 , '2024-10-20 15:15:00', 'Unpaid', 15.50),
(48,39 , '2024-10-21 16:15:00', 'Paid', 2.00),
(49,92 , '2024-10-22 10:30:00', 'Unpaid', 9.00),
(50,20 , '2024-10-23 11:30:00', 'Paid', 14.25),
(50,85 , '2024-10-24 12:30:00', 'Unpaid', 0.00),
(53,60 , '2024-10-25 13:30:00', 'Paid', 10.50),
(54, 8, '2024-10-26 14:30:00', 'Unpaid', 3.00),
(54, 103, '2024-10-27 15:30:00', 'Paid', 8.75),
(55,86 , '2024-10-28 16:30:00', 'Unpaid', 5.25),
(57,31 , '2024-10-29 10:45:00', 'Paid', 4.50),
(60,13 , '2024-10-30 11:45:00', 'Unpaid', 12.75),
(61,93 , '2024-10-31 12:45:00', 'Paid', 7.00),
(62,77 , '2024-11-01 13:45:00', 'Unpaid', 9.50),
(63,43 , '2024-11-02 14:45:00', 'Paid', 11.00),
(64,25 , '2024-11-03 15:45:00', 'Unpaid', 2.75),
(66,56 , '2024-11-04 16:45:00', 'Paid', 3.00),
(66,101 , '2024-11-05 10:15:00', 'Unpaid', 5.50),
(67,2 , '2024-11-06 11:15:00', 'Paid', 15.00),
(67,80 , '2024-11-07 12:15:00', 'Unpaid', 1.25),
(69,75 , '2024-11-08 13:15:00', 'Paid', 2.50),
(71,49 , '2024-11-09 14:15:00', 'Unpaid', 8.00),
(72,18 , '2024-11-10 10:00:00', 'Paid', 5.50),
(72,72 , '2024-11-11 11:00:00', 'Unpaid', 2.75),
(73,78 , '2024-11-12 12:00:00', 'Paid', 6.00),
(74,33 , '2024-11-13 13:00:00', 'Unpaid', 4.50),
(76,7 , '2024-11-14 14:00:00', 'Paid', 8.00),
(76, 91, '2024-11-15 15:00:00', 'Unpaid', 10.25),
(77, 63, '2024-11-16 16:00:00', 'Paid', 3.00),
(78,36 , '2024-11-17 17:00:00', 'Unpaid', 7.50),
(78,66 , '2024-11-18 10:30:00', 'Paid', 12.00),
(81,41 , '2024-11-19 11:30:00', 'Unpaid', 2.00),
(81, 68, '2024-11-20 12:30:00', 'Paid', 9.75),
(83,9 , '2024-11-21 13:30:00', 'Unpaid', 5.50),
(83,106 , '2024-11-22 14:30:00', 'Paid', 1.25),
(84, 23, '2024-11-23 15:30:00', 'Unpaid', 11.00),
(85, 54, '2024-11-24 10:15:00', 'Paid', 4.75),
(86, 71, '2024-11-25 11:15:00', 'Unpaid', 8.60),
(87, 96, '2024-11-26 12:15:00', 'Paid', 3.40),
(88,29 , '2024-11-27 13:15:00', 'Unpaid', 13.50),
(88,109 , '2024-11-28 14:15:00', 'Paid', 6.20),
(91,15 , '2024-11-29 15:15:00', 'Unpaid', 7.85),
(91, 76, '2024-11-30 16:15:00', 'Paid', 0.00),
(92, 45, '2024-12-01 10:45:00', 'Unpaid', 5.15),
(93,38 , '2024-12-02 11:45:00', 'Paid', 14.50),
(94, 84, '2024-12-03 12:45:00', 'Unpaid', 2.90),
(95,28 , '2024-12-04 13:45:00', 'Paid', 9.00),
(95,108 , '2024-12-05 14:45:00', 'Unpaid', 3.60),
(96,81 , '2024-12-06 15:45:00', 'Paid', 8.75),
(98,5 , '2024-12-07 10:15:00', 'Unpaid', 12.00),
(99,51 , '2024-12-08 11:15:00', 'Paid', 1.80),
(99, 99, '2024-12-09 12:15:00', 'Unpaid', 4.40),
(100,61, '2024-12-10 13:15:00', 'Paid', 7.25),
(101,11, '2024-12-11 14:15:00', 'Unpaid', 10.00),
(102,35, '2024-12-12 15:15:00', 'Paid', 5.60),
(102,58, '2024-12-13 10:30:00', 'Unpaid', 6.40),
(104,17 , '2024-12-14 11:30:00', 'Paid', 2.50),
(105,47 , '2024-12-15 12:30:00', 'Unpaid', 9.10),
(109,21 , '2024-12-16 13:30:00', 'Paid', 3.30);

SELECT * 
FROM LIBRARY_.BORROWING_AND_CIRCULATION
WHERE (BOOK_ID = 71 AND BORROWER_ID = 71) OR 
      (BOOK_ID = 72 AND BORROWER_ID = 72) OR 
      (BOOK_ID = 73 AND BORROWER_ID = 73) OR 
      -- continue this for each combination you want to check
      (BOOK_ID = 108 AND BORROWER_ID = 108);

--CREATING A STORED PROCEDURE--
CREATE PROCEDURE BB
AS
SELECT * FROM LIBRARY_.BORROWING_AND_CIRCULATION
GO;
EXEC BB;


--CREATING ANOTHER PROCEDURE--
CREATE PROCEDURE BBC
AS
BEGIN
SELECT * FROM LIBRARY_.BORROWING_AND_CIRCULATION
WHERE Book_ID =2
END;
GO
EXEC BBC;

--Create a stored procedure that retrieves all records from LIBRARY_.PHYSICAL_INFORMATION where Status is "Borrowed"--
CREATE PROCEDURE BB_AND_C
AS
BEGIN
SELECT * FROM LIBRARY_.PHYSICAL_INFORMATION
WHERE AVAILABILITY_STATUS ='CHECKED OUT'
END;
GO
--EXECUTING ABOVE STORED PROCEDURE--
EXEC BB_AND_C;

