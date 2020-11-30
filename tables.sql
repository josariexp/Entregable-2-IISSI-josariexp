DROP TABLE if EXISTS Grades;
DROP TABLE if EXISTS Tutorials;
DROP TABLE if EXISTS Teachers;
DROP TABLE if EXISTS studentsgroups;
DROP TABLE if EXISTS Groups;
DROP TABLE if EXISTS SubjectsDegrees;
DROP TABLE if EXISTS Subjects;
DROP TABLE if EXISTS Students;
DROP TABLE if EXISTS Classrooms;
DROP TABLE if EXISTS Offices;
DROP TABLE if EXISTS Departaments;
DROP TABLE if EXISTS Spaces;
DROP TABLE if EXISTS degrees;

CREATE TABLE Students(
studentId INT NOT NULL AUTO_INCREMENT,
dni CHAR(9) NOT NULL UNIQUE,
name VARCHAR(40) NOT NULL,
surname VARCHAR(100) NOT NULL,
birthDate DATE NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
accesMet VARCHAR(40),
PRIMARY KEY (studentId),
CONSTRAINT metodoAccesoInvalido CHECK (accesMet IN ('Selectividad', 'Ciclo', 'Mayor', 'Titulado Extranjero'))
);


CREATE TABLE Departaments(
departamentId INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) UNIQUE NOT NULL,
PRIMARY KEY (departamentId)
);  				 


CREATE TABLE Spaces(
spaceId INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) UNIQUE NOT NULL,
floor INT NOT NULL,
capacity INT NOT NULL,
PRIMARY KEY (spaceId),
CONSTRAINT errorNumPiso CHECK (floor >= 0),
CONSTRAINT errorCapacidad CHECK (capacity > 0)
);

CREATE TABLE degrees(
degreeId INT NOT NULL AUTO_INCREMENT,
name VARCHAR(50) UNIQUE NOT NULL,
years INT NOT NULL,
PRIMARY KEY (degreeId),
CONSTRAINT errorNumAños CHECK (years >= 3 AND years <= 5)
);

CREATE TABLE Classrooms(
classroomId INT NOT NULL AUTO_INCREMENT,
loudSpeaker BOOL NOT NULL,
projector BOOL NOT NULL,
spaceId INT NOT NULL UNIQUE,
PRIMARY KEY (classroomId),
FOREIGN KEY (spaceId) REFERENCES Spaces (spaceId)
											 ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Offices(
officeId INT NOT NULL AUTO_INCREMENT,
shared BOOL NOT NULL,
freeSpace BOOL NOT NULL,
spaceId INT NOT NULL UNIQUE,
PRIMARY KEY(officeId),
FOREIGN KEY(spaceId) REFERENCES Spaces (spaceId) 
										ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Subjects(
subjectId INT NOT NULL AUTO_INCREMENT,
name VARCHAR(100) NOT NULL UNIQUE,
acronym VARCHAR(10) NOT NULL UNIQUE,
credits INT NOT NULL,
type VARCHAR(20) NOT NULL,
year INT NOT NULL,
departamentId INT NOT NULL,
PRIMARY KEY (subjectId),
FOREIGN KEY (departamentId) REFERENCES departaments(departamentId) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT errorTipoAsignatura CHECK (type IN ('Obligatoria', 'Optativa', 'Formación Básica')),
CONSTRAINT errorCurso CHECK (year > 0 AND year <= 5),
CONSTRAINT errorCreditos CHECK (credits > 0)
);

CREATE TABLE SubjectsDegrees(
subjectDegreeId INT NOT NULL AUTO_INCREMENT,
subjectId INT NOT NULL,
degreeId INT NOT NULL,
PRIMARY KEY (subjectDegreeId),
FOREIGN KEY (subjectId) REFERENCES subjects(subjectId) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (degreeId) REFERENCES degrees(degreeId) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Groups(
groupId INT NOT NULL AUTO_INCREMENT,
name VARCHAR(10) NOT NULL,
year INT NOT NULL,
type VARCHAR(50) NOT NULL,
subjectId INT NOT NULL,
classroomId INT,
PRIMARY KEY (groupId),
FOREIGN KEY (subjectId) REFERENCES subjects(subjectId) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (classroomId) REFERENCES classrooms(classroomId)ON DELETE SET NULL ON UPDATE CASCADE,
CONSTRAINT errorAño CHECK (year > 0),
CONSTRAINT errorTipoGrupo CHECK (type IN ('Teoria', 'Laboratorio'))
);

CREATE TABLE StudentsGroups(
studentGroupId INT NOT NULL AUTO_INCREMENT,
studentId INT NOT NULL,
groupId INT NOT NULL,
PRIMARY KEY (studentGroupId),
FOREIGN KEY (studentId) REFERENCES students(studentId),
FOREIGN KEY (groupId) REFERENCES groups(groupId)
);

CREATE TABLE Teachers(
teacherId INT NOT NULL AUTO_INCREMENT,
dni CHAR(9) NOT NULL UNIQUE,
name VARCHAR(50) NOT NULL,
surname VARCHAR(100) NOT NULL,
birthDate DATE NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
category VARCHAR (30) NOT NULL,
departamentId INT NOT NULL,
officeId INT NOT NULL,
PRIMARY KEY (teacherId),
FOREIGN KEY (departamentId) REFERENCES departaments(departamentId),
FOREIGN KEY (officeId) REFERENCES offices(officeId),
CONSTRAINT errorCategoria CHECK (category IN ('Profesor', 'Titular de Universidad', 'Profesor Contratado Doctor', 'Profesor Ayudante Doctor'))
);

CREATE TABLE tutorials(
tutorialId INT NOT NULL AUTO_INCREMENT,
dayWeek VARCHAR(15) NOT NULL,
DATE DATE NOT NULL,
startTime TIME NOT NULL,
endTime TIME NOT NULL,
teacherId INT NOT NULL,
studentId INT NOT NULL,
PRIMARY KEY (tutorialId),
FOREIGN KEY (teacherId) REFERENCES teachers(teacherId),
FOREIGN KEY (studentId) REFERENCES students(studentId),
CONSTRAINT errorDiaSemana CHECK (dayWeek IN ('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes'))
);

CREATE TABLE Grades(
gradeId INT NOT NULL AUTO_INCREMENT,
intvalue DECIMAL NOT NULL,
gradeCall INT NOT NULL,
honor BOOL NOT NULL,
studentId INT NOT NULL,
groupId INT NOT NULL,
PRIMARY KEY (gradeId),
FOREIGN KEY (studentId) REFERENCES students(studentId),
FOREIGN KEY (groupId) REFERENCES groups(groupId)
);