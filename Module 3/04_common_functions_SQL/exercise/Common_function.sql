USE Student_management;
       
-- 1. Hien thi htong tin mon hoc co Credit max
SELECT max(Credit) FROM Subject;

-- 2. Thong tin mon hoc co diem thi lon nhat
SELECT Subject.SubName, mark.Mark from subject
JOIN mark ON mark.SubID = Subject.SubID
WHERE mark.Mark = (SELECT max(Mark) FROM mark);
       
-- 3. Thong tin sinh vien va diem trung binh, DESC
SELECT Student.StudentID, Student.StudentName, avg(mark.Mark)
FROM Student
JOIN mark ON mark.StudentID = Student.StudentID
GROUP BY Student.StudentID, Student.StudentName
ORDER BY avg(mark.Mark) DESC;
       


