DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT
    
);


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT,
    password TEXT,
    region_id INTEGER REFERENCES regions (id)
    
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT
    
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    info TEXT,
    user_id INTEGER REFERENCES users (id),
    region_id INTEGER REFERENCES regions (id),
    category_id INTEGER REFERENCES categories (id)
    
);

