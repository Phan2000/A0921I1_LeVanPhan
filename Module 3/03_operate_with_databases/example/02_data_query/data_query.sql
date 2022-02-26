USE student_management;

-- 1.Hien thi danh sach tat ca cac sinh vien
SELECT * FROM student;

-- 2.Hien thi danh sach cac hoc vien dang theo hoc
SELECT * FROM Student 
WHERE `Status` = 1;

-- 3.Hien thi danh sach cac mon hoc co thoi gian hoc nho hon 10h
SELECT * FROM `subject`
WHERE Credit < 10;

-- 4.Hien thi danh sach hoc vien lop A1
SELECT s.StudentID, s.StudentName, c.ClassName 
FROM student s JOIN class c
on s.ClassID = c.ClassID
WHERE c.ClassName = 'A1'; 

-- 5.Hien thi diem mon CF cua cac hoc vien
SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S join Mark M on S.StudentId = M.StudentId 
join Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';
