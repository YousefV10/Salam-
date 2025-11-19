CREATE DATABASE UniversityDB;




CREATE TABLE Faculties (
    FacultyID INT PRIMARY KEY IDENTITY(1,1),
    FacultyName VARCHAR(100) NOT NULL,
    DeanName VARCHAR(100)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName VARCHAR(100) NOT NULL,
    Credits INT,
    FacultyID INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    FacultyID INT NULL,
    EnrollmentYear INT,
    FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID)
);

CREATE TABLE Grades (
    GradeID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(4,2),
    Semester VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
INSERT INTO Faculties (FacultyName, DeanName) VALUES
('Kompüter Elmləri', 'Dr. Ali Məmmədov'),
('Riyaziyyat', 'Dr. Leyla Quliyeva'),
('Fizika', 'Dr. Elvin Əliyev'),
('Kimya', 'Dr. Aysel Həsənova');

INSERT INTO Students (FirstName, LastName, FacultyID, EnrollmentYear) VALUES
('Kamran', 'Əliyev', 1, 2022),
('Aysel', 'Qasımova', 1, 2023),
('Ramil', 'Məmmədli', 2, 2021),
('Nigar', 'Hüseynova', 3, 2022),
('Emin', 'Səfərov', 4, 2020),
('Orxan', 'Quliyev', NULL, 2023);  

INSERT INTO Courses (CourseName, Credits, FacultyID) VALUES
('Programming 101', 5, 1),
('Algorithms', 6, 1),
('Linear Algebra', 4, 2),
('Quantum Physics', 5, 3),
('Organic Chemistry', 4, 4);

INSERT INTO Grades (StudentID, CourseID, Grade, Semester) VALUES
(1, 1, 85.50, 'Fall'),
(1, 2, 90.00, 'Spring'),
(2, 1, 78.00, 'Fall'),
(3, 3, 88.25, 'Spring'),
(4, 4, 92.40, 'Spring'),
(5, 5, 70.00, 'Fall'),
(3, 1, 81.00, 'Fall');


SELECT 
    s.FirstName,
    s.LastName,
    c.CourseName,
    g.Grade
FROM Grades g
JOIN Students s ON g.StudentID = s.StudentID
JOIN Courses c ON g.CourseID = c.CourseID
WHERE g.Grade > 80
ORDER BY g.Grade DESC;

SELECT *
FROM Students
WHERE EnrollmentYear = 2022 AND FacultyID = 1;

SELECT 
    s.FirstName,
    s.LastName,
    c.CourseName,
    g.Grade,
    f.FacultyName
FROM Grades g
JOIN Students s ON g.StudentID = s.StudentID
JOIN Courses c ON g.CourseID = c.CourseID
JOIN Faculties f ON s.FacultyID = f.FacultyID;

SELECT 
    s.FirstName,
    s.LastName,
    f.FacultyName,
    c.CourseName,
    g.Grade
FROM Students s
LEFT JOIN Faculties f ON s.FacultyID = f.FacultyID
LEFT JOIN Grades g ON s.StudentID = g.StudentID
LEFT JOIN Courses c ON g.CourseID = c.CourseID;

SELECT
    c.CourseName,
    s.FirstName,
    s.LastName,
    g.Grade
FROM Courses c
LEFT JOIN Grades g ON c.CourseID = g.CourseID
LEFT JOIN Students s ON g.StudentID = s.StudentID;






