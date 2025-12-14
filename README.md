# LIBRARY MANAGEMENT SYSTEM


📋 Project Overview
This is a fully-functional, relational database system built with **Microsoft SQL Server** and **SQL (T-SQL)**. It is designed to automate and manage the core operations of a library, including book inventory tracking, member registrations, loan transactions, and fine calculations. The project demonstrates strong skills in database design, query optimization, and implementing business logic directly within the database layer.

 🛠️ Technologies Used
*   **Database System:** Microsoft SQL Server
*   **Core Language:** SQL / Transact-SQL (T-SQL)
*   **Key Concepts Applied:** Relational Schema Design, Data Normalization (3NF), Stored Procedures, User-Defined Functions, Constraints (Primary/Foreign Keys, CHECK), Indexing for Query Performance, and Triggers.

🗄️ Database Schema & Design
The system is built around several core tables that reflect real-world library entities and their relationships:
*   **`Books`**: Stores inventory details (ISBN, Title, Author, Category, Status).
*   **`Members`**: Holds library member information and their membership status.
*   **`Loans`**: The central transaction table linking `Books` and `Members`, recording check-out/return dates.
*   **`Fines`**: Tracks any overdue fines associated with a specific loan.

**Design Principle:** The schema was normalized to the Third Normal Form (3NF) to eliminate data redundancy and ensure integrity through the use of primary and foreign key constraints.

 ✨ Key Features & Functionality
 1. Core Data Operations
*   **Book Catalog Management:** Insert, update, and search for books by various attributes (Title, Author, Category).
*   **Member Management:** Register new members and update their profiles.
*   **Loan Lifecycle:** Complete workflow for borrowing and returning books. The system automatically validates member status and book availability.

 2. Automated Business Logic (Using T-SQL)
*   **Stored Procedures:** `usp_BorrowBook` and `usp_ReturnBook` handle the entire loan/return process, ensuring data consistency.
*   **Triggers:** An automated trigger calculates and applies daily fines when a book is returned past its due date.
*   **User-Defined Function:** A function calculates the total fine amount for a given member.

 3. Reporting & Insights
The database supports complex queries for valuable library insights, such as:
*   "Most frequently borrowed books this month."
*   "Members with currently overdue books."
*   "Books that are currently available."
*   "Total fine revenue collected in a period."

 🚀 How to Explore This Project
As this is a database project, the best way to review it is by examining the SQL scripts.

1.  **Review the Schema:** Open the main `LIBRARY-MANAGEMENT-SYSTEM.sql` file. Executing this script in **SQL Server Management Studio (SSMS)** or **Azure Data Studio** will recreate the entire database structure.
2.  **Run Sample Queries:** The `LIBRARY-MANAGEMENT-SYSTEM.sql` file contains example `SELECT` statements that demonstrate the system's reporting capabilities. 

