CREATE TABLE worker (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(1000) NOT NULL CHECK (LENGTH(NAME) >= 2 AND LENGTH(NAME) <= 1000),
    BIRTHDAY DATE CHECK (EXTRACT(YEAR FROM BIRTHDAY) > 1900),
    LEVEL VARCHAR(10) NOT NULL CHECK (LEVEL IN ('Trainee', 'Junior', 'Middle', 'Senior')),
    SALARY INT CHECK (SALARY >= 100 AND SALARY <= 100000)
);

CREATE TABLE client (
    ID SERIAL PRIMARY KEY,
    NAME VARCHAR(1000) NOT NULL CHECK (LENGTH(NAME) >= 2 AND LENGTH(NAME) <= 1000)
);

CREATE TABLE project (
    ID SERIAL PRIMARY KEY,
    CLIENT_ID INT REFERENCES client(ID),
    START_DATE DATE,
    FINISH_DATE DATE
);

CREATE TABLE project_worker (
    PROJECT_ID INT REFERENCES project(ID),
    WORKER_ID INT REFERENCES worker(ID),
    PRIMARY KEY (PROJECT_ID, WORKER_ID)
);