USE furama_data;

-- Task 2: Hiển thị thông tin của tất cả nhân viên có trong hệ thống 
-- có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

SELECT * FROM nhanvien
WHERE (hoten LIKE ('H%')
	OR hoten LIKE ('T%')
	OR hoten LIKE ('K%'))
    AND character_length(hoten) <= 15;
    
-- Task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT * FROM khachhang
WHERE round(datediff(curdate(), ngaysinh)/365, 0) BETWEEN 18 AND 50
AND diachi LIKE ('%Đà Nẵng') 
OR diachi LIKE ('%Quảng Trị');

-- Task 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT kh.makhachhang,kh.hoten, count(makh) as so_lan_dat 
FROM khachhang kh JOIN  hopdong hd
ON kh.makhachhang =  hd.makh
WHERE kh.malk = 1
GROUP BY  makh
ORDER BY so_lan_dat;

-- Task 5: Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá,
-- Với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT kh.makhachhang, kh.hoten, lk.tenloaikhach, hd.mahopdong,
dv.tendichvu, hd.ngaylamhopdong, hd.ngayketthuc,
sum(dv.chiphithue + hdct.soluong*dvdk.gia) AS tong_tien
FROM khachhang kh
LEFT JOIN loaikhach lk ON kh.malk = lk.maloaikhach
LEFT JOIN hopdong hd ON kh.makhachhang = hd.makh
LEFT JOIN dichvu dv ON hd.madv = dv.madichvu
LEFT JOIN hopdongchitiet hdct ON hd.mahopdong = hdct.mahd
LEFT JOIN dichvudikem dvdk ON hdct.madvdk = dvdk.madichvudikem
GROUP BY makhachhang;

-- Task 6: Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt 
-- từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3)002E.

SELECT dv.madichvu, dv.tendichvu, dv.dientich, dv.chiphithue, ldv.tenloaidichvu
FROM dichvu dv
JOIN loaidichvu ldv ON dv.maldv = ldv.maloaidichvu
JOIN hopdong hd ON dv.madichvu = hd.madv
WHERE dv.madichvu NOT IN (SELECT hd.madv FROM hopdong hd WHERE (year(ngaylamhopdong) = 2021) 
AND (month(ngaylamhopdong) IN (01,02,03)))
GROUP BY madichvu
ORDER BY dientich DESC;

-- Task 7: Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT dv.madichvu, dv.tendichvu, dv.dientich, dv.songuoitoida, dv.chiphithue, ldv.tenloaidichvu
FROM dichvu dv
JOIN loaidichvu ldv ON dv.maldv = ldv.maloaidichvu
JOIN hopdong hd ON dv.madichvu = hd.madv
WHERE dv.madichvu IN (SELECT hd.madv FROM hopdong hd WHERE (year(ngaylamhopdong) = 2020))
AND dv.madichvu NOT IN (SELECT hd.madv FROM hopdong hd WHERE (year(ngaylamhopdong) = 2021));

-- Task 8: Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.

SELECT DISTINCT kh.hoten
FROM khachhang kh
GROUP BY hoten;

-- Task 9: Thực hiện thống kê doanh thu theo tháng nghĩa là tương ứng với mỗi tháng
-- trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT month(ngaylamhopdong) AS "Thang", sum(dv.chiphithue + hdct.soluong*dvdk.gia)
AS "Tong tien", count(hd.makh) AS "So khach thue dich vu"
FROM hopdong hd
JOIN dichvu dv ON hd.madv = dv.madichvu
JOIN hopdongchitiet hdct ON hd.mahopdong = hdct.mahd
JOIN dichvudikem dvdk ON hdct.madvdk = dvdk.madichvudikem
WHERE year(ngaylamhopdong) = 2021
GROUP BY month(ngaylamhopdong);

-- Task 10: Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong,
-- ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT hopdong.mahopdong, ngaylamhopdong, ngayketthuc, tiendatcoc, sum(soluong) AS so_luong_dich_vu_di_kem
FROM hopdong
JOIN hopdongchitiet ON hopdong.mahopdong = hopdongchitiet.mahd
GROUP BY mahopdong;

-- Task 11: Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là
-- “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT dvdk.*
FROM khachhang kh JOIN loaikhach lk ON kh.MaLK = lk.MaLoaiKhach
JOIN hopdong hd ON hd.MaKH = kh.MaKhachHang
JOIN hopdongchitiet hdct ON hdct.MaHD = hd.MaHopDong
JOIN dichvudikem dvdk ON dvdk.MaDichVuDiKem = hdct.MaDVDK
WHERE lk.TenLoaiKhach = "Diamond"
AND kh.DiaChi LIKE '%Vinh'
OR kh.DiaChi = "%Quảng Ngãi"
GROUP BY MaDichVuDiKem; 

-- Task 12: Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng)
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT hd.mahopdong, nv.hoten, kh.hoten, kh.sodienthoai, dv.tendichvu, hd.tiendatcoc, sum(soluong) AS so_luong_dich_vu_di_kem 
FROM nhanvien nv JOIN hopdong hd ON nv.manhanvien = hd.manv
JOIN khachhang kh ON kh.makhachhang = hd.makh
JOIN hopdongchitiet hdct ON hdct.mahd = hd.mahopdong
JOIN dichvu dv ON dv.madichvu = hd.madv
WHERE (year(hd.ngaylamhopdong) = 2020 AND month(hd.ngaylamhopdong) BETWEEN 10 AND 12)
GROUP BY mahopdong;

-- Task 13: Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

SELECT dvdk.*, sum(hdct.soluong) as so_luong_dich_vu_di_kem
FROM dichvudikem dvdk JOIN hopdongchitiet hdct
ON dvdk.madichvudikem = hdct.madvdk
GROUP BY madichvudikem
HAVING sum(hdct.soluong) >= ALL(SELECT  sum(hdct.soluong) as so_luong_dich_vu_di_kem
FROM dichvudikem dvdk JOIN hopdongchitiet hdct
ON dvdk.madichvudikem = hdct.madvdk
GROUP BY madichvudikem);

-- Task 14: 

SELECT dvdk.*, count(dvdk.madichvudikem) as so_luong_dich_vu_di_kem
FROM dichvudikem as dvdk 
GROUP BY madichvudikem
HAVING count(dvdk.madichvudikem) <= ALL(
SELECT count(dvdk.madichvudikem) as so_luong_dich_vu_di_kem
FROM dichvudikem as dvdk
GROUP BY madichvudikem);

-- Task 15: Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien,
-- ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

SELECT nv.manhanvien, hoten, sodienthoai, diachi, td.tentrinhdo, bp.tenbophan
FROM nhanvien nv JOIN trinhdo td ON nv.matd = td.matrinhdo
JOIN bophan bp ON bp.mabophan = nv.mabp
JOIN hopdong hd on hd.manv = nv.manhanvien
WHERE (hd.ngaylamhopdong BETWEEN "2020-01-01" AND "2021-12-31")
GROUP BY manhanvien
HAVING count(hd.mahopdong) <= 3;

-- Task 16: Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
-- Thay SELECT =  DELETE
SELECT nv.manhanvien, hoten FROM nhanvien nv 
WHERE nv.manhanvien <> ALL(SELECT hd.manv FROM hopdong hd 
WHERE year(ngaylamhopdong) BETWEEN 2019 AND 2021);

-- Task 17: Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
UPDATE khachhang kh
JOIN hopdong hd ON hd.makh = kh.makhachhang
JOIN hopdongchitiet hdct ON hdct.mahd = hd.mahopdong
JOIN dichvu dv ON dv.madichvu = hd.madv
JOIN dichvudikem dvdk ON dvdk.madichvudikem = hdct.madvdk
SET kh.malk = 2
WHERE kh.malk = 1 AND (dv.chiphithue + (hdct.soluong*dvdk.gia)) > 10000000;

-- Task 18: Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

delete from khachhang kh
where kh.makhachhang in (select makh from hopdong where year(ngaylamhopdong) <= 2021);