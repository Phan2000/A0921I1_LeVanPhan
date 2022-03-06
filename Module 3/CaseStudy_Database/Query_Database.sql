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
