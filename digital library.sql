use digitallibrary;
-- Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    JoinDate DATE
);

-- Books Table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Category VARCHAR(50)
);

-- IssuedBooks Table
CREATE TABLE IssuedBooks (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    BookID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
INSERT INTO Students VALUES
(101, 'Sreeyah', 'sreeyah@gmail.com', '2023-01-01'),
(102, 'Harshu', 'Harshu@gmail.com', '2022-06-15'),
(103, 'SreeHarsha', 'Sreeharsha@gmail.com', '2020-01-01');

INSERT INTO Books VALUES
(1, 'Java Basics', 'ABC', 'Science'),
(2, 'History of India', 'XYZ', 'History'),
(3, 'Fiction Story', 'PQR', 'Fiction');

INSERT INTO IssuedBooks (StudentID, BookID, IssueDate, ReturnDate) VALUES
(101, 1, '2024-03-01', NULL),
(102, 2, '2024-03-10', '2024-03-15'),
(103, 3, '2024-02-01', NULL);

-- Overdue Books Query
SELECT s.Name, b.Title, i.IssueDate
FROM IssuedBooks i
JOIN Students s ON i.StudentID = s.StudentID
JOIN Books b ON i.BookID = b.BookID
WHERE i.ReturnDate IS NULL
AND i.IssueDate < '2024-03-20' - INTERVAL 14 DAY;

-- Popularity Index
SELECT b.Category, COUNT(*) AS BorrowCount
FROM IssuedBooks i
JOIN Books b ON i.BookID = b.BookID
GROUP BY b.Category
ORDER BY BorrowCount DESC;

-- Data Cleanup
DELETE FROM Students
WHERE StudentID > 0
AND StudentID NOT IN (
    SELECT DISTINCT StudentID FROM IssuedBooks
)
AND JoinDate < '2024-03-20' - INTERVAL 3 YEAR;
SELECT * FROM Students;
SELECT * FROM Books;
SELECT * FROM IssuedBooks;