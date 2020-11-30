

/*  POPULATE ALUMNOS  */
INSERT INTO Students (dni, name, surname, birthDate, email, accesMet)
 				 VALUES ('12123434A', 'Manolo', 'Gonzalez Jimenez', '1154-05-01', 'emailejemplo', 'Titulado Extranjero');

INSERT INTO Students (dni, NAME, surname, birthDate, email, accesMet)
 				 VALUES ('75397079H', 'Aurelio', 'Santos Navarrete', '1958-03-24', 'emailejemplo232', 'Mayor');
INSERT INTO Students (dni, NAME, surname, birthDate, email, accesMet)
 				 VALUES ('43215432T', 'Sara', 'Herrera Segovia', '1983-09-03', 'emailnoejemplo', 'Selectividad');
				 
/*  POPULATE DEPARTAMENTOS */ 
INSERT INTO Departaments(name) VALUES ('Matemáticas');

INSERT INTO Departaments(name) VALUES ('Software');

INSERT INTO Departaments(name) VALUES ('Hardware');

/*  POPULATE ESPACIOS  */
INSERT INTO Spaces(name, floor, capacity) VALUES ('A1.13', 1, 80);

INSERT INTO Spaces(name, floor, capacity) VALUES ('C3.34', 3, 40);

INSERT INTO Spaces(name, floor, capacity) VALUES ('G2.26', 2, 25);

INSERT INTO Spaces(name, floor, capacity) VALUES ('H2.41', 1, 10);

/*  POPULATE GRADOS  */
INSERT INTO Degrees(name, years) VALUES ('Ingeniería del Software', 4);

INSERT INTO Degrees(name, years) VALUES ('Ingeniería Informática', 3);

INSERT INTO Degrees(name, years) VALUES ('Ingeniería de Computadores', 5);

/*  POPULATE AULAS  */
INSERT INTO classrooms(loudSpeaker, projector, spaceId) VALUES (1,0,1);

INSERT INTO classrooms(loudSpeaker, projector, spaceId) VALUES (1,1,3);

/*  POPULATE DESPACHOS  */

INSERT INTO Offices(shared, freeSpace, spaceId) VALUES (1,1,2);

INSERT INTO Offices(shared, freeSpace, spaceId) VALUES (1,0,4);

/*  POPULATE ASIGNATURAS  */
INSERT INTO subjects(name, acronym, credits, type, year, departamentId)
				VALUES ('Introduccion a la Ingenieria del Software de Sistemas Informaticos', 'IISSI', 6, 'Obligatoria', 2, 1);

INSERT INTO subjects(name, acronym, credits, type, year, departamentId)
				VALUES ('Introduccion a la Matematica Discreta', 'IMD', 6, 'Formación Básica', 1, 2);
				
INSERT INTO subjects(name, acronym, credits, type, year, departamentId)
				VALUES ('Programacion Avanzada II', 'PA II', 6, 'Optativa', 4, 3);

/*  POPULATE ASIGNATURASGRADOS  */
INSERT INTO SubjectsDegrees(subjectId, degreeId) VALUES (1,2);

INSERT INTO SubjectsDegrees(subjectId, degreeId) VALUES (2,3);

INSERT INTO SubjectsDegrees(subjectId, degreeId) VALUES (3,1);

/*  POPULATE GRUPOS  */
INSERT INTO groups(name, YEAR, type, subjectId, classroomId) VALUES ('IS4', 2020, 'Teoria', 1, 2);

INSERT INTO groups(name, YEAR, type, subjectId, classroomId) VALUES ('L8', 2018, 'Laboratorio', 2, 2);

INSERT INTO groups(name, YEAR, type, subjectId, classroomId) VALUES ('34', 2012, 'Teoria', 3, 1);

/*  POPULATE ALUMNOSGRUPOS  */
INSERT INTO StudentsGroups(studentId, groupId) VALUES (1,2);

INSERT INTO StudentsGroups(studentId, groupId) VALUES (1,1);

INSERT INTO StudentsGroups(studentId, groupId) VALUES (3,3);

/*  POPULATE PROFESORES  */
INSERT INTO teachers(dni, name, surname, birthDate, email, category, departamentId, officeId) VALUES ('45186259P', 'Susana','Sanchez Sanchez', '1865-04-12', 'ejemplo23@gmail.com', 'Profesor Ayudante Doctor', 1, 2);

INSERT INTO teachers(dni, name, surname, birthDate, email, category, departamentId, officeId) VALUES ('87984543V', 'Emilio', 'Gutierrez Monzon', '1993-12-05', 'email77"hotmail.com', 'Profesor', 2, 1);

INSERT INTO teachers(dni, name, surname, birthDate, email, category, departamentId, officeId) VALUES ('08636372S', 'Ana Maria', 'Arnelas Perez', '1982-01-31', 'emailoriginal123"emailoriginal.com', 'Titular de Universidad', 1, 2);

/*  POPULATE tutorials  */
INSERT INTO tutorials(date, dayWeek, startTime, endTime, teacherId, studentId) VALUES ('2020-02-15','Lunes','12:30:00','12:45:00',1,3);

INSERT INTO tutorials(date, dayWeek, startTime, endTime, teacherId, studentId) VALUES ('2021-01-09','Jueves','08:15:00','08:30:00',2,1);

INSERT INTO tutorials(date, dayWeek, startTime, endTime, teacherId, studentId) VALUES ('2020-11-21','Viernes','06:00:00','06:15:00',1,1);

/*  POPULATE NOTAS  */
INSERT INTO grades(intValue, gradeCall, honor, studentId, groupId) VALUES (8.5,2,0,1,2);

INSERT INTO grades(intValue, gradeCall, honor, studentId, groupId) VALUES (2.25,1,0,2,2);

INSERT INTO grades(intValue, gradeCall, honor, studentId, groupId) VALUES (9.75,3,1,3,1);

INSERT INTO grades(intValue, gradeCall, honor, studentId, groupId) VALUES (5.5,1,0,1,3);

