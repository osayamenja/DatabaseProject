
DROP DATABASE IF EXISTS Trade_Firm;
CREATE DATABASE Trade_Firm;

USE Trade_Firm;

CREATE TABLE Employee
(
  employee_ID		INT				PRIMARY KEY		AUTO_INCREMENT,
  SSN				varchar(11)		UNIQUE,
  employee_type		varchar(30),
  first_name		varchar(30),
  last_name			varchar(40),
  salary			INT,
  department_name	varchar(30),
  applicant_ID		INT,
  job_ID			INT,
  CONSTRAINT Employee_fk_Department
    FOREIGN KEY (department_name)
    REFERENCES Department (department_name),
  CONSTRAINT Employee_fk_External_Applicant
    FOREIGN KEY (applicant_ID)
    REFERENCES External_Applicant (applicant_ID),
  CONSTRAINT Employee_fk_Job
    FOREIGN KEY (job_ID)
    REFERENCES Job (job_ID)
);

CREATE TABLE Engineer
(
  employee_level	INT,
  project			varchar(40),
  employee_ID		INT				PRIMARY KEY,
  CONSTRAINT Engineer_fk_Employee
    FOREIGN KEY (employee_ID)
    REFERENCES Employee (employee_ID)
);

CREATE TABLE Recruiter
(
  recruiting_location	varchar(50),
  engineering_level		INT,
  employee_ID			INT				PRIMARY KEY,
  CONSTRAINT Recruiter_fk_Employee
    FOREIGN KEY (employee_ID)
    REFERENCES Employee (employee_ID)
);

CREATE TABLE HR_Manager
(
  manager_ID		INT,
  employee_ID		INT					PRIMARY KEY,
  CONSTRAINT HR_Manager_fk_Employee
    FOREIGN KEY (employee_ID)
    REFERENCES Employee (employee_ID)
);

CREATE TABLE Department
(
  department_name		varchar(40)		PRIMARY KEY,
  location				varchar(40),
  jobs_available		INT,
  employee_population	INT
);

CREATE TABLE External_Applicant
(
  applicant_ID		INT				PRIMARY KEY		AUTO_INCREMENT,
  first_name		varchar(30),
  last_name			varchar(40),
  email				varchar(50),
  SSN				varchar(11)		UNIQUE,
  applicant_type	varchar(2)
);

CREATE TABLE Part_Time_Applicant
(
  job_duration		varchar(15),
  applicant_ID		INT										PRIMARY KEY,
  CONSTRAINT Part_Time_Applicant_fk_External_Applicant
	FOREIGN KEY (applicant_ID)
    REFERENCES External_Applicant (applicant_ID)
);

CREATE TABLE Full_Time_Applicant
(
  marital_status		varchar(1),
  applicant_ID			INT									PRIMARY KEY,
  CONSTRAINT Full_Time_Applicant_fk_External_Applicant
	FOREIGN KEY (applicant_ID)
    REFERENCES External_Applicant (applicant_ID)
);

CREATE TABLE Applies_For
(
  applicant_ID		INT,
  job_ID			INT,
  CONSTRAINT Applies_For_fk_External_Applicant
	FOREIGN KEY (applicant_ID)
    REFERENCES External_Applicant (applicant_ID),
  CONSTRAINT Applies_For_fk_Job
	FOREIGN KEY (job_ID)
    REFERENCES Job (job_ID),
  CONSTRAINT Applies_For_pk
    PRIMARY KEY (applicant_ID, job_ID)
);

CREATE TABLE Job
(
  job_ID		INT				PRIMARY KEY		AUTO_INCREMENT,
  post_date		Date,
  deadline		Date,
  salary		INT,
  location		varchar(40)
);

CREATE TABLE Internal_Job
(
  internal_ID		INT,
  job_ID			INT				PRIMARY KEY,
  CONSTRAINT Internal_Job_fk_Job
	FOREIGN KEY (job_ID)
    REFERENCES Job (job_ID)
);

CREATE TABLE External_Job
(
  external_ID		INT,
  job_ID			INT				PRIMARY KEY,
  CONSTRAINT External_Job_fk_Job
	FOREIGN KEY (job_ID)
    REFERENCES Job (job_ID)
);

INSERT INTO Department(department_name, location, jobs_available, employee_population) VALUES
("Recruiting", "34b", 5, 0),
("HR", "15a", 5, 0),
("Part-time", "5c", 20, 0),
("Engineering", "10a", 10, 0);

INSERT INTO External_Applicant(first_name, last_name, email, SSN, applicant_type) VALUES
("Bill", "Jones", "billjones@gmail.com", "153-88-4237", "FT"),
("Bethany", "Thomas", "bthomas@gmail.com", "144-16-5555", "FT"),
("Julian", "Rodriguez", "jrod55@gmail.com", "483-73-4242", "FT"),
("Mitchell", "Collins", "mc25000@gmail.com", "456-13-1388", "PT"),
("Eva", "Stevens", "estevens@outlook.com", "312-35-7475", "FT"),
("Jenna", "Carlisle", "jjj37cc@outlook.com", "100-45-7373", "PT"),
("Tyrod", "Johnson", "tytheman@outlook.com", "736-48-1357", "FT"),
("Kate", "Rodgers", "krodgers02@outlook.com", "736-13-7888", "FT");

INSERT INTO Part_Time_Applicant(job_duration, applicant_id) VALUES
("6 months", 4),
("6 months", 6);

INSERT INTO Full_Time_Applicant(marital_status, applicant_id) VALUES
("S", 1),
("S", 2),
("M", 3),
("S", 5),
("M", 7),
("M", 8);

INSERT INTO Applies_For(applicant_id, job_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4);

INSERT INTO Job(post_date, deadline, salary, location) VALUES
("2021-04-19", "2021-05-21", 90000, "23c"),
("2019-03-19", "2019-05-21", 90000, "23c"),
("2019-01-02", "2019-03-13", 85000, "58a"),
("2019-01-03", "2019-02-28", 85000, "58a");

INSERT INTO Internal_Job(internal_id, job_id) VALUES
(552, 1),
(228, 2);

INSERT INTO External_Job(external_id, job_id) VALUES
(131, 3),
(232, 4);

INSERT INTO Employee(SSN, employee_type, first_name, last_name, salary, department_name, applicant_ID, job_ID) VALUES
("153-88-4237", "Engineer", "Bill", "Jones", 90000, "Engineering", 1, 1),
("483-73-4242", "Engineer", "Julian", "Rodriguez", 90000, "Engineering", 3, 2),
("312-35-7475", "Recruiter", "Eva", "Stevens", 85000, "Recruiting", 5, 3),
("736-48-1357", "Recruiter", "Tyrod", "Johnson", 85000, "Recruiting", 7, 4);

INSERT INTO Engineer(employee_level, project, employee_id) VALUES
(5, "Netkwork Efficiency", 1),
(4, "Hardware Optimization", 2);

INSERT INTO Recruiter(recruiting_location, engineering_level, employee_id) VALUES
("Burbank", 2, 3),
("Brownsville", 2, 4);