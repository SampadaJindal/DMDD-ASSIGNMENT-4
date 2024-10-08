SQL Assignment 4 - Stored Procedures and Test Cases

Overview:
This project includes a collection of SQL stored procedures and associated test cases. The main goal of this assignment is to implement and test various database operations using SQL stored procedures, ensuring data integrity and correctness.

Files Included:

assignment 4 proc.sql:
Contains all the stored procedures created as part of the assignment.
Each procedure is documented within the file with its specific purpose and functionality.

Testcases_assignment 4.sql:
Contains the test cases designed to validate the functionality of the stored procedures.
Each test case corresponds to specific stored procedures and is designed to check different edge cases and expected outcomes.

Testcases2_assignment 4.sql:
Additional test cases that further validate the stored procedures.
Focuses on complex test scenarios and error handling.

Usage
Setting Up the Environment:
Make sure you have access to a MySQL or PostgreSQL database instance (depending on the SQL flavor used).

Run the assignment 4 proc.sql file to create all the required stored procedures in the database.
Example:
source path/to/assignment 4 proc.sql;

Execute the test case scripts (Testcases_assignment 4.sql and Testcases2_assignment 4.sql) to validate the stored procedures.
Example:
source path/to/Testcases_assignment 4.sql;

Stored Procedures

The stored procedures included in this project cover a range of database operations, including:
Insertions: Procedures for inserting data into various tables while maintaining data integrity.
Updates: Functions to modify data based on specific conditions.
Deletions: Procedures to safely remove data, ensuring that dependencies are properly handled.
Error Handling: Implementation of error handling to manage unexpected scenarios, such as invalid data or missing records.

Test Cases
The test cases are designed to cover:

Basic Functional Tests: Verifying that each stored procedure behaves as expected under normal conditions.
Edge Case Tests: Testing scenarios like missing data, boundary conditions, and invalid inputs.
Error Handling: Ensuring that the stored procedures handle exceptions and return appropriate error messages.

Additional Notes

Make sure to review the procedures before running them in a production environment, as they may modify existing data.
The test cases assume a clean database state. It is recommended to test on a backup or development instance.
