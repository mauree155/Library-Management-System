USE Maureen;
GO

-- 1. List all books with their authors and categories
SELECT 
    b.Title AS BookTitle,
    CONCAT(a.FirstName, ' ', a.LastName) AS AuthorName,
    c.CategoryName,
    b.PublicationYear
FROM Books b
JOIN Authors a ON b.AuthorID = a.AuthorID
JOIN Categories c ON b.CategoryID = c.CategoryID;

-- 2. Find all currently borrowed books (not yet returned)

SELECT 
    m.FirstName + ' ' + m.LastName AS MemberName,
    b.Title AS BorrowedBook,
    br.BorrowDate
FROM Borrowing br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID
WHERE br.ReturnDate IS NULL;

-- 3. Count the total number of books per category
SELECT 
    c.CategoryName,
    COUNT(b.BookID) AS TotalBooks
FROM Categories c
LEFT JOIN Books b ON c.CategoryID = b.CategoryID
GROUP BY c.CategoryName;

-- 4. Find the most recently joined member
SELECT TOP 1 
    FirstName, LastName, MembershipDate
FROM Members
ORDER BY MembershipDate DESC;

-- 5. List members who borrowed more than one book
SELECT 
    m.FirstName + ' ' + m.LastName AS MemberName,
    COUNT(br.BookID) AS BooksBorrowed
FROM Borrowing br
JOIN Members m ON br.MemberID = m.MemberID
GROUP BY m.FirstName, m.LastName
HAVING COUNT(br.BookID) > 1;

-- 6. Find books published before 1900
SELECT 
    Title, PublicationYear
FROM Books
WHERE PublicationYear < 1900;

-- 7. Show the borrowing history of each member
SELECT 
    m.FirstName + ' ' + m.LastName AS MemberName,
    b.Title AS BookTitle,
    br.BorrowDate,
    br.ReturnDate
FROM Borrowing br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID
ORDER BY m.LastName, br.BorrowDate;

-- 8. Find the most borrowed book
SELECT TOP 1
    b.Title,
    COUNT(br.BookID) AS TimesBorrowed
FROM Borrowing br
JOIN Books b ON br.BookID = b.BookID
GROUP BY b.Title
ORDER BY COUNT(br.BookID) DESC;

-- 9. List authors who wrote more than one book
SELECT 
    a.FirstName + ' ' + a.LastName AS AuthorName,
    COUNT(b.BookID) AS NumberOfBooks
FROM Authors a
JOIN Books b ON a.AuthorID = b.AuthorID
GROUP BY a.FirstName, a.LastName
HAVING COUNT(b.BookID) > 1;

-- 10. Find members who have not borrowed any books
SELECT 
    m.FirstName + ' ' + m.LastName AS MemberName
FROM Members m
LEFT JOIN Borrowing br ON m.MemberID = br.MemberID
WHERE br.BookID IS NULL;
