USE student_management;

-- 1. Hien thi cac sinh vien co ten bat dau bang chu 'h'
SELECT * from Student 
WHERE StudentName like 'h%';

-- 2.Hien thi thong tin lop hoc co lich hoc vao thang 12
SELECT * from Class
WHERE month(StartDate) = '12';

-- 3.Hien thi tat ca cac mon hoc co credit thuoc (3,5)
SELECT * from subject
WHERE Credit BETWEEN 3 and 5;

-- 4.Thay doi ma lop classID cua sinh vien co ten HUng la 2
UPDATE Student SET ClassID = 2
WHERE (StudentName = 'Hung');	

-- 5.Hien thi thong tin va sap xeptheo diem thi, trung nhau thi tang dan
SELECT S.StudentName, Sub.SubName, M.Mark
from Student S join 
