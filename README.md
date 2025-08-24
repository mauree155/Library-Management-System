# Library Management System (SQL Project)

## Table of Contents
- [Project Overview](project-overview)  
- [Database Design](database-design)  
- [Data Source](data-source)  
- [Tools](tools)  
- [Processes](processes)  
- [Example Queries](example-queries)  
- [Key Insights](key-insights)  
- [Recommendations](recommendations)   

## Project Overview
This project demonstrates the design and implementation of a relational database system for managing a library. The system enables the efficient organization and tracking of books, authors, categories, members, and borrowing activities.  

The goal is to simulate a real-world library management use case and provide a foundation for answering questions such as:  
- Which books are borrowed most often?  
- Who are the most active members?  
- What categories are most popular?  
- Which books are currently overdue for return?  

## Database Design
The database consists of five tables with defined relationships:  

1. **Authors** – Stores author details (first name, last name, birth year).  
2. **Categories** – Defines book categories such as Fiction, Fantasy, or Mystery.  
3. **Books** – Contains book information, linked to both authors and categories.  
4. **Members** – Holds library member information and membership dates.  
5. **Borrowing** – Tracks book loans, borrow dates, and return dates.  

### Relationships
- Each book belongs to one author and one category.  
- Each borrowing record links a member to a book.  
- Referential integrity is enforced with foreign keys and cascading rules (`ON DELETE CASCADE`).  

*<img width="1243" height="547" alt="ERD PART 1(Screenshot)" src="https://github.com/user-attachments/assets/45fb2200-eb8f-4f31-824c-94cbd463b155" />*  
****

## Data Source
The data is **synthetic** and manually generated for demonstration purposes. It includes:  
- Renowned authors such as George Orwell, Jane Austen, J.K. Rowling, and Agatha Christie.  
- Classic and popular books including *1984*, *Pride and Prejudice*, *Harry Potter and the Sorcerer’s Stone*, and *Murder on the Orient Express*.  
- Fictional library members with realistic join dates and borrowing activity.  


## Tools
- SQL Server / MySQL – Database design, querying, and testing.  
- ERD software (optional) – To visualize database relationships.  


## Processes
**Step 1: Database Schema Design**  
- Defined tables with appropriate primary keys, foreign keys, and constraints.  
- Enforced referential integrity through cascading rules.  

**Step 2: Data Insertion**  
- Inserted sample data into all five tables (authors, categories, books, members, and borrowing).  

**Step 3: Query Development**  
- Created analytical queries using joins, aggregations, and filtering to answer practical library management questions.  

## Example Queries

**1. List all books currently borrowed but not returned**  
```sql
SELECT m.FirstName, m.LastName, b.Title, br.BorrowDate
FROM Borrowing br
JOIN Members m ON br.MemberID = m.MemberID
JOIN Books b ON br.BookID = b.BookID
WHERE br.ReturnDate IS NULL;
```

**2. Find the most borrowed category**
```sql
SELECT c.CategoryName, COUNT(*) AS BorrowCount
FROM Borrowing br
JOIN Books b ON br.BookID = b.BookID
JOIN Categories c ON b.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY BorrowCount DESC;
```

**3. Get members who borrowed more than two books**
```sql
SELECT m.FirstName, m.LastName, COUNT(*) AS BooksBorrowed
FROM Borrowing br
JOIN Members m ON br.MemberID = m.MemberID
GROUP BY m.FirstName, m.LastName
HAVING COUNT(*) > 2;
```

**4. Show authors whose books are still borrowed (not returned)**
```sql
SELECT a.FirstName, a.LastName, b.Title
FROM Borrowing br
JOIN Books b ON br.BookID = b.BookID
JOIN Authors a ON b.AuthorID = a.AuthorID
WHERE br.ReturnDate IS NULL;
```
## Key Insights

- Borrowing activity reveals that some members are significantly more active than others.

- Fiction and Mystery are the most popular categories, indicating strong user preference.

- Authors such as J.K. Rowling and Agatha Christie stand out in borrowing records, reflecting high demand.

- Some books remain unreturned, showing the importance of monitoring overdue loans.

## Recommendations

- Encourage Member Engagement – Implement programs such as book clubs or recommendations to activate less frequent borrowers.

- Automate Overdue Notifications – Develop triggers or stored procedures to alert members about overdue books.

- Expand Popular Categories – Increase stock in Fiction and Mystery categories to meet demonstrated demand.

- Future Integration – Build on this database to power a web or mobile application for complete digital library management.

## Conclusion

This project highlights strong SQL fundamentals, covering database schema design, relational modeling, data population, and analytical querying. It demonstrates how structured SQL systems can be used to support real-world library management, providing valuable insights into user behavior and operational needs.

