                                    📚 VIRTUSA MINI PROJECT
🚀 ** Project Overview **
This repository contains three mini projects designed to solve real-world problems using SQL, Java, and Python. Each module represents a practical business case and demonstrates problem-solving, logic building, and clean coding practices.

📌 ** Modules Included **
1️⃣ SQL – Digital Library Audit
2️⃣ Java – SmartPay Utility Biller
3️⃣ Python – Social Media Content Sanitizer

🧩 ** 1. SQL: Digital Library Audit **

📖 ** Business Case **
A community college wants to manage book borrowing efficiently. The system tracks overdue books, student activity, and popular categories.

🎯 ** Features **
- Track issued and returned books
- Identify overdue books (>14 days)
- Generate penalty reports
- Analyze most popular book categories
- Remove inactive users

🛠️ ** Implementation Steps **
Step 1: Create Tables
- Books
- Students
- IssuedBooks
- 
Step 2: Insert Sample Data
- Populate tables with sample records.
- 
Step 3: Overdue Query
  Find students who:
    - Have not returned books
    - Issue date > 14 days
      
Step 4: Popularity Analysis
Use:
    SELECT Category, COUNT(*) 
    FROM Books 
    GROUP BY Category;

Step 5: Data Cleanup
Remove inactive students:
    DELETE FROM Students
WHERE StudentID NOT IN (
    SELECT DISTINCT StudentID FROM IssuedBooks
)
AND JoinDate < '2021-03-20';

💡 ** 2. Java: SmartPay Utility Biller **

📖 ** Business Case **
A municipality wants to automate electricity/water billing with slab-based pricing.

🎯** Features **
- Unit-based billing system
- Progressive tax calculation
- Input validation
- Interface-based design
- Digital receipt generation

🛠️ ** Implementation Steps **
Step 1: Create Interface
    interface Billable {
    double calculateTotal();
}

Step 2: Implement Slab Logic
0–100 → ₹1/unit
101–300 → ₹2/unit
Above 300 → ₹5/unit

Step 3: Input Validation
Ensure current reading ≥ previous reading

Step 4: Loop for Multiple Users
Continue until user enters "Exit"

Step 5: Print Receipt
Display:
Customer Name
Units Consumed
Tax Amount
Final Bill

🐍 ** 3. Python: Social Media Content Sanitizer **

📖 ** Business Case **
A school social platform needs to filter harmful content and extract links.

🎯 ** Features **
- Detect and replace banned words
- Extract URLs from posts
- Save links to file
- Track user moderation stats
- Generate report
- 
🛠️ ** Implementation Steps **
Step 1: Define Sample Posts
posts = ["This is bad", "Visit http://example.com"]

Step 2: Banned Words Filtering
banned_words = ["bad", "toxic", "hate"]

Step 3: Replace Words
Replace with ***

Step 4: Extract Links
Identify strings starting with http
Save to links_found.txt

Step 5: Generate Summary
Total posts
Cleaned posts
Blocked posts

Step 6: User Report
{'User123': 3, 'User456': 0}

✨ ** Key Skills Demonstrated **
- Database Design & SQL Queries
- Java OOP Concepts & Interfaces
- Python String Processing & File Handling
- Problem Solving & Real-world Logic

🙌 ** Conclusion **
This project demonstrates how real-world problems can be solved using different technologies. It highlights practical implementation, clean structure, and scalable solutions across SQL, Java, and Python.
