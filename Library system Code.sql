
CREATE DATABASE Library;
use Library;

--Creating Tables--

CREATE TABLE users (

user_id int NOT NULL IDENTITY (1,1),
First_Name VARCHAR(255) NOT NULL,
Last_Name VARCHAR(255),
Email VARCHAR(255) NOT NULL,
Card_number VARCHAR(255) NOT NULL,
PRIMARY KEY (user_id) 
);




CREATE Table Book(
Book_id int IDENTITY(1,1),
Title VARCHAR(255),
Author VARCHAR(255),
Availability int
PRIMARY KEY(Book_id)

);

CREATE TABLE Transactions(
user_id int,
Book_id int,
Transaction_id int NOT NULL,
check_in_date date,
Check_out_date date,
PRIMARY KEY(Transaction_id),
FOREIGN KEY (user_id) REFERENCES users(user_id),
FOREIGN KEY (Book_id) REFERENCES Book(Book_id)
);


--End Tables-


--Populating the tables----


INSERT INTO users VALUES 
('John','Beckman','jbeckman@gmail.com','774-558-658'),
('Jane', 'Doe', 'janedoe@gmail.com', '123-456-789'),
('Alice', 'Smith', 'alice.smith@gmail.com', '987-654-321'),
('Bob', 'Johnson', 'bjohnson@gmail.com', '555-123-789'),
('Eva', 'Williams', 'eva.williams@gmail.com', '456-789-012'),
('Sam', 'Miller', 'sammiller@gmail.com', '789-012-345'),
('Laura', 'Clark', 'laura.clark@gmail.com', '234-567-890'),
('David', 'Brown', 'david.brown@gmail.com', '789-012-345'),
('Sophie', 'Taylor', 'sophie.taylor@gmail.com', '567-890-123'),
('Chris', 'Davis', 'chris.davis@gmail.com', '890-123-456');




INSERT INTO Books (Title, Author, Availability) VALUES
    ('The Catcher in the Rye', 'J.D. Salinger', 1),
    ('To Kill a Mockingbird', 'Harper Lee', 1),
    ('1984', 'George Orwell', 1),
    ('Pride and Prejudice', 'Jane Austen', 1),
    ('The Great Gatsby', 'F. Scott Fitzgerald', 1),
    ('The Hobbit', 'J.R.R. Tolkien', 1),
    ('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 1),
    ('The Lord of the Rings', 'J.R.R. Tolkien', 1),
    ('The Da Vinci Code', 'Dan Brown', 1),
    ('The Hitchhiker''s Guide to the Galaxy', 'Douglas Adams', 1);


	INSERT INTO Transactions (user_id, Book_id, Transaction_id, Check_out_date, check_in_date) VALUES
    (10, 1, 1, '2024-01-01', '2024-01-10'),
    (2, 2, 2, '2024-02-01', '2024-02-15'),
    (3, 3, 3, '2024-03-01', '2024-03-08'),
    (4, 4, 4, '2024-04-01', '2024-04-15'),
    (5, 5, 5, '2024-05-01', '2024-05-15'),
    (8, 6, 6, '2024-06-01', '2024-07-01'),
    (2, 7, 7, '2024-07-01', '2024-08-04'),
    (3, 8, 8, '2024-08-01', '2024-08-10'),
    (4, 9, 9, '2024-09-01', '2024-09-15'),
    (5, 10, 10, '2024-10-01', '2024-11-01');
	

	-- End Populating Tables--

	--Query--

	SELECT t.Transaction_id,u.first_Name,u.Card_number,b.Title,t.Check_out_date AS [Borrow Date], t.Check_in_date AS [Return Date]
	From Transactions t
	INNER JOIN users u ON t.user_id = u.user_id
	INNER JOIN Book b ON t.Book_id = b.Book_id;
	--This code will return the transaction ID, name of user , book borrowed, start and return dates. I used aliases to make the code easier to read.