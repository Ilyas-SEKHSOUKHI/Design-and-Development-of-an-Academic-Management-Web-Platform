/*-----*/
CREATE TABLE ROLE(
    id_role INT PRIMARY KEY,
    nom_role VARCHAR(25)
);

/*-----*/
CREATE TABLE USERS(
    id_user INT PRIMARY KEY,
    username VARCHAR(25),
    password VARCHAR(25),
    email VARCHAR(50),
    id_role INT,
    CONSTRAINT fk_user_role
    FOREIGN KEY (id_role)
    REFERENCES ROLE(id_role)
);

/*-----*/
CREATE TABLE STUDENT(
    id_student INT PRIMARY KEY,
    nom VARCHAR(25),
    prenom VARCHAR(25),
    date_naissance DATE,
    email VARCHAR(50),
    id_user INT,
    CONSTRAINT fk_student_user
    FOREIGN KEY (id_user)
    REFERENCES USERS(id_user)
);

/*-----*/
CREATE TABLE TEACHER(
    id_teacher INT PRIMARY KEY,
    nom VARCHAR(25),
    prenom VARCHAR(25),
    specialite VARCHAR(25),
    email VARCHAR(50),
    id_user INT,
    CONSTRAINT fk_teacher_user
    FOREIGN KEY (id_user)
    REFERENCES USERS(id_user)
);

/*-----*/
CREATE TABLE MODULE(
    id_module INT PRIMARY KEY,
    nom_module VARCHAR(25),
    coefficient INT,
    id_teacher INT,
    CONSTRAINT fk_module_teacher
    FOREIGN KEY (id_teacher)
    REFERENCES TEACHER(id_teacher)
);

/*-----*/
CREATE TABLE PASSER_EVALUATION(
    id_student INT,
    id_module INT,
    note INT,
    moyenne FLOAT,
    PRIMARY KEY (id_student, id_module),
    CONSTRAINT fk_eval_student
    FOREIGN KEY (id_student)
    REFERENCES STUDENT(id_student),
    CONSTRAINT fk_eval_module
    FOREIGN KEY (id_module)
    REFERENCES MODULE(id_module)
);