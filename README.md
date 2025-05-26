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

🔹 4 . What is the difference between the VARCHAR and CHAR data types?

# VARCHAR (Variable Character) কী ?

VARCHAR(n) মানে হলো একটি পরিবর্তনশীল দৈর্ঘ্যের (Variable length) ক্যারেক্টার স্ট্রিং ।

# বৈশিষ্ট্য:

ইনপুটের সাইজ অনুযায়ী স্পেস ব্যবহার করে।

যদি VARCHAR(10) হয় এবং ইনপুট হয় 'Ali', তাহলে ডেটাবেজে শুধুই 'Ali' স্টোর হবে, কোনো অতিরিক্ত স্পেস নয়।

স্পেস বাঁচায় এবং ফ্লেক্সিবল ডেটা রাখতে সুবিধা হয়।

# কোথায় ব্যবহার করব?

যেখানে ডেটার দৈর্ঘ্য বিভিন্ন রকম হতে পারে। যেমনঃ নাম, ঠিকানা, ইমেইল, মন্তব্য ইত্যাদি।


#  CHAR (Fixed Length String) কী?

CHAR(n) মানে হলো একটি নির্দিষ্ট দৈর্ঘ্যের (Fixed length) ক্যারেক্টার স্ট্রিং।

# বৈশিষ্ট্য:

সবসময় ঠিক n সংখ্যক ক্যারেক্টার জায়গা দখল করে, ইনপুট ছোট হলেও।

যদি CHAR(10) হয় এবং ইনপুট হয় 'Ali', তাহলে ডেটাবেজে এটি হবে 'Ali ' → বাকি ৭টি জায়গা ফাঁকা স্পেস দিয়ে পূরণ হবে।

ফাস্টার পারফরম্যান্স দিতে পারে যখন সব ডেটা একই সাইজের হয়।

# কোথায় ব্যবহার করব?

যেখানে ডেটার দৈর্ঘ্য সবসময় সমান থাকে। যেমনঃ PIN, কোড, NID নম্বর, ইত্যাদি।


🔹 5 . Explain the purpose of the WHERE clause in a SELECT statement.

# WHERE Clause এর উদ্দেশ্য কী?

WHERE clause ব্যবহার করা হয় ডেটাবেজ থেকে নির্দিষ্ট শর্ত অনুযায়ী তথ্য  খুঁজে বের করার জন্য।

# WHERE Clause কী করে?

SELECT statement-এ WHERE clause এমনভাবে কাজ করে :

```Bash
SELECT column1, column2
FROM table_name
WHERE condition ;
```
এখানে condition মানে হলো কোনো শর্ত বা কন্ডিশন, যেটা পূরণ করলে ওই রেকর্ডগুলোই রিটার্ন হবে।


