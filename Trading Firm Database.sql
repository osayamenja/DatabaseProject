
DROP DATABASE IF EXISTS Trade_Firm;
CREATE DATABASE Trade_Firm;

USE Trade_Firm;
 -- CREATE statements.
CREATE TABLE Employee
(
  employee_ID		INT				PRIMARY KEY		AUTO_INCREMENT,
  SSN				varchar(11)		NOT NULL UNIQUE,
  employee_type		varchar(30)		NOT NULL,
  first_name		varchar(30)		NOT NULL,
  last_name			varchar(40)		NOT NULL,
  salary			INT				NOT NULL,
  department_name	varchar(30)		NOT NULL,
  job_ID			INT,
  CONSTRAINT Employee_fk_Department
    FOREIGN KEY (department_name)
    REFERENCES Department (department_name),
  CONSTRAINT Employee_fk_Job
    FOREIGN KEY (job_ID)
    REFERENCES Job (job_ID)
);

CREATE TABLE Engineer
(
	employee_ID		INT 			NOT NULL,
	employee_level	INT				NOT NULL,
	project			varchar(40)		NOT NULL,
  CONSTRAINT Engineer_fk_Employee
    FOREIGN KEY (employee_ID)
    REFERENCES Employee (employee_ID)
);

CREATE TABLE Recruiter
(
  employee_ID			INT				PRIMARY KEY,
  recruiting_location	varchar(50) 	NOT NULL,
  engineering_level		INT				NOT NULL,
  CONSTRAINT Recruiter_fk_Employee
    FOREIGN KEY (employee_ID)
    REFERENCES Employee (employee_ID)
);

CREATE TABLE HR_Manager
(
  employee_ID		INT							PRIMARY KEY,
  manager_ID		VARCHAR(255)					NOT NULL,
  CONSTRAINT HR_Manager_fk_Employee
    FOREIGN KEY (employee_ID)
    REFERENCES Employee (employee_ID)
);

CREATE TABLE Department
(
  department_name		varchar(40)		NOT NULL PRIMARY KEY,
  location				varchar(40)		NOT NULL
);

CREATE TABLE External_Applicant
(
  applicant_ID		INT				PRIMARY KEY		AUTO_INCREMENT,
  first_name		varchar(30)		NOT NULL,
  last_name			varchar(40)		NOT NULL,
  email				varchar(50)		NOT NULL,
  SSN				varchar(11)		NOT NULL 		UNIQUE,
  applicant_type	varchar(2)		NOT NULL
);

CREATE TABLE Part_Time_Applicant
(
  applicant_ID		INT				PRIMARY KEY,
  job_duration		varchar(15)		NOT NULL,
  CONSTRAINT Part_Time_Applicant_fk_External_Applicant
	FOREIGN KEY (applicant_ID)
    REFERENCES External_Applicant (applicant_ID)
);

CREATE TABLE Full_Time_Applicant
(
  applicant_ID			INT				PRIMARY KEY,
  marital_status		varchar(1)		NOT NULL,
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
  job_ID			INT				PRIMARY KEY		AUTO_INCREMENT,
  post_date			Date			NOT NULL,
  deadline			Date			NOT NULL,
  salary			INT				NOT NULL,
  location			varchar(40)		NOT NULL,
  department_name	varchar(40)		NOT NULL,
  job_type			varchar(2)		NOT NULL,
  CONSTRAINT job_fk_department
    FOREIGN KEY (department_name)
    REFERENCES department (department_name)
);

CREATE TABLE Internal_Job
(
  internal_ID		VARCHAR(255),
  job_ID			INT				PRIMARY KEY,
  CONSTRAINT Internal_Job_fk_Job
	FOREIGN KEY (job_ID)
    REFERENCES Job (job_ID)
);

CREATE TABLE External_Job
(
  external_ID		VARCHAR(255),
  job_ID			INT				PRIMARY KEY,
  CONSTRAINT External_Job_fk_Job
	FOREIGN KEY (job_ID)
    REFERENCES Job (job_ID)
);

-- INSERT statements.
INSERT INTO Department(department_name, location) VALUES
('Recruiting', 'NY'),
('HR', 'TX'),
('Engineering', 'CA');

INSERT INTO External_Applicant(first_name, last_name, email, SSN, applicant_type) VALUES
('Gisele', 'Penna', 'GisPenna39@gmail.com', '442-34-8920', 'FT'),
('Briggs', 'Callington', 'BriCallington14@gmail.com', '177-99-7349', 'FT'),
('Helge', 'Theakston', 'HelTheakston35@gmail.com', '288-87-0305', 'FT'),
('Amii', 'Fullard', 'AmiFullard48@gmail.com', '870-84-5696', 'FT'),
('Agnese', 'Greensitt', 'AgnGreensitt31@gmail.com', '407-13-9355', 'FT'),
('Codi', 'Ogan', 'CodOgan37@gmail.com', '511-57-4975', 'FT'),
('Olivero', 'Girhard', 'OliGirhard20@gmail.com', '182-08-1414', 'FT'),
('Brear', 'McFall', 'BreMcFall15@gmail.com', '569-89-0126', 'FT'),
('Aleksandr', 'Imlin', 'AleImlin19@gmail.com', '490-78-6379', 'FT'),
('Ree', 'Pavia', 'ReePavia33@gmail.com', '128-19-2696', 'FT'),
('Robert', 'DiBiagio', 'RobDiBiagio18@gmail.com', '724-85-5983', 'FT'),
('Calypso', 'Levin', 'CalLevin4@gmail.com', '530-22-9337', 'FT'),
('Bron', 'Johansen', 'BroJohansen39@gmail.com', '236-46-3083', 'FT'),
('Lucie', 'Brant', 'LucBrant13@gmail.com', '361-97-3413', 'FT'),
('Pierre', 'Troke', 'PieTroke47@gmail.com', '440-84-6882', 'FT'),
('Sabina', 'Jameson', 'SabJameson12@gmail.com', '206-42-7245', 'FT'),
('Thatcher', 'Allsopp', 'ThaAllsopp34@gmail.com', '280-83-1890', 'FT'),
('Cass', 'Lohde', 'CasLohde19@gmail.com', '495-74-8619', 'FT'),
('Angie', 'Clerke', 'AngClerke41@gmail.com', '137-55-5327', 'FT'),
('Derrek', 'Ilyenko', 'DerIlyenko7@gmail.com', '625-44-5456', 'FT'),
('Bendite', 'Deek', 'BenDeek42@gmail.com', '750-85-7912', 'FT'),
('Morley', 'Doggart', 'MorDoggart14@gmail.com', '723-83-3013', 'FT'),
('Con', 'Pettifor', 'ConPettifor39@gmail.com', '237-71-7232', 'FT'),
('Phaedra', 'Skacel', 'PhaSkacel46@gmail.com', '199-92-9843', 'FT'),
('Mandi', 'Aprahamian', 'ManAprahamian27@gmail.com', '507-43-6909', 'FT'),
('Gerry', 'Zammett', 'GerZammett32@gmail.com', '297-87-6310', 'FT'),
('Meridel', 'Allner', 'MerAllner30@gmail.com', '267-30-3480', 'FT'),
('Muffin', 'Buard', 'MufBuard33@gmail.com', '159-16-2666', 'FT'),
('Benjie', 'Perryn', 'BenPerryn43@gmail.com', '828-09-0377', 'FT'),
('Shelagh', 'Dugmore', 'SheDugmore50@gmail.com', '248-04-1187', 'FT'),
('Noll', 'Antyukhin', 'NolAntyukhin49@gmail.com', '382-77-4746', 'FT'),
('Tremaine', 'Kaines', 'TreKaines35@gmail.com', '740-69-3176', 'FT'),
('Kori', 'Brosel', 'KorBrosel30@gmail.com', '262-57-8801', 'FT'),
('Alyse', 'Tuke', 'AlyTuke33@gmail.com', '142-83-8315', 'FT'),
('Andros', 'Dutch', 'AndDutch33@gmail.com', '427-74-7771', 'FT'),
('Muhammad', 'Espinel', 'MuhEspinel18@gmail.com', '202-65-7174', 'FT'),
('Meta', 'Donnel', 'MetDonnel16@gmail.com', '331-68-3726', 'FT'),
('Debbie', 'Isabell', 'DebIsabell49@gmail.com', '562-38-7750', 'FT'),
('Myron', 'Bakhrushkin', 'MyrBakhrushkin24@gmail.com', '436-41-1571', 'FT'),
('Otho', 'Kender', 'OthKender17@gmail.com', '199-22-0341', 'FT'),
('Arie', 'Boutton', 'AriBoutton37@gmail.com', '422-63-7322', 'FT'),
('Rochelle', 'Easseby', 'RocEasseby42@gmail.com', '872-72-8742', 'FT'),
('Stillman', 'MacShirie', 'StiMacShirie47@gmail.com', '214-94-1291', 'FT'),
('Dallas', 'Colston', 'DalColston8@gmail.com', '772-71-5116', 'FT'),
('Amery', 'Posselt', 'AmePosselt37@gmail.com', '692-44-0372', 'FT'),
('Halsey', 'Spendley', 'HalSpendley34@gmail.com', '735-94-8635', 'FT'),
('Idell', 'Thiese', 'IdeThiese16@gmail.com', '519-93-5543', 'FT'),
('Valentine', 'Chaddock', 'ValChaddock37@gmail.com', '467-60-4055', 'FT'),
('Aindrea', 'Duplock', 'AinDuplock47@gmail.com', '214-42-8449', 'FT'),
('Dael', 'Arthur', 'DaeArthur42@gmail.com', '840-03-9392', 'FT'),
('Lissy', 'Levett', 'LisLevett28@gmail.com', '782-74-8849', 'FT'),
('Leena', 'Mattaus', 'LeeMattaus22@gmail.com', '118-85-4177', 'FT'),
('Eugen', 'Friend', 'EugFriend5@gmail.com', '525-77-8598', 'FT'),
('Ortensia', 'McGrail', 'OrtMcGrail1@gmail.com', '529-74-8812', 'FT'),
('Tressa', 'Busek', 'TreBusek11@gmail.com', '851-89-4729', 'FT'),
('Constancy', 'Barta', 'ConBarta16@gmail.com', '529-47-3455', 'FT'),
('Jaimie', 'Wicher', 'JaiWicher50@gmail.com', '429-06-2244', 'FT'),
('Clara', 'Bails', 'ClaBails34@gmail.com', '125-11-2438', 'FT'),
('Barb', 'Croston', 'BarCroston31@gmail.com', '841-03-5939', 'FT'),
('Billie', 'Giotto', 'BilGiotto48@gmail.com', '615-05-4047', 'FT'),
('Issie', 'Bonelle', 'IssBonelle49@gmail.com', '748-49-1955', 'FT'),
('Liam', 'McClurg', 'LiaMcClurg2@gmail.com', '772-30-6070', 'FT'),
('Hana', 'Fredson', 'HanFredson30@gmail.com', '896-33-6616', 'FT'),
('Kerwinn', 'Gersam', 'KerGersam11@gmail.com', '549-48-6922', 'FT'),
('Fawne', 'Tillett', 'FawTillett20@gmail.com', '498-19-7483', 'FT'),
('Guillemette', 'Cleen', 'GuiCleen27@gmail.com', '300-52-8760', 'FT'),
('Tracy', 'Clemens', 'TraClemens43@gmail.com', '202-30-5146', 'FT'),
('Almeria', 'Gilliatt', 'AlmGilliatt23@gmail.com', '431-29-8211', 'FT'),
('Verge', 'Whife', 'VerWhife22@gmail.com', '163-61-5493', 'FT'),
('Valery', 'Kift', 'ValKift26@gmail.com', '885-70-1347', 'FT'),
('Beck', 'Braddock', 'BecBraddock20@gmail.com', '486-82-6639', 'PT'),
('Federico', 'Abry', 'FedAbry10@gmail.com', '345-40-3540', 'PT'),
('Ellynn', 'Vandervelde', 'EllVandervelde31@gmail.com', '631-64-9687', 'PT'),
('Yoshi', 'Pablo', 'YosPablo13@gmail.com', '295-07-7686', 'PT'),
('Rowney', 'McParlin', 'RowMcParlin13@gmail.com', '802-97-7295', 'PT'),
('Davina', 'MacSporran', 'DavMacSporran31@gmail.com', '614-60-8219', 'PT'),
('Shaylah', 'Alelsandrovich', 'ShaAlelsandrovich27@gmail.com', '436-47-1811', 'PT'),
('Fania', 'Yakob', 'FanYakob30@gmail.com', '398-67-5569', 'PT'),
('Dagmar', 'Heffron', 'DagHeffron33@gmail.com', '605-93-6115', 'PT'),
('Giselle', 'Ivashnikov', 'GisIvashnikov8@gmail.com', '687-78-4880', 'PT'),
('Lenette', 'Maulden', 'LenMaulden25@gmail.com', '766-97-1063', 'PT'),
('Dennet', 'Dohrmann', 'DenDohrmann44@gmail.com', '474-40-4358', 'PT'),
('Rhianon', 'Lowell', 'RhiLowell42@gmail.com', '437-35-5785', 'PT'),
('Rosemarie', 'Gowdy', 'RosGowdy14@gmail.com', '790-74-3863', 'PT'),
('Townsend', 'McCall', 'TowdeClerc26@gmail.com', '186-13-7737', 'PT'),
('Bambie', 'Causer', 'BamCauser45@gmail.com', '513-70-7518', 'PT'),
('Lin', 'Howat', 'LinHowat36@gmail.com', '888-73-7676', 'PT'),
('Bartram', 'Joslow', 'BarJoslow12@gmail.com', '680-08-7562', 'PT'),
('Mommy', 'Santer', 'MomSanter19@gmail.com', '568-82-8283', 'PT'),
('Phillipe', 'Thurling', 'PhiThurling11@gmail.com', '384-17-9647', 'PT'),
('Victoria', 'Reddle', 'VicReddle44@gmail.com', '570-33-2950', 'PT'),
('Viviyan', 'Gentric', 'VivGentric10@gmail.com', '272-54-3051', 'PT'),
('Natalee', 'Johnson', 'NatJohn38@gmail.com', '424-76-0854', 'PT'),
('Konstance', 'Pulster', 'KonPulster12@gmail.com', '834-86-9822', 'PT'),
('Verna', 'Abbis', 'VerAbbis36@gmail.com', '744-01-3895', 'PT'),
('Nicky', 'Paske', 'NicPaske18@gmail.com', '820-98-4553', 'PT'),
('Den', 'Gipson', 'DenGipson37@gmail.com', '618-85-8252', 'PT'),
('Lorne', 'Alster', 'LorAlster30@gmail.com', '327-95-2278', 'PT'),
('Evanne', 'Manneville', 'EvaManneville42@gmail.com', '728-80-3512', 'PT'),
('Hildagarde', 'Hallows', 'HilHallows4@gmail.com', '318-81-5589', 'PT');

INSERT INTO Part_Time_Applicant(job_duration, applicant_id) VALUES
('10 months', 71),
('6 months', 72),
('2 months', 73),
('8 months', 74),
('1 months', 75),
('3 months', 76),
('5 months', 77),
('6 months', 78),
('2 months', 79),
('1 months', 80),
('4 months', 81),
('7 months', 82),
('4 months', 83),
('3 months', 84),
('12 months', 85),
('12 months', 86),
('5 months', 87),
('10 months', 88),
('8 months', 89),
('5 months', 90),
('5 months', 91),
('4 months', 92),
('11 months', 93),
('10 months', 94),
('5 months', 95),
('5 months', 96),
('2 months', 97),
('12 months', 98),
('6 months', 99),
('7 months', 100);

INSERT INTO Full_Time_Applicant(marital_status, applicant_id) VALUES
('M', 1),
('S', 2),
('S', 3),
('S', 4),
('M', 5),
('S', 6),
('S', 7),
('S', 8),
('M', 9),
('M', 10),
('M', 11),
('M', 12),
('S', 13),
('M', 14),
('S', 15),
('S', 16),
('M', 17),
('S', 18),
('S', 19),
('S', 20),
('S', 21),
('S', 22),
('S', 23),
('S', 24),
('M', 25),
('M', 26),
('S', 27),
('S', 28),
('M', 29),
('S', 30),
('S', 31),
('M', 32),
('S', 33),
('S', 34),
('S', 35),
('S', 36),
('S', 37),
('M', 38),
('S', 39),
('M', 40),
('M', 41),
('M', 42),
('S', 43),
('S', 44),
('M', 45),
('S', 46),
('M', 47),
('M', 48),
('S', 49),
('M', 50),
('S', 51),
('S', 52),
('M', 53),
('M', 54),
('M', 55),
('M', 56),
('M', 57),
('S', 58),
('M', 59),
('M', 60),
('S', 61),
('S', 62),
('M', 63),
('M', 64),
('M', 65),
('M', 66),
('S', 67),
('M', 68),
('S', 69),
('S', 70);

INSERT INTO Applies_For(applicant_id, job_id) VALUES
(1, 1),
(2, 4),
(3, 12),
(4, 3),
(5, 4),
(6, 13),
(7, 12),
(8, 13),
(9, 7),
(10, 12),
(11, 2),
(12, 2),
(13, 13),
(14, 1),
(15, 3),
(16, 11),
(17, 8),
(18, 4),
(19, 15),
(20, 14),
(21, 12),
(22, 13),
(23, 3),
(24, 13),
(25, 5),
(26, 14),
(27, 10),
(28, 9),
(29, 11),
(30, 7),
(31, 6),
(32, 14),
(33, 14),
(34, 7),
(35, 9),
(36, 8),
(37, 15),
(38, 10),
(39, 7),
(40, 13),
(41, 14),
(42, 15),
(43, 12),
(44, 8),
(45, 2),
(46, 12),
(47, 14),
(48, 11),
(49, 13),
(50, 4),
(51, 6),
(52, 8),
(53, 7),
(54, 8),
(55, 13),
(56, 5),
(57, 15),
(58, 5),
(59, 15),
(60, 12),
(61, 12),
(62, 5),
(63, 3),
(64, 2),
(65, 8),
(66, 9),
(67, 6),
(68, 6),
(69, 7),
(70, 8),
(71, 14),
(72, 8),
(73, 8),
(74, 4),
(75, 10),
(76, 5),
(77, 2),
(78, 4),
(79, 7),
(80, 7),
(81, 8),
(82, 8),
(83, 2),
(84, 17),
(85, 13),
(86, 7),
(87, 9),
(88, 6),
(89, 7),
(90, 9),
(91, 3),
(92, 18),
(93, 4),
(94, 3),
(95, 15),
(96, 12),
(97, 8),
(98, 3),
(99, 9),
(100, 13);

INSERT INTO Job(post_date, deadline, salary, location, department_name, job_type) VALUES
('2020-01-02', '2021-08-20', 85000, 'TX','HR','EJ'),
('2020-03-19', '2021-09-21', 90000, 'CA','Engineering', 'EJ'),
('2020-07-27', '2021-08-03', 140000, 'CA', 'Engineering', 'EJ'),
('2020-11-02', '2021-10-12', 62000, 'CA', 'Engineering', 'EJ'),
('2020-10-14', '2021-09-22', 94000, 'CA', 'Engineering', 'EJ'),
('2021-01-10', '2021-10-25', 125000, 'CA', 'Engineering', 'EJ'),
('2020-05-12', '2021-06-22', 137000, 'CA', 'Engineering', 'EJ'),
('2021-01-07', '2021-09-28', 111000, 'CA', 'Engineering', 'EJ'),
('2020-10-11', '2021-09-01', 104000, 'CA', 'Engineering', 'EJ'),
('2020-05-10', '2021-12-28', 102000, 'CA', 'Engineering', 'EJ'),
('2021-02-03', '2021-11-02', 105000, 'CA', 'Engineering', 'EJ'),
('2020-12-19', '2021-11-24', 148000, 'CA', 'Engineering', 'EJ'),
('2020-06-04', '2021-10-20', 121000, 'CA', 'Engineering', 'EJ'),
('2020-05-06', '2021-7-27', 132000, 'CA', 'Engineering', 'EJ'),
('2020-09-02', '2021-08-20', 130000, 'CA', 'Engineering', 'EJ'),
('2020-11-16', '2021-09-29', 54000, 'CA', 'Engineering', 'EJ'),
('2020-07-31', '2021-12-12', 85000, 'NY', 'Recruiting', 'EJ'),
('2020-05-17', '2021-08-07', 87000, 'NY', 'Recruiting', 'EJ'),
('2020-10-08', '2021-08-08', 94000, 'NY', 'Recruiting', 'IJ'),
("2020-01-03", "2021-09-13", 85000, "NY",'Recruiting','IJ'),
('2020-07-05', '2021-06-17', 145000, 'CA', 'Engineering', 'IJ'),
('2020-11-16', '2021-05-21', 144000, 'CA', 'Engineering', 'IJ'),
('2020-08-07', '2021-05-29', 141000, 'CA', 'Engineering', 'IJ'),
('2021-04-19', '2021-05-28', 90000, 'TX','HR', 'IJ');

INSERT INTO Internal_Job(internal_id, job_id) VALUES
('19I', 19),
('20I', 20),
('21I', 21),
('22I', 22),
('23I', 23),
('24I', 24);

INSERT INTO External_Job(external_id, job_id) VALUES
('IE', 1),
('2E', 2),
('3E', 3),
('4E', 4),
('5E', 5),
('6E', 6),
('7E', 7),
('8E', 8),
('9E', 9),
('10E', 10),
('11E', 11),
('12E', 12),
('13E', 13),
('14E', 14),
('15E', 15),
('16E', 16),
('17E', 17),
('18E', 18);

INSERT INTO Employee(SSN, employee_type, first_name, last_name, salary, department_name, job_ID) VALUES
('153-88-4237', 'Engineer', 'Bill', 'Jones', 90000, 'Engineering', 18),
('483-73-4242', 'Engineer', 'Julian', 'Rodriguez', 90000, 'Engineering', 19),
('312-35-7475', 'Recruiter', 'Eva', 'Stevens', 85000, 'Recruiting', 23),
('736-48-1357', 'Recruiter', 'Tyrod', 'Johnson', 85000, 'Recruiting', 24),
('194-41-8184', 'Engineer', 'Reinold', 'Clancy', 104000, 'Engineering', 19);

INSERT INTO Employee(SSN, employee_type, first_name, last_name, salary, department_name) VALUES
('730-89-5394', 'Recruiter', 'Randi', 'Nare', 144000, 'Recruiting'),
('687-80-9612', 'Recruiter', 'Rayna', 'Bilham', 104000, 'Recruiting'),
('240-63-3621', 'Engineer', 'Mitchell', 'Leil', 98000, 'Engineering'),
('318-09-7270', 'Engineer', 'Mirabella', 'Juhruke', 79000, 'Engineering'),
('876-99-4396', 'HR_Manager', 'Gardner', 'Beazleigh', 57000, 'HR'),
('203-80-5528', 'Recruiter', 'Blancha', 'Elmar', 141000, 'Recruiting'),
('490-60-1855', 'HR_Manager', 'Sandye', 'Sisselot', 115000, 'HR'),
('596-91-2513', 'Engineer', 'Brok', 'Orans', 149000, 'Engineering'),
('551-87-0256', 'Engineer', 'Karia', 'Burridge', 92000, 'Engineering'),
('752-68-5417', 'HR_Manager', 'Silva', 'Hillin', 80000, 'HR'),
('243-91-8643', 'HR_Manager', 'Franny', 'Giraux', 103000, 'HR'),
('883-90-7491', 'HR_Manager', 'Ezequiel', 'Dorbon', 136000, 'HR'),
('323-66-3112', 'Recruiter', 'Alisander', 'Eydel', 88000, 'Recruiting'),
('669-77-2284', 'Recruiter', 'Daisy', 'De Francesco', 110000, 'Recruiting'),
('201-60-8504', 'HR_Manager', 'Brock', 'McLean', 117000, 'HR'),
('898-97-8216', 'HR_Manager', 'Leopold', 'Coast', 131000, 'HR'),
('349-63-1719', 'HR_Manager', 'Cord', 'Mapes', 109000, 'HR'),
('385-42-1651', 'HR_Manager', 'Stella', 'Faux', 87000, 'HR'),
('418-03-4362', 'HR_Manager', 'Eleni', 'Lutas', 128000, 'HR'),
('389-70-8949', 'HR_Manager', 'Sibylle', 'Glavis', 149000, 'HR'),
('359-38-7917', 'Recruiter', 'Gayle', 'Spadazzi', 110000, 'Recruiting'),
('520-77-2028', 'Recruiter', 'Mic', 'Duiged', 62000, 'Recruiting'),
('144-01-8634', 'Engineer', 'Dena', 'Burness', 63000, 'Engineering'),
('468-40-5940', 'Engineer', 'Torey', 'Provest', 124000, 'Engineering'),
('714-78-0040', 'Recruiter', 'Ewell', 'Hadland', 116000, 'Recruiting'); 

INSERT INTO Engineer(employee_level, project, employee_id) VALUES
(3, 'Derivatives Trading', 1),
(5, 'Derivatives Trading', 2),
(2, 'Derivatives Trading', 5),
(5, 'Network Efficiency', 8),
(4, 'Network Efficiency', 9),
(4, 'Network Efficiency', 13),
(6, 'Algorithms Optimization', 14),
(6, 'Algorithms Optimization', 28),
(2, 'Website Development', 29),
(5, 'Website Development', 30);

INSERT INTO Recruiter(recruiting_location, engineering_level, employee_id) VALUES
('Richardson', 6, 3),
('Plano', 2, 4),
('Allen', 5, 6),
('Minneapolis', 4, 7),
('Atlanta', 6, 11),
('Princeton', 7, 18),
('Hartford', 5, 19),
('Bridgeport', 4, 26),
('Houston', 7, 27);

INSERT INTO HR_Manager(employee_id, manager_id) VALUES
(10, '10M'),
(12, '12M'),
(15, '15M'),
(16, '16M'),
(17, '17M'),
(20, '20M'),
(21, '21M'),
(22, '22M'),
(23, '23M'),
(24, '24M'),
(25, '25SM');

-- UPDATE Query
/*The company decided to open up two lucrative internal engineering jobs to the public because they have not recieved any internal applicants and because the deadlines are imminent for said jobs.
 In this case, imminency refers to dates before 2021-06-30. Opening to the public means the following: 
 inserting the pertinent tuples into the external job table, changing their job type identifiers, and deleting those tuples from the internal job table to avoide redundancy*/
 -- This is a transaction that performs the above business action.
SET autocommit = OFF;

DROP PROCEDURE IF EXISTS performJobSwitch;

DELIMITER $$
CREATE PROCEDURE performJobSwitch()
BEGIN
	DECLARE errorFlag INT DEFAULT 0; #variable to be used to detect error.
    
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
    SET errorFlag = 1;
    END;
    
    START TRANSACTION;
		INSERT INTO External_Job(external_id, job_id)
		SELECT (concat(job_id, 'E')), job_id
		FROM Job
		WHERE (salary > 140000 AND department_name = 'Engineering' AND deadline <= '2021-06-30');

		UPDATE Job
		SET job_type = 'EJ'
		WHERE (salary > 140000 AND department_name = 'Engineering' AND deadline <= '2021-06-30');

		DELETE FROM Internal_Job
		WHERE job_id IN (	SELECT job_id
							FROM Job
							WHERE (salary > 140000 AND department_name = 'Engineering' AND deadline <= '2021-06-30'));
    IF (errorFlag = 0)THEN 
		COMMIT;
	ELSE
		ROLLBACK;
	END IF;
END$$

DELIMITER ;

-- DELETE Query
/*The company has decided to eliminate applicants that requested for a part time contract of lesser than 3 months as it is seeking for long-term workforce expansion*/ 
SET SQL_SAFE_UPDATES = 0; -- this statement is necessary to prevent an error of code 1175 that prevents deletion from a table when a KEY column is not used in the WHERE clause.
DELETE Part_Time_Applicant, External_applicant
FROM (Part_Time_Applicant NATURAL JOIN External_applicant)
WHERE job_duration IN ('1 months', '2 months', '3 months');

-- UPDATE Query
CALL performJobSwitch();

-- As expected, the largest population is for external applicants.
SELECT COUNT(*) AS Largest_entity_population
FROM External_Applicant;

-- The chosen key entity for this query would be the HR managers of the trading firm 
SELECT * 
FROM HR_Manager NATURAL JOIN Employee;

-- The cooperative entities for this query would be the only Supervisory HR manager, denoted by "SM" in their manager ID, and their subordinate Recruiters.
SELECT *
FROM (	SELECT first_name, last_name, SSN, employee_ID, department_name
		FROM Recruiter NATURAL JOIN Employee AS E) AS T1 CROSS JOIN (	SELECT first_name AS Mgr_first_name, last_name AS Mgr_last_name, SSN AS Mgr_SSN, employee_ID AS Mgr_employee_ID, 
																				department_name AS Mgr_department_name 
																		FROM HR_Manager NATURAL JOIN Employee
																		WHERE  manager_id LIKE '%SM') AS T2;
-- This view comprises the information of all external applicants.
DROP VIEW IF EXISTS External_applicants_info;
CREATE VIEW External_applicants_info
AS 	SELECT *
	FROM (Job AS TB1 NATURAL JOIN 		(SELECT job_ID
										FROM Applies_For) AS TB2);

-- This view comprises the information of all internal applicants
DROP VIEW IF EXISTS Internal_applicants_info;
CREATE VIEW Internal_applicants_info
AS 	SELECT * 
	FROM (Job AS T1 NATURAL JOIN 		(SELECT job_ID
										FROM Employee
										WHERE job_ID IS NOT NULL) AS T2); 

-- This query obtains the job with the maximum number of applicants (inluding external and internal). 
SELECT job_ID, MAX(Total_applicants) AS Applicants, department_name AS Department, salary AS Salary, location AS Location
FROM
(	SELECT job_ID, COUNT(*) AS Total_applicants, salary, location, department_name
	FROM
	(SELECT *
	FROM External_applicants_info 
	UNION ALL 
	SELECT *
	FROM Internal_applicants_info) AS T
	GROUP BY job_ID) AS T2;

-- This query obtains the number of total applicants for each job posted in 2020. The table is sorted by posted date and deadline.
SELECT *, COUNT(*) AS Total_Applicants
FROM
(	SELECT *
	FROM External_applicants_info 
	UNION ALL 
	SELECT *
	FROM Internal_applicants_info) AS T
WHERE post_date < '2021-01-01'
GROUP BY job_ID
ORDER BY post_date ASC, deadline ASC;

 





