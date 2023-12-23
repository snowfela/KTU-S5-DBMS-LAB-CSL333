LIBRARY MANAGEMENT SYSTEM 

AIM: 

a) Design a database schema for library management system with ER diagram from a 
problem description.

    PROBLEM DESCRIPTION: A library wants to maintain the record of books, members, book issue, book return, and fines 
        collected for late returns, in a database. The database can be loaded with book information. Students can 
        register with the library to be a member. Books can be issued to students with a valid library membership. A 
        student can keep an issued book with him/her for a maximum period of two weeks from the date of issue, beyond 
        which a fine will be charged. Fine is calculated based on the delay in days of return. For 0-7 days: Rs 10, For 
        7 – 30 days: Rs 100, and for days above 30 days: Rs 10 will be charged per day.

    DATABASE DESIGN:
        Book(book_id,title,language_id,mrp,publisher_id,published_date,volume,status) //language_id & publisher_id are FK 
        Author(author_id,name,email, phone_number, status) 
        Book_author(book_id,author_id) // many-to-many relationship, both columns are PK & FK 
        Publisher(publisher_id,name,address) 
        Member(member_id,name,branch_code,roll_number,phone_number,email_id,date_of_join,status) 
        Book_issue(issue_id,date_of_issue,book_id,member_id,expected_date_of_return,status) //book_id & member_id are fks 
        Book_return(issue_id,actual_date_of_return,latedays,latefee) // issue_id is PK & FK 
        Language(language_id,name) 
        Late_fee_rule(fromdays,todays,amount)  // composite key

b) Creation of database schema for library management system. Export ER diagram from 
the database & verify relationship (with ER diagram designed earlier) 

c) Learn and execute bulk import of data from csv files. 
______________________________________________________________________________

ER DIAGRAM:   [created using MySQL Workbench]

![er](https://github.com/snowfela/KTU-S5-DBMS-LAB-CSL333/assets/115859731/5acc2fc8-2952-4f54-896a-f440bb659bcc)
