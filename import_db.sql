CREATE TABLE users(
    id INTEGER PRIMARY KEY
    fname VARCHAR(255)
    lname VARCHAR(255)
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY
    title VARCHAR(255)
    body TEXT 
    author INTEGER NOT NULL 

    FOREIGN KEY (author) REFRENCES users(id)
);

CREATE TABLE questions_follows 
    