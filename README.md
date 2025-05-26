✅ Wildlife Conservation Monitoring Assignment,using PostgreSQL, including table creation, data insertion

🔹 1. What is PostgreSQL?

PostgreSQL হল একটি শক্তিশালী, ওপেন-সোর্স রিলেশনাল ডাটাবেইজ ম্যানেজমেন্ট সিস্টেম (RDBMS), যা SQL এবং JSON-এর মতো আধুনিক ডেটা টাইপ সাপোর্ট করে। এটি ACID (Atomicity, Consistency, Isolation, Durability) নিয়ম অনুসরণ করে এবং বড় অ্যাপ্লিকেশন বা ওয়েব প্রজেক্টে ডেটা সঞ্চালনার জন্য ব্যাপকভাবে ব্যবহৃত হয়।

🔹 2. What is the purpose of a database schema in PostgreSQL?

Schema হল একটি লজিক্যাল স্ট্রাকচার, যা ডাটাবেইজে টেবিল, ভিউ, ফাংশন ইত্যাদি গ্রুপ করে রাখে।

📌 উদ্দেশ্য:

ডেটাবেইজ সংগঠিত রাখা

একই ডাটাবেইজে একাধিক ইউজারের জন্য আলাদা কাঠামো তৈরি করা

নাম কনফ্লিক্ট এড়ানো

উদাহরণ:

```Bash
CREATE SCHEMA inventory ;
```
🔹 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

# Primary Key কী?
Primary Key হলো একটি টেবিলের এমন একটি কলাম বা কলাম সমষ্টি  যা প্রতিটি রেকর্ডের জন্য ইউনিক অন্যের মতো নয় এবং খালি নয় হয়।


# বৈশিষ্ট্য :

একটি টেবিলে কেবল একটি মাত্র Primary Key থাকতে পারে।

Primary Key-এর মান null হতে পারে না।

প্রতিটি রেকর্ডের জন্য Primary Key ভিন্ন হতে হবে।

```Bash 
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);
```
এখানে student_id হলো Primary Key, যা প্রতিটি স্টুডেন্টকে আলাদা করে চিনিয়ে দেবে।


# Foreign Key কী?

Foreign Key হলো এমন একটি কী, যা অন্য একটি টেবিলের Primary Key বা Unique Key-কে রেফার করে। এর মাধ্যমে দুইটি টেবিলের মধ্যে সম্পর্ক  তৈরি হয়।


# বৈশিষ্ট্য :

এটি অন্য টেবিলের Primary Key বা Unique Key-কে রেফার করে।

এর মাধ্যমে Referential Integrity (তথ্য মিল রেখে চলা) বজায় থাকে।

একটি টেবিলে একাধিক Foreign Key থাকতে পারে।


# আমাদের কাছে দুটি টেবিল আছে:

১. departments টেবিল:

```Bash
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100)
);
```

২. students টেবিল, যেখানে প্রতিটি স্টুডেন্ট কোনো একটি ডিপার্টমেন্টে পড়ে:

```Bash
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
```
এখানে students টেবিলের dept_id কলামটি হলো Foreign Key, যা departments টেবিলের dept_id কলামকে রেফার করছে।





