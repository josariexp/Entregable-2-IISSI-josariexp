-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.6-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para datos
CREATE DATABASE IF NOT EXISTS `datos` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `datos`;

-- Volcando estructura para tabla datos.classrooms
DROP TABLE IF EXISTS `classrooms`;
CREATE TABLE IF NOT EXISTS `classrooms` (
  `classroomId` int(11) NOT NULL AUTO_INCREMENT,
  `loudSpeaker` tinyint(1) NOT NULL,
  `projector` tinyint(1) NOT NULL,
  `spaceId` int(11) NOT NULL,
  PRIMARY KEY (`classroomId`),
  UNIQUE KEY `spaceId` (`spaceId`),
  CONSTRAINT `classrooms_ibfk_1` FOREIGN KEY (`spaceId`) REFERENCES `spaces` (`spaceId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.classrooms: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
REPLACE INTO `classrooms` (`classroomId`, `loudSpeaker`, `projector`, `spaceId`) VALUES
	(1, 1, 0, 1),
	(2, 1, 1, 3);
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;

-- Volcando estructura para tabla datos.degrees
DROP TABLE IF EXISTS `degrees`;
CREATE TABLE IF NOT EXISTS `degrees` (
  `degreeId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `years` int(11) NOT NULL,
  PRIMARY KEY (`degreeId`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `errorNumAños` CHECK (`years` >= 3 and `years` <= 5)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.degrees: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `degrees` DISABLE KEYS */;
REPLACE INTO `degrees` (`degreeId`, `name`, `years`) VALUES
	(1, 'Ingeniería del Software', 4),
	(2, 'Ingeniería Informática', 3),
	(3, 'Ingeniería de Computadores', 5);
/*!40000 ALTER TABLE `degrees` ENABLE KEYS */;

-- Volcando estructura para tabla datos.departaments
DROP TABLE IF EXISTS `departaments`;
CREATE TABLE IF NOT EXISTS `departaments` (
  `departamentId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`departamentId`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.departaments: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `departaments` DISABLE KEYS */;
REPLACE INTO `departaments` (`departamentId`, `name`) VALUES
	(3, 'Hardware'),
	(1, 'Matemáticas'),
	(2, 'Software');
/*!40000 ALTER TABLE `departaments` ENABLE KEYS */;

-- Volcando estructura para tabla datos.grades
DROP TABLE IF EXISTS `grades`;
CREATE TABLE IF NOT EXISTS `grades` (
  `gradeId` int(11) NOT NULL AUTO_INCREMENT,
  `intvalue` decimal(10,0) NOT NULL,
  `gradeCall` int(11) NOT NULL,
  `honor` tinyint(1) NOT NULL,
  `studentId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`gradeId`),
  KEY `studentId` (`studentId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`studentId`),
  CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.grades: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `grades` DISABLE KEYS */;
REPLACE INTO `grades` (`gradeId`, `intvalue`, `gradeCall`, `honor`, `studentId`, `groupId`) VALUES
	(1, 9, 2, 0, 1, 2),
	(2, 2, 1, 0, 2, 2),
	(3, 10, 3, 1, 3, 1),
	(4, 6, 1, 0, 1, 3);
/*!40000 ALTER TABLE `grades` ENABLE KEYS */;

-- Volcando estructura para tabla datos.groups
DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `year` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `classroomId` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupId`),
  KEY `subjectId` (`subjectId`),
  KEY `classroomId` (`classroomId`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`subjectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`classroomId`) REFERENCES `classrooms` (`classroomId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `errorAño` CHECK (`year` > 0),
  CONSTRAINT `errorTipoGrupo` CHECK (`type` in ('Teoria','Laboratorio'))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.groups: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
REPLACE INTO `groups` (`groupId`, `name`, `year`, `type`, `subjectId`, `classroomId`) VALUES
	(1, 'IS4', 2020, 'Teoria', 1, 2),
	(2, 'L8', 2018, 'Laboratorio', 2, 2),
	(3, '34', 2012, 'Teoria', 3, 1);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;

-- Volcando estructura para tabla datos.offices
DROP TABLE IF EXISTS `offices`;
CREATE TABLE IF NOT EXISTS `offices` (
  `officeId` int(11) NOT NULL AUTO_INCREMENT,
  `shared` tinyint(1) NOT NULL,
  `freeSpace` tinyint(1) NOT NULL,
  `spaceId` int(11) NOT NULL,
  PRIMARY KEY (`officeId`),
  UNIQUE KEY `spaceId` (`spaceId`),
  CONSTRAINT `offices_ibfk_1` FOREIGN KEY (`spaceId`) REFERENCES `spaces` (`spaceId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.offices: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
REPLACE INTO `offices` (`officeId`, `shared`, `freeSpace`, `spaceId`) VALUES
	(1, 1, 1, 2),
	(2, 1, 0, 4);
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;

-- Volcando estructura para tabla datos.spaces
DROP TABLE IF EXISTS `spaces`;
CREATE TABLE IF NOT EXISTS `spaces` (
  `spaceId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `floor` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  PRIMARY KEY (`spaceId`),
  UNIQUE KEY `name` (`name`),
  CONSTRAINT `errorNumPiso` CHECK (`floor` >= 0),
  CONSTRAINT `errorCapacidad` CHECK (`capacity` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.spaces: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `spaces` DISABLE KEYS */;
REPLACE INTO `spaces` (`spaceId`, `name`, `floor`, `capacity`) VALUES
	(1, 'A1.13', 1, 80),
	(2, 'C3.34', 3, 40),
	(3, 'G2.26', 2, 25),
	(4, 'H2.41', 1, 10);
/*!40000 ALTER TABLE `spaces` ENABLE KEYS */;

-- Volcando estructura para tabla datos.students
DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `studentId` int(11) NOT NULL AUTO_INCREMENT,
  `dni` char(9) NOT NULL,
  `name` varchar(40) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `birthDate` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `accesMet` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `metodoAccesoInvalido` CHECK (`accesMet` in ('Selectividad','Ciclo','Mayor','Titulado Extranjero'))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.students: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
REPLACE INTO `students` (`studentId`, `dni`, `name`, `surname`, `birthDate`, `email`, `accesMet`) VALUES
	(1, '12123434A', 'Manolo', 'Gonzalez Jimenez', '1154-05-01', 'emailejemplo', 'Titulado Extranjero'),
	(2, '75397079H', 'Aurelio', 'Santos Navarrete', '1958-03-24', 'emailejemplo232', 'Mayor'),
	(3, '43215432T', 'Sara', 'Herrera Segovia', '1983-09-03', 'emailnoejemplo', 'Selectividad');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;

-- Volcando estructura para tabla datos.studentsgroups
DROP TABLE IF EXISTS `studentsgroups`;
CREATE TABLE IF NOT EXISTS `studentsgroups` (
  `studentGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `studentId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`studentGroupId`),
  KEY `studentId` (`studentId`),
  KEY `groupId` (`groupId`),
  CONSTRAINT `studentsgroups_ibfk_1` FOREIGN KEY (`studentId`) REFERENCES `students` (`studentId`),
  CONSTRAINT `studentsgroups_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.studentsgroups: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `studentsgroups` DISABLE KEYS */;
REPLACE INTO `studentsgroups` (`studentGroupId`, `studentId`, `groupId`) VALUES
	(1, 1, 2),
	(2, 1, 1),
	(3, 3, 3);
/*!40000 ALTER TABLE `studentsgroups` ENABLE KEYS */;

-- Volcando estructura para tabla datos.subjects
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE IF NOT EXISTS `subjects` (
  `subjectId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `acronym` varchar(10) NOT NULL,
  `credits` int(11) NOT NULL,
  `type` varchar(20) NOT NULL,
  `year` int(11) NOT NULL,
  `departamentId` int(11) NOT NULL,
  PRIMARY KEY (`subjectId`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `acronym` (`acronym`),
  KEY `departamentId` (`departamentId`),
  CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`departamentId`) REFERENCES `departaments` (`departamentId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `errorTipoAsignatura` CHECK (`type` in ('Obligatoria','Optativa','Formación Básica')),
  CONSTRAINT `errorCurso` CHECK (`year` > 0 and `year` <= 5),
  CONSTRAINT `errorCreditos` CHECK (`credits` > 0)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.subjects: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
REPLACE INTO `subjects` (`subjectId`, `name`, `acronym`, `credits`, `type`, `year`, `departamentId`) VALUES
	(1, 'Introduccion a la Ingenieria del Software de Sistemas Informaticos', 'IISSI', 6, 'Obligatoria', 2, 1),
	(2, 'Introduccion a la Matematica Discreta', 'IMD', 6, 'Formación Básica', 1, 2),
	(3, 'Programacion Avanzada II', 'PA II', 6, 'Optativa', 4, 3);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;

-- Volcando estructura para tabla datos.subjectsdegrees
DROP TABLE IF EXISTS `subjectsdegrees`;
CREATE TABLE IF NOT EXISTS `subjectsdegrees` (
  `subjectDegreeId` int(11) NOT NULL AUTO_INCREMENT,
  `subjectId` int(11) NOT NULL,
  `degreeId` int(11) NOT NULL,
  PRIMARY KEY (`subjectDegreeId`),
  KEY `subjectId` (`subjectId`),
  KEY `degreeId` (`degreeId`),
  CONSTRAINT `subjectsdegrees_ibfk_1` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`subjectId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `subjectsdegrees_ibfk_2` FOREIGN KEY (`degreeId`) REFERENCES `degrees` (`degreeId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.subjectsdegrees: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `subjectsdegrees` DISABLE KEYS */;
REPLACE INTO `subjectsdegrees` (`subjectDegreeId`, `subjectId`, `degreeId`) VALUES
	(1, 1, 2),
	(2, 2, 3),
	(3, 3, 1);
/*!40000 ALTER TABLE `subjectsdegrees` ENABLE KEYS */;

-- Volcando estructura para tabla datos.teachers
DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `teacherId` int(11) NOT NULL AUTO_INCREMENT,
  `dni` char(9) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `birthDate` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `category` varchar(30) NOT NULL,
  `departamentId` int(11) NOT NULL,
  `officeId` int(11) NOT NULL,
  PRIMARY KEY (`teacherId`),
  UNIQUE KEY `dni` (`dni`),
  UNIQUE KEY `email` (`email`),
  KEY `departamentId` (`departamentId`),
  KEY `officeId` (`officeId`),
  CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`departamentId`) REFERENCES `departaments` (`departamentId`),
  CONSTRAINT `teachers_ibfk_2` FOREIGN KEY (`officeId`) REFERENCES `offices` (`officeId`),
  CONSTRAINT `errorCategoria` CHECK (`category` in ('Profesor','Titular de Universidad','Profesor Contratado Doctor','Profesor Ayudante Doctor'))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.teachers: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
REPLACE INTO `teachers` (`teacherId`, `dni`, `name`, `surname`, `birthDate`, `email`, `category`, `departamentId`, `officeId`) VALUES
	(1, '45186259P', 'Susana', 'Sanchez Sanchez', '1865-04-12', 'ejemplo23@gmail.com', 'Profesor Ayudante Doctor', 1, 2),
	(2, '87984543V', 'Emilio', 'Gutierrez Monzon', '1993-12-05', 'email77"hotmail.com', 'Profesor', 2, 1),
	(3, '08636372S', 'Ana Maria', 'Arnelas Perez', '1982-01-31', 'emailoriginal123"emailoriginal.com', 'Titular de Universidad', 1, 2);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;

-- Volcando estructura para tabla datos.tutorials
DROP TABLE IF EXISTS `tutorials`;
CREATE TABLE IF NOT EXISTS `tutorials` (
  `tutorialId` int(11) NOT NULL AUTO_INCREMENT,
  `dayWeek` varchar(15) NOT NULL,
  `DATE` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `teacherId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  PRIMARY KEY (`tutorialId`),
  KEY `teacherId` (`teacherId`),
  KEY `studentId` (`studentId`),
  CONSTRAINT `tutorials_ibfk_1` FOREIGN KEY (`teacherId`) REFERENCES `teachers` (`teacherId`),
  CONSTRAINT `tutorials_ibfk_2` FOREIGN KEY (`studentId`) REFERENCES `students` (`studentId`),
  CONSTRAINT `errorDiaSemana` CHECK (`dayWeek` in ('Lunes','Martes','Miercoles','Jueves','Viernes'))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla datos.tutorials: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `tutorials` DISABLE KEYS */;
REPLACE INTO `tutorials` (`tutorialId`, `dayWeek`, `DATE`, `startTime`, `endTime`, `teacherId`, `studentId`) VALUES
	(1, 'Lunes', '2020-02-15', '12:30:00', '12:45:00', 1, 3),
	(2, 'Jueves', '2021-01-09', '08:15:00', '08:30:00', 2, 1),
	(3, 'Viernes', '2020-11-21', '06:00:00', '06:15:00', 1, 1);
/*!40000 ALTER TABLE `tutorials` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
