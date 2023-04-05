CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title VARCHAR(255),
    body TEXT,
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
    user_id INTEGER REFERENCES users(id),
    body TEXT
);
