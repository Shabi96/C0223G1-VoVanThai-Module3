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
mo_ta_tien_nghi_khac varbinary(45),
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
ma_khach_hang int not null,
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
value("Lễ tân"),("Phục vụ"),("Chuyên viên"),("Giám sát"),("Quản lý"),("Giám đốc");

insert into trinh_do(ten_trinh_do)
values ("Trung cấp"),("Cao đẳng"),("Đại học"),("Sau đại học");

insert into bo_phan(ten_bo_phan)
values("Sale - Marketing"),("Hành Chính"),("Phục vụ"),("Quản lý");

insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
value("Nguyễn Tuấn Kiệt", 19960101, "0123456789", 1000, "0987654321", "kiet@gmail.com", "Gia Lai"),
("Lê Văn Hưng", 19980401, "0123456789", 1000, "0987654321", "hung@gmail.com", "Đà Nẵng"),
("Lê Thị Yến Hoa", 20000101, "0123456789", 1000, "0987654321", "hoa@gmail.com", "Quảng Nam"),
("Đặng Tuấn Vũ", 19990101, "0123456789", 1000, "0987654321", "vu@gmail.com", "Quảng Nam"),
("Võ Văn Tuấn", 19970201, "0123456789", 1000, "0987654321", "tuan@gmail.com", "Quảng Trị");

insert into khach_hang(ma_loai_khach,ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
value(55,"Nguyễn Long Vũ", 19970303, 1, 123456789, 0987789987, "lvu@gmail.com", "Đà Nẵng"),
(66,"Nguyễn Đức Tính", 19970809, 1, 123456789, 0987789987, "tinh@gmail.com", "Quảng Ngãi"),
(77,"Mai Phước Tài", 20010303, 1, 123456789, 0987789987, "tai@gmail.com", "Huế"),
(88,"Phạm Công Nam", 19970303, 1, 123456789, 0987789987, "nam@gmail.com", "Nghệ An"),
(99,"Trần Đình Ngọc Sang", 19970303, 1, 123456789, 0987789987, "sang@gmail.com", "Đà Nẵng");

insert into loai_khach(ten_loai_khach)
value("Diamond"),("Platinum"),("Gold"),("Silver"),("Member");

insert into dich_vu(ten_dich_vu, chi_phi_thue)
value("Villa", 500), ("House", 300), ("Room", 150);

insert into dich_vu_di_kem(ten_dich_vu_di_kem, gia, don_vi)
value("Massage", 10, 1),
("Karaoke", 15, 1),
("Thức ăn", 5, 1),
("Nước uống", 3, 1),
("Thuê xe tham quan Resort", 10, 1);
