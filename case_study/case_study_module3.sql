create database furama_management;
use furama_management;
create table vi_tri(
ma_vi_tri int primary key auto_increment,
ten_vi_tri varchar(45)
);

create table trinh_do(
ma_trinh_do int primary key auto_increment,
ten_trinh_do varchar(45)
);

create table bo_phan (
ma_bo_phan int primary key auto_increment,
ten_bo_phan varchar(45)
);

create table nhan_vien(
ma_nhan_vien int primary key auto_increment,
ho_ten varchar(45) not null,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong double not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int not null,
foreign key(ma_vi_tri) references vi_tri(ma_vi_tri),
ma_trinh_do int not null,
foreign key(ma_trinh_do) references trinh_do(ma_trinh_do),
ma_bo_phan int not null, 
foreign key(ma_bo_phan) references bo_phan(ma_bo_phan)
);

create table loai_khach (
ma_loai_khach int primary key auto_increment,
ten_loai_khach varchar(45)
);

create table khach_hang (
ma_khach_hang int primary key auto_increment,
ma_loai_khach int not null,
foreign key (ma_loai_khach) references loai_khach(ma_loai_khach),
ho_ten varchar(45) not null,
ngay_sinh date not null,
gioi_tinh bit(1) not null,
so_cmnd varchar(45) not null,
so_dien_thoai varchar(45) not null,
email varchar(45),
dia_chi varchar(45)
);

create table kieu_thue (
ma_kieu_thue int primary key auto_increment,
ten_kieu_thue varchar(45)
);

create table loai_dich_vu (
ma_loai_dich_vu int primary key auto_increment,
ten_loai_dich_vu varchar(45)
);

create table dich_vu (
ma_dich_vu int primary key auto_increment,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
ma_kieu_thue int not null,
foreign key (ma_kieu_thue) references kieu_thue(ma_kieu_thue),
ma_loai_dich_vu int not null,
foreign key (ma_loai_dich_vu) references loai_dich_vu(ma_loai_dich_vu),
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int
);

create table hop_dong (
ma_hop_dong int primary key auto_increment,
ngay_lam_hop_dong datetime not null,
ngay_ket_thuc datetime not null,
tien_dat_coc double not null,
ma_nhan_vien int not null,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien),
ma_khach_hang int,
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
ma_dich_vu int not null,
foreign key (ma_dich_vu) references dich_vu(ma_dich_vu)
);

create table dich_vu_di_kem (
ma_dich_vu_di_kem int primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia double not null,
don_vi varchar(45) not null,
trang_thai varchar(45)
);

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int primary key auto_increment,
ma_hop_dong int not null,
foreign key (ma_hop_dong) references hop_dong(ma_hop_dong),
ma_dich_vu_di_kem int not null,
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem),
so_luong int
);

insert into vi_tri(ten_vi_tri)
value("Quản lý"),("Nhân viên");

insert into trinh_do(ten_trinh_do)
values ("Trung cấp"),("Cao đẳng"),("Đại học"),("Sau đại học");

insert into bo_phan(ten_bo_phan)
values("Sale - Marketing"),("Hành Chính"),("Phục vụ"),("Quản lý");

insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
value("Nguyễn Văn An", '1970-11-07', "456231786", 10000000, "0901234121", "annguyen@gmail.com", "295 Nguyễn Tất Thành, Đà Nẵng", 1, 3, 1),
("Lê Văn Bình", '1997-04-09',"654231234", 7000000, "0934212314", "binhlv@gmail.com", "22 Yên Bái, Đà Nẵng",1, 2, 2),
("Hồ Thị Yến", '1995-12-12', "999231723", 14000000, "0412352315", "thiyen@gmail.com", "K234/11 Điện Biên Phủ, Gia Lai", 1, 3, 2),
("Võ Công Toản", '1980-04-04', "123231365", 17000000, "0374443232", "toan0404@gmail.com", "77 Hoàng Diệu, Quảng Trị", 1, 4, 4),
("Nguyễn Bỉnh Phát", '1999-12-09', "454363232", 6000000, "0902341231", "phatphat@gmail.com", "43 Yên Bái, Đà Nẵng", 2, 1, 1),
("Khúc Nguyễn An Nghi", '2000-11-08', "964542311", 7000000, "0978653213", "annghi20@gmail.com", "294 Nguyễn Tất Thành, Đà Nẵng", 2, 2, 3),
("Nguyễn Hữu Hà", '1993-01-01', "534323231", 8000000, "0941234553", "nhh0101@gmail.com", "4 Nguyễn Chí Thanh, Huế", 2, 3, 2),
("Nguyễn Hà Đông", '1989-09-03', "234414123", 9000000, "0642123111", "donghanguyen@gmail.com", "111 Hùng Vương, Hà Nội", 2, 4, 4),
("Tòng Hoang", '1982-09-03', "256781231", 6000000, "0245144444", "hoangtong@gmail.com", "213 Hàm Nghi, Đà Nẵng", 2, 4, 4),
("Nguyễn Công Đạo", '1994-01-08', "755434343", 8000000, "0988767111", "nguyencongdao12@gmail.com", "6 Hoà Khánh, Đồng Nai", 2, 3, 2);

insert into loai_khach(ten_loai_khach)
value("Diamond"),("Platinum"),("Gold"),("Silver"),("Member");

insert into khach_hang(ma_loai_khach,ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
value(5, "Nguyễn Thị Hào", '1970-11-07', 0, "643431213", "0945423362", "thihao07@gmail.com", "23 Nguyễn Hoàng, Đà Nẵng"),
(3, "Phạm Xuân Diệu", '1992-08-08', 1, "865342123", "0954333333", "xuandieu92@gmail.com", "K77/22 Thái Phiên, Quảng Trị"),
(1, "Trương Đình Nghệ", '1990-02-27', 1, "488645199", "0373213122",	"nghenhan2702@gmail.com", "K323/12 Ông Ích Khiêm, Vinh"),
(1, "Dương Văn Quan", '1981-07-08', 1, "543432111", "0490039241", "duongquan@gmail.com", "K453/12 Lê Lợi, Đà Nẵng"),
(4, "Hoàng Trần Nhi Nhi", '1995-12-09', 0, "795453345", "0312345678", "nhinhi123@gmail.comom", "224 Lý Thái Tổ, Gia Lai"),
(4, "Tôn Nữ Mộc Châu", '2005-12-06', 0, "732434215", "0988888844", "tonnuchau@gmail.com", "37 Yên Thế, Đà Nẵng"),
(1, "Nguyễn Mỹ Kim", '1984-04-08', 0, "856453123", "0912345698", "kimcuong84@gmail.com", "K123/45 Lê Lợi, Hồ Chí Minh"),
(3, "Nguyễn Thị Hào", '1999-04-08', 0, "965656433", "0763212345", "haohao99@gmail.com", "55 Nguyễn Văn Linh, Kon Tum"),
(1, "Trần Đại Danh", '1994-07-01', 1, "432341235", "0643343433", "danhhai99@gmail.com", "24 Lý Thường Kiệt, Quảng Ngãi"),
(2, "Nguyễn Tâm Đắc", '1989-07-01', 1, "344343432", "0987654321", "dactam@gmail.com", "22 Ngô Quyền, Đà Nẵng");

insert into kieu_thue(ten_kieu_thue)
value("year"),("month"),("day"),("hour");

insert into loai_dich_vu(ten_loai_dich_vu)
value("Villa"), ("House"), ("Room");

insert into dich_vu(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, ma_kieu_thue, ma_loai_dich_vu)
value("Villa Beach Front", 25000, 10000000, 10, "VIP", "Có hồ bơi", 500, 4, 3, 1),
 ("House Princess 01", 14000, 5000000, 7, "VIP", "Có thêm bếp nướng", null, 3, 2, 2),
 ("Room Twin 01", 5000, 1000000, 2, "NORMAL", "Có tivi", null, null, 4, 3),
 ("Villa No Beach Front", 22000, 9000000, 8, "NORMAL", "Có hồ bơi", 300, 3, 3, 1),
 ("House Princess 02", 10000, 400000, 5, "NORMAL","Có thêm bếp nướng", null, 2, 3, 2),
 ("Room Twin 02", 3000, 900000, 2, "NORMAL", "Có tivi", null, null, 4, 3);
 
 insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi, trang_thai)
value("Karaoke", 10000, "giờ", "tiện nghi, hiện tại"),
("Thuê xe máy", 10000, "chiếc", "hỏng 1 xe"),
("Thuê xe đạp", 20000, "chiếc", "tốt"),
("Buffet buổi sáng", 15000, "suất", "đầy đủ đồ ăn, tráng miệng"),
("TBuffet buổi trưa", 90000, "suất", "đầy đủ đồ ăn, tráng miệng"),
("Buffet buổi tối", 16000, "suất", "đầy đủ đồ ăn, tráng miệng");

insert into hop_dong(ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
value('2020-12-08', '2020-12-08', 0, 3, 1, 3),
('2020-07-14', '2020-07-21', 200000, 7, 3, 1),
('2021-03-15', '2021-03-17', 50000, 3, 4, 2),
('2021-01-14', '2021-01-18', 100000, 7, 5, 5),
('2021-07-14', '2021-07-15', 0, 7, 2, 6),
('2021-06-01', '2021-06-03', 0, 7, 7, 6),
('2021-09-02', '2021-09-05', 100000, 7, 4, 4),
('2021-06-17', '2021-06-18', 150000, 3, 4, 1),
('2020-11-19', '2020-11-19', 0, 3, 4, 3),
('2021-04-12', '2021-04-14', 0, 10, 3, 5),
('2021-04-25', '2021-04-25', 0, 2, 2, 1),
('2021-05-25', '2021-05-27', 0, 7, 10, 1);

insert into hop_dong_chi_tiet(so_luong, ma_hop_dong, ma_dich_vu_di_kem)
value(5, 2, 4),
(8, 2, 5),
(15, 2, 6),
(1, 3, 1),
(11, 3, 2),
(1, 1, 3),
(2, 1, 2),
(2, 12, 2);

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select *
from nhan_vien 
where ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%' and (char_length(ho_ten) <= 15);

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

select *
from khach_hang
where (datediff(now(), ngay_sinh) >= 18*365 and datediff(now(), ngay_sinh) <= 50*365) and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');

-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--  Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select kh.ma_khach_hang, kh.ho_ten, count(hd.ma_hop_dong) as "số lần đặt phòng"
from khach_hang kh
join hop_dong hd 
on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk
on lk.ma_loai_khach = kh.ma_loai_khach
where lk.ten_loai_khach = "Diamond"
group by kh.ma_khach_hang
order by count(hd.ma_hop_dong);

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet)
--  cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, 
dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
ifnull(dv.chi_phi_thue + ifnull(sum(hdct.so_luong * dvdk.gia), 0), 0) as total
from khach_hang kh
join loai_khach lk 
on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd 
on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv 
on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk 
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by kh.ma_khach_hang, hd.ma_hop_dong
order by kh.ma_khach_hang;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ 
-- chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
from dich_vu
left join loai_dich_vu
on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where dich_vu.ma_dich_vu not in (
	select hop_dong.ma_dich_vu from hop_dong
	where quarter(ngay_lam_hop_dong) = 1 and year(ngay_lam_hop_dong) = 2021
    )
order by dien_tich desc;    

-- 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue,
--  ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.so_nguoi_toi_da, 
dich_vu.chi_phi_thue
from dich_vu
join loai_dich_vu
on dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
where dich_vu.ma_dich_vu not in (
	select hop_dong.ma_dich_vu from hop_dong
    where year(ngay_lam_hop_dong) = 2021
);

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.

-- Cách 1:
select ho_ten
from khach_hang
union
select ho_ten
from khach_hang;

-- Cách 2:
select ho_ten
from khach_hang
group by ho_ten;

-- Cách 3:
select distinct ho_ten
from khach_hang;

-- 9.	Thực hiện thống kê doanh thu theo tháng, 
-- nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(ngay_lam_hop_dong) thang, count(ma_hop_dong) so_luong_khach_hang
from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong);

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
--  Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, ifnull(sum(hdct.so_luong), 0) so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct
on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong;

-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach
--  là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

update dich_vu_di_kem
set ten_dich_vu_di_kem = "Buffet buổi trưa"
where ma_dich_vu_di_kem = 5;

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from khach_hang kh
join loai_khach lk
on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd
on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct
on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi like "%Vinh" or kh.dia_chi like "%Quảng Ngãi");

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
--  ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem),tien_dat_coc
--  của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong, nv.ho_ten ho_ten_nhan_vien, kh.ho_ten ho_ten_khach_hang, kh.so_dien_thoai sdt_khach_hang, dv.ma_dich_vu, dv.ten_dich_vu,
ifnull(sum(hdct.so_luong), 0) so_luong_dich_vu_di_kem, hd.tien_dat_coc
from hop_dong hd
left join khach_hang kh
on hd.ma_khach_hang = kh.ma_khach_hang
left join hop_dong_chi_tiet hdct
on hd.ma_hop_dong = hdct.ma_hop_dong_chi_tiet
left join nhan_vien nv
on hd.ma_nhan_vien = nv.ma_nhan_vien
join dich_vu dv
on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ma_dich_vu in (
	select ma_dich_vu 
    from hop_dong 
    where quarter(ngay_lam_hop_dong) = 4 and year(ngay_lam_hop_dong) = 2020 
	and ma_dich_vu not in (
		select ma_dich_vu
		from hop_dong
		where (month(ngay_lam_hop_dong) between 1 and 6) and year(ngay_lam_hop_dong) = 2021 
    )
)
group by hd.ma_hop_dong;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
create view so_luong_dich_vu_di_kem as
select dvdk.ma_dich_vu_di_kem ma_dvdk, dvdk.ten_dich_vu_di_kem ten_dvdk, sum(hdct.so_luong) so_luong
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem;

select *
from so_luong_dich_vu_di_kem
where so_luong = (
	select max(so_luong)
	from so_luong_dich_vu_di_kem);
    
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
--  Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong ma_hd, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem ten_dvdk, count(hdct.ma_dich_vu_di_kem) 
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct
on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd
on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu dv
on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv
on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
where hdct.ma_dich_vu_di_kem in (
select ma_dich_vu_di_kem
from hop_dong_chi_tiet 
group by ma_dich_vu_di_kem
having count(ma_dich_vu_di_kem) = 1
)
group by hdct.ma_hop_dong_chi_tiet;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, 
-- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
join trinh_do td
on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp
on bp.ma_bo_phan = nv.ma_bo_phan
join hop_dong hd
on hd.ma_nhan_vien = nv.ma_nhan_vien
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <= 3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

set sql_safe_updates = 0;

alter table nhan_vien
add is_delete tinyint(1) default "1";

update nhan_vien
set is_delete = 0
where ma_nhan_vien not in (
	select hd.ma_nhan_vien
	from hop_dong hd
    where year(hd.ngay_lam_hop_dong) between 2019 and 2021
);
set sql_safe_updates = 1;
-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
set sql_safe_updates = 0;

create view thanh_toan_view(ma_loai_khach, total) as
select lk.ma_loai_khach,
sum(ifnull(dv.chi_phi_thue + ifnull(hdct.so_luong * dvdk.gia, 0), 0)) as total
from khach_hang kh
join loai_khach lk 
on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd 
on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv 
on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct
on hdct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dvdk 
on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong) = 2021
group by kh.ma_loai_khach, hd.ma_hop_dong
order by kh.ma_khach_hang;

update khach_hang
set ma_loai_khach = 1
where 
khach_hang.ma_khach_hang in (
select * from (
	select kh.ma_khach_hang
    from loai_khach lk
    join khach_hang kh
    on kh.ma_loai_khach = lk.ma_loai_khach
    join hop_dong hd
    on hd.ma_khach_hang = kh.ma_khach_hang
    where lk.ten_loai_khach = "Platinum" and 
		lk.ma_loai_khach in (
		select ma_loai_khach
		from thanh_toan_view
		where total > 10000000)
    ) as tb
);
set sql_safe_updates = 1;
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
set sql_safe_updates = 0;

alter table khach_hang
add is_delete tinyint(1) default "1";

update khach_hang
set is_delete = 0
where ma_khach_hang in (
	select hd.ma_khach_hang
	from hop_dong hd
	where year(ngay_lam_hop_dong) < 2021
);

set sql_safe_updates = 1;

select *
from khach_hang
where is_delete = 0;

-- CÁCH HƠI LẦYYYY
-- set foreign_key_checks = 0;
-- delete from khach_hang
-- where ma_khach_hang in (
-- select * from (
-- 	select kh.ma_khach_hang
-- 	from khach_hang kh
-- 	join hop_dong hd
-- 	on kh.ma_khach_hang = hd.ma_khach_hang
-- 	where year(hd.ngay_lam_hop_dong) = 2020
--     ) as tb
-- );
-- set foreign_key_checks = 1;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
set sql_safe_updates = 0;

update dich_vu_di_kem
set gia = gia * 2
where ma_dich_vu_di_kem in (
select * from (
	select dvdk.ma_dich_vu_di_kem
	from hop_dong_chi_tiet hdct
	join dich_vu_di_kem dvdk
	on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
	join hop_dong hd
	on hd.ma_hop_dong = hdct.ma_hop_dong
	where hdct.so_luong > 10 and year(ngay_lam_hop_dong) = 2020) as tb
);

set sql_safe_updates = 1;
-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select nv.ma_nhan_vien id , nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv
union all
select kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from khach_hang kh;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure xoa_khach_hang(ma_khach_hang_xoa int)
begin
	update khach_hang
    set is_delete = 0
    where ma_khach_hang = ma_khach_hang_xoa;
end
// delimiter ;

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong 
-- với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.  

delimiter //
create procedure sp_them_moi_hop_dong (hd_id int, hd_ngay_lam_hop_dong datetime, hd_ngay_ket_thuc datetime,
									   hd_tien_dat_coc double, hd_ma_nhan_vien int, hd_ma_khach_hang int, hd_ma_dich_vu int)
begin
if hd_id in (select ma_hop_dong from hop_dong) then 
	signal sqlstate '45000'
	set message_text = 'Mã hợp đồng này đã tồn tại';
end if;   
if hd_ma_nhan_vien not in (select ma_nhan_vien from nhan_vien where is_delete = 1) then 
	signal sqlstate '45000'
	set message_text = 'Mã nhân viên này không tồn tại';
end if;
if hd_ma_khach_hang not in (select ma_khach_hang from khach_hang where is_delete = 1) then
	signal sqlstate '45000'
	set message_text = 'Mã khách hàng này không tồn tại';
end if;    
if hd_ma_dich_vu not in (select ma_dich_vu from dich_vu) then
	signal sqlstate '45000'
	set message_text = 'Mã dịch vụ này không tồn tại';
end if;    
insert into hop_dong (ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
value (hd_id, hd_ngay_lam_hop_dong, hd_ngay_ket_thuc, hd_tien_dat_coc, hd_ma_nhan_vien, hd_ma_khach_hang, hd_ma_dich_vu);
end //
delimiter ;  

-- call sp_them_moi_hop_dong (16, "2021-12-12", "2021-12-20", 20000, 2, 99, 1);

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại
--  có trong bảng hop_dong ra giao diện console của database.
alter table hop_dong
add is_delete tinyint(1) default 1;

create table delete_history(tong_so_luong_ban_ghi_con_lai int);

delimiter //
create trigger tr_xoa_hop_dong
after update on hop_dong
for each row
begin
declare tong_so_luong int;
(select count(is_delete) from hop_dong where is_delete = 1) into tong_so_luong;
insert into delete_history(tong_so_luong_ban_ghi_con_lai)
value (tong_so_luong);
end //
delimiter ;

-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng,
--  cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: 
--  Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. 
--  Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo 
--  “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.

-- delimiter //
-- create trigger tr_cap_nhap_hop_dong
-- after update on hop_dong
-- for each row
-- begin
-- declare so_ngay int;
-- set so_ngay = (select day(ngay_ket_thuc) - day(ngay_lam_hop_dong) from hop_dong);
-- if so_ngay < 2 then 
-- signal sqlstate '45000'
-- set message_text = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất 2 ngày';
-- end if;
-- end //
-- delimiter ;
-- drop trigger tr_cap_nhap_hop_dong;

-- set sql_safe_updates = 0;

-- update hop_dong
-- set ngay_ket_thuc = '20201214'
-- where ma_hop_dong in (select ma_hop_dong from hop_dong);

-- 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.

delimiter //
create function func_dem_dich_vu()
returns int
deterministic
begin
	declare result int;
    select count(*) from
    (select hd.ma_dich_vu
	from dich_vu dv
	join hop_dong hd
	on hd.ma_dich_vu = dv.ma_dich_vu
	left join hop_dong_chi_tiet hdct
	on hdct.ma_hop_dong = hd.ma_hop_dong
	left join dich_vu_di_kem dvdk 
	on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
	group by hd.ma_dich_vu
	having sum(ifnull(dv.chi_phi_thue + ifnull(hdct.so_luong * dvdk.gia, 0), 0)) > 2000000) as tb into result;
    return result;
end //    
delimiter ;
select func_dem_dich_vu();

-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: 
-- Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ
--  (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). 
--  Mã của khách hàng được truyền vào như là 1 tham số của function này.

delimiter //
create function func_tinh_thoi_gian_hop_dong(f_ma_khach_hang int)
returns int
deterministic
begin
	declare result int;
    set result = (
    select day(hd.ngay_ket_thuc) - day(hd.ngay_lam_hop_dong) as thoi_gian_dai_nhat
    from khach_hang kh
    join hop_dong hd
    on kh.ma_khach_hang = hd.ma_khach_hang
    join dich_vu dv
	on dv.ma_dich_vu = hd.ma_dich_vu
    where kh.ma_khach_hang = f_ma_khach_hang
	order by day (hd.ngay_ket_thuc) - day(hd.ngay_lam_hop_dong) desc
    limit 1);
    return result;
end //    
delimiter ;

select func_tinh_thoi_gian_hop_dong(5);

-- 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê bởi khách hàng
--  với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó 
--  (tức là xóa các bảng ghi trong bảng dich_vu) và xóa những hop_dong sử dụng dịch vụ liên quan
--  (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.

