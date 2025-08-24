USE Maureen
--Tables: Create 5 tables (Authors, Categories, Books, Members, and Borrowing).
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthYear INT
);
SELECT * FROM Authors;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL
);
SELECT * FROM Categories;

CREATE TABLE Books (
    BookID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100) NOT NULL,
    AuthorID INT NOT NULL,
    CategoryID INT NOT NULL,
    PublicationYear INT,
    CONSTRAINT FK_Author FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID) ON DELETE CASCADE,
    CONSTRAINT FK_Category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID) ON DELETE CASCADE
);
SELECT * FROM Books;

CREATE TABLE Members (
    MemberID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MembershipDate DATE NOT NULL
);
SELECT * FROM Members;

CREATE TABLE Borrowing (
    BorrowingID INT PRIMARY KEY IDENTITY(1,1),
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    CONSTRAINT FK_MemberTransaction FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    CONSTRAINT FK_BookTransaction FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE
);
SELECT * FROM Borrowing;

-- 2. Insert Sample Data
-- Insert Authors
INSERT INTO Authors (FirstName, LastName, BirthYear) VALUES
('George', 'Orwell', 1903),
('Jane', 'Austen', 1775),
('J.K.', 'Rowling', 1965),
('Mark', 'Twain', 1835),
('Agatha', 'Christie', 1890);

SELECT * FROM Authors;

-- Insert Categories
INSERT INTO Categories (CategoryName) VALUES
('Fiction'),
('Mystery'),
('Science Fiction'),
('Biography'),
('Fantasy');
SELECT * FROM Categories;

-- Insert Books
INSERT INTO Books (Title, AuthorID, CategoryID, PublicationYear) VALUES
('1984', 1, 1, 1949),
('Pride and Prejudice', 2, 1, 1813),
('Harry Potter and the Sorcerer''s Stone', 3, 5, 1997),
('The Adventures of Tom Sawyer', 4, 1, 1876),
('Murder on the Orient Express', 5, 2, 1934);
SELECT * FROM Books;

-- Insert Members
INSERT INTO Members (FirstName, LastName, MembershipDate) VALUES
('Alice', 'Johnson', '2023-01-15'),
('Bob', 'Smith', '2022-05-20'),
('Charlie', 'Brown', '2021-07-30'),
('David', 'Williams', '2023-09-10'),
('Emma', 'Davis', '2020-11-25');
SELECT * FROM Members;

-- Insert Borrowing Records
INSERT INTO Borrowing (MemberID, BookID, BorrowDate, ReturnDate) VALUES
(1, 1, '2024-02-01', '2024-02-15'),
(2, 3, '2024-02-05', NULL),
(3, 2, '2024-01-20', '2024-02-03'),
(4, 5, '2024-02-10', NULL),
(5, 4, '2024-01-25', '2024-02-12');
SELECT * FROM Borrowing;