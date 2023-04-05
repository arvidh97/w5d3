PRAGMA foreign_keys = ON;

CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    body TEXT NOT NULL,
    author INTEGER NOT NULL,

    FOREIGN KEY (author) References users(id)
);

CREATE TABLE questions_follows(
    id INTEGER PRIMARY KEY,
    user_id INTEGER NOT NULL,
    questions_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) References user(id),
    FOREIGN KEY (questions_id) References questions(id)
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL REFERENCES questions(id),
    parent_id INTEGER REFERENCES replies(id),
    user_id INTEGER NOT NULL REFERENCES users(id),
    body TEXT NOT NULL 
);

CREATE TABLE question_likes(
    user_id INTEGER NOT NULL REFERENCES users(id),
    question_id INTEGER NOT NULL REFERENCES questions(id),
    PRIMARY KEY (user_id, question_id)
    -- (user_id, question_id) PRIMARY KEY 
);



