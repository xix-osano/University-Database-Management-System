-- Create the 'staff' table
CREATE TABLE staff (
    id INT PRIMARY KEY,
    surname VARCHAR(300) NOT NULL,
    other_names VARCHAR(300) NOT NULL,
    role VARCHAR(300) NOT NULL
);

-- Create the 'lecturer' table
CREATE TABLE lecturer (
    id INT PRIMARY KEY,
    surname VARCHAR(300) NOT NULL,
    other_names VARCHAR(300) NOT NULL,
    email_address VARCHAR(300) NOT NULL UNIQUE,
    staff_id INT NOT NULL,
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

-- Create the 'department' table
CREATE TABLE department (
    id INT PRIMARY KEY,
    department_name VARCHAR(300) NOT NULL,
    department_head_id INT,
    FOREIGN KEY (department_head_id) REFERENCES lecturer(id)
);

-- Create the 'faculty' table
CREATE TABLE faculty (
    id INT PRIMARY KEY,
    faculty_name VARCHAR(300) NOT NULL,
    campus_location VARCHAR(300) NOT NULL,
    faculty_dean_id INT,
    FOREIGN KEY (faculty_dean_id) REFERENCES lecturer(id)
);

-- Create the 'programmes' table
CREATE TABLE programmes (
    id INT PRIMARY KEY,
    programme_title VARCHAR(300) NOT NULL,
    faculty_id INT NOT NULL,
    programme_cost DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculty(id)
);

-- Create the 'student' table
CREATE TABLE student (
    id INT PRIMARY KEY,
    surname VARCHAR(300) NOT NULL,
    other_names VARCHAR(300) NOT NULL,
    email_address VARCHAR(300) NOT NULL UNIQUE,
    current_programme_id INT NOT NULL,
    year_of_study INT NOT NULL,
    degree VARCHAR(300) NOT NULL,
    national_id VARCHAR(300) NOT NULL UNIQUE,
    FOREIGN KEY (current_programme_id) REFERENCES programmes(id)
);

-- Create the 'courses' table
CREATE TABLE courses (
    course_code VARCHAR(20) PRIMARY KEY,
    course_title VARCHAR(300) NOT NULL,
    department_id INT NOT NULL,
    programme_id INT NOT NULL,
    class_rep_id INT,
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (programme_id) REFERENCES programmes(id),
    FOREIGN KEY (class_rep_id) REFERENCES student(id)
);