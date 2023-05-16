create database change_erd_to_entity_relationship_model;

use change_erd_to_entity_relationship_model;

create table nha_cung_cap(
	ma_nha_cung_cap int primary key auto_increment,
    ten_nha_cung_cap varchar(45) not null,
    dia_chi varchar(45),
    so_dien_thoai varchar(45)
);

create table so_dien_thoai(
	ma_dien_thoai int primary key auto_increment,
    ma_nha_cung_cap int,
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang(
	so_dat_hang int primary key auto_increment,
    ngay_dat_hang date,
    ma_nha_cung_cap int,
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table vat_tu(
	ma_vat_tu int primary key auto_increment,
    ten_vat_tu varchar(45)
);

create table chi_tiet_don_dat_hang(
	ma_vat_tu int,
    so_dat_hang int,
    primary key (ma_vat_tu, so_dat_hang),
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
    foreign key (so_dat_hang) references don_dat_hang(so_dat_hang)
);

create table phieu_nhap(
	so_phieu_nhap int primary key auto_increment,
    ngay_nhap date
);

create table chi_tiet_phieu_nhap(
	don_gia_nhap double not null,
    so_luong_nhap int not null,
    ma_vat_tu int,
    so_phieu_nhap int,
    primary key (ma_vat_tu, so_phieu_nhap),
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
    foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);

create table phieu_xuat(
	so_phieu_xuat int primary key auto_increment,
    ngay_xuat varchar(45)
);

create table chi_tiet_phieu_xuat(
	don_gia_xuat double not null,
    so_luong_xuat int,
    ma_vat_tu int,
    so_phieu_xuat int,
    primary key (ma_vat_tu, so_phieu_xuat),
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
    foreign key (so_phieu_xuat) references phieu_xuat(so_phieu_xuat)
);