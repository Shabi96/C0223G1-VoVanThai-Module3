create database quan_ly_internet;

use quan_ly_internet;

create table may_tinh(
	ma_may int primary key auto_increment,
    hang_san_xuat varchar(50),
    vi_tri_dat_may varchar(50)
);

create table loai_khach(
	ma_loai_khach int primary key auto_increment,
    ten_loai_khach varchar(45)
);

create table khach_hang (
	ma_khach_hang int primary key auto_increment,
	cccd varchar(45) unique not null,
    ten_khach_hang varchar(45),
    so_dien_thoai varchar(45),
    email varchar(45),
    ma_loai_khach int,
    foreign key (ma_loai_khach) references loai_khach(ma_loai_khach)
);

create table dich_vu_di_kem(
	ma_dich_vu_di_kem int primary key auto_increment,
    ten_dich_vu_di_kem varchar(45),
    gia double
);

create table hoa_don(
	ma_may int,
    foreign key (ma_may) references may_tinh(ma_may),
	ma_khach_hang int,
    foreign key (ma_khach_hang) references khach_hang(ma_khach_hang),
	thoi_gian_bat_dau datetime,
    thoi_gian_ket_thuc datetime,
    ma_dich_vu_di_kem int,
	foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem(ma_dich_vu_di_kem)
);

