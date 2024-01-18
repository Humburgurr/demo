Create Database QLHangHoa
Go
Use QLHangHoa
Go
--Drop table KhachHang
--Go
Create Table	KhachHang
(
	MaKH	Int	Identity(1,1),
	HoTen	Nvarchar(50)	Not Null,
	TaiKhoan	Varchar(50)	Unique,
	MatKhau	Nvarchar(MAX)	Not Null,
	Email	Varchar(100)	Unique,
	DiachiKH	Nvarchar(200),
	DienThoaiKH	Varchar(50),
	NgaySinh	Date,
	Constraint	Pk_KhachHang	Primary Key(MaKH)
)
Go
--Drop table DongSP
--Go
Create Table	DongSP
(
	MaD	Int	Identity(1,1),
	TenDong	Nvarchar(50)	Not Null,
	Constraint Pk_DongSP Primary Key(MaD)
)
Go
--Drop table DongPL
--Go
Create table DongPL
(
	MaPL Int Identity(1,1),
	TenPL Nvarchar(100) not null,
	MaD Int,
	Constraint	Pk_PhanLoai Primary Key(MaPL),
	Constraint	Fk_DSP	Foreign	Key(MaD) References	DongSP(MaD),
)
Go
--Drop table SanPham
--Go
Create Table	SanPham
(
	MaSP	Int	Identity(1,1),
	TenSP	Nvarchar(100)	Not Null,
	GiaBan	Decimal(18,0)	Check(GiaBan>=0),
	MoTa	Nvarchar(Max),
	AnhBia	Varchar(255),
	NgayCapNhat	Date,
	SoLuongTon	Int,
	MaD	Int null,
	MaPL Int null,
	Constraint	Pk_SanPham	Primary Key(MaSP),
	Constraint	Fk_DongSP	Foreign	Key(MaD) References	DongSP(MaD),
	Constraint	Fk_DongPL	Foreign Key(MaPL) References	DongPL(MaPL)
)
Go
--Drop table DonDatHang
--Go
Create Table	DonDatHang
(
	SoDH	Int Identity(1,1),
	MaKH	Int,
	NgayDH	Date default GetDate(),
	NgayGiao	Date,
	SDT varchar(50),
	Diachi nvarchar(200),
	TongTien int,
	DaThanhToan	bit default 0, --0: Chưa thanh toán; 1: Đã thanh toán
	TinhTrangGiaoHang	bit default 0, --0:Đang vận chuyển; 1: Đã giao
	Constraint	Pk_DonDatHang	Primary Key(SoDH),
	Constraint	Fk_KhachHang	Foreign	Key(MaKH)	References	KhachHang(MaKH) On Delete Cascade
)
Go
--Drop table ChiTietDatHang
--Go
Create Table	ChiTietDatHang
(
	MaCT	Int Identity,
	SoDH	Int,
	MaSP	Int,
	SoLuong	Int	Check(SoLuong>0),
	DonGia int Check(DonGia>=0),
	Constraint	Pk_ChiTietDatHang	Primary Key(MaCT),
	Constraint	Fk_DonHang	Foreign	Key(SoDH)	References	DonDatHang(SoDH) On Delete Cascade,
	Constraint	Fk_SP	Foreign Key(MaSP)	References	SanPham(MaSP) On Delete Cascade
)
Go

--Thêm dữ liệu:
---Dòng sản phẩm
	Insert into DongSP Values (N' Nước Hoa')
	Insert into DongSP Values (N' Túi sách')
	Insert into DongSP values (N' Đồng hồ')
	Insert into DongSP values (N' Mũ Nón')
	Insert into DongSP values (N' Kính Mắt')
	Insert into DongSP values (N' Phụ Kiện')

--Phân loại dòng
	Insert into DongPL values (N'Nước Hoa Nam Dior', 1)
	Insert into DongPL values (N'Nước Hoa Nam Varsace', 1)
	Insert into DongPL values (N'Nước Hoa Nam Lacoste', 1)
	Insert into DongPL values (N'Nước Hoa Nam Armaf', 1)
	Insert into DongPL values (N'Nước Hoa Nam Chanel', 1)
	Insert into DongPL values (N'Nước Hoa Nam Gucci', 1)
	Insert into DongPL values (N'Túi sách Dior', 2)
	Insert into DongPL values (N'Túi sách Varsace', 2)
	Insert into DongPL values (N'Túi sách Adidas', 2)
	Insert into DongPL values (N'Túi sách Lacoste', 2)
	Insert into DongPL values (N'Túi sách Gucci', 2)
	Insert into DongPL values (N'Túi sách Calvin Klein', 2)
	Insert into DongPL values (N'Đồng Hồ Varsace', 3)
	Insert into DongPL values (N'Đồng Hồ Adidas', 3)
	Insert into DongPL values (N'Đồng Hồ Lacoste', 3)
	Insert into DongPL values (N'Đồng Hồ Gucci', 3)
	Insert into DongPL values (N'Đồng Hồ Calvin Klein', 3)
	Insert into DongPL values (N'Đồng Hồ Burbery', 3)
	Insert into DongPL values (N'Mũ Nón Dior', 4)
	Insert into DongPL values (N'Mũ Nón Varsace ', 4)
	Insert into DongPL values (N'Mũ Nón	MLB', 4)
	Insert into DongPL values (N'Mũ Nón Adidas', 4)
	Insert into DongPL values (N'Mũ Nón lacoste', 4)
	Insert into DongPL values (N'Mũ Nón Gucci', 4)
	Insert into DongPL values (N'Mũ Nón Nike', 4)
	Insert into DongPL values (N'Kính Mắt Dior', 5)
	Insert into DongPL values (N'Kính Mắt Varsace', 5)
	Insert into DongPL values (N'Kính Mắt Lacoste', 5)
	Insert into DongPL values (N'Kính Mắt Gucci', 5)
	Insert into DongPL values (N'Kính Mắt Calvin Klein', 5)
	Insert into DongPL values (N'Kính Mắt YSL', 5)
	Insert into DongPL values (N'Kính Mắt Burberry', 5)
	
---Toy
	Insert into SanPham values (N' Nước Hoa Nam Dior Sauvage Parfum 200ml',3900000, N' ','nuoc-hoa-nam-dior.png','12/15/2023', 7, 1, 1)
	Insert into SanPham values (N' Nước Hoa Nam Dior Homme Bản 2020 EDP Intense 100ml', 2850000, N' ','nuoc-hoa-nam-dior-homme2.png','12/15/2023', 7, 1, 1)
	Insert into SanPham values (N'Nước Hoa Nam Dior Sauvage Parfum 100ml', 2990000, N' ','nuoc-hoa-dior3.png','12/15/2023', 7, 1, 1)
	Insert into SanPham values (N' Nước Hoa Dior Sauvage Eau De Toilette Cho Nam, 100ml', 2500000, N' ','nuoc-hoa-nam-dior3.png','11/15/2023', 7, 1, 1)
	Insert into SanPham values (N' Nước Hoa Nam Versace Eros Man EDT 5ml', 380000, N' ','nuoc-hoa-versace1.png','11/15/2023', 7, 1, 2)
	Insert into SanPham values (N' Nước Hoa Nam Dior Homme EDT 50m', 1950000, N' ','nuoc-hoa-nam-dior4.png','11/15/2023', 7, 1, 1)
	Insert into SanPham values (N' Nước Hoa Nam Versace Versus Blue Jeans 75ml', 2099000, N' ','nuoc-hoa-nam-versace2.png','11/15/2023', 7, 1, 2)
	Insert into SanPham values (N' Nước Hoa Nam Chanel Bleu De Chanel EDP, 100ml', 1090000, N' ','nuoc-hoa-nam-chanel1.png','11/15/2023', 7, 1, 5)

	Insert into SanPham values (N' Túi Đeo Chéo Nam Dior Pouch With Strap Black CD Diamond Canvas Màu Đen', 1050000 ,N' ','tui-deo-cheo-nam-dior1.png','11/15/2023', 10, 2, 7)
	Insert into SanPham values (N' Túi Đeo Chéo Nam Versace Leather Messenger Bag 1002885_1A02187 Màu Đen', 15150000, N' ','tui-deo-cheo-nam-versace1.png','11/15/2023', 10, 2, 8)
	Insert into SanPham values (N' Túi Đeo Chéo Nam Versace Canvas Messenger Bag 10099191A07040_1B00E Màu Đen', 11990000, N' ','tui-deo-cheo-nam-versace-canvas2.png','11/15/2023', 10, 2, 8)
	Insert into SanPham values (N' Túi Tote Nam Adidas Golf Round Bag Cart WK454 Màu Trắng', 1390000, N' ','tui-tote-nam-adidas1.png','11/15/2023', 10, 2, 9)
	Insert into SanPham values (N' Túi Cầm Tay Nam Gucci Supreme Canvas Interlocking GG Pouch Màu Be Nâu', 17750000, N' ','tui-cam-tay-nam-gucci1.png','11/15/2023', 10, 2, 10)

	Insert into SanPham values (N' Túi Tote Nam Adidas Golf WK454 Round Bag Cart Black/White HA3189 Màu Đen ', 1399000, N' ','tui-tote-nam-adidas2.png','11/15/2023', 4, 3, 9)
	Insert into SanPham values (N' Đồng Hồ Nam Versace VFG150016 Màu Đen/Vàng Hồng', 19890000, N' ','dong-ho-nam-versace1.png','11/15/2023', 4, 3, 13)
	Insert into SanPham values (N' Đồng Hồ Nam Adidas Edition Two GB7199 Phối Màu', 6990000, N' ','dong-ho-nam-adidas1.png','11/15/2023', 4, 3, 14)
	Insert into SanPham values (N' Đồng Hồ Nam Versace Dominus VE6H00123 Màu Đen Bạc', 29990000, N' ','dong-ho-nam-versace-dominus.png','11/15/2023', 4, 3, 13)
	   	
	Insert into SanPham values (N' Mũ MLB New York Yankees Heroes Adjustable Cap 3ACP5001N-50GOS Màu Đen', 1250000, N' ','mu-mlb1.png','11/15/2023', 12, 4, 21)
	Insert into SanPham values (N' Mũ MLB Basic Wappen Unstructured Ball Cap Los Angeles Dodgers 3ACP7903N-07IVS Màu Trắng', 1140000, N' ','mu-mlb-basic2.png','11/15/2023', 12, 4, 21)
	Insert into SanPham values (N' Mũ Nam Versace With Medusa Cap ICAP004S Màu Trắng Size 58', 1190000, N' ','mu-nam-versace1.png','11/15/2023', 12, 4, 20)
	Insert into SanPham values (N' Mũ Adidas Relaxed New Prep Hat GB4282 Màu Trắng Xanh', 590000, N' ','mu-adidas1.png','11/15/2023', 12, 4, 22)
	Insert into SanPham values (N' Mũ Versace Jean Couture Logo Cap Màu Trắng', 2190000, N' ','mu-versace-jean2.png','11/15/2023', 12, 4, 20)

	Insert into SanPham values (N' Kính Mát Nam Versace Gunmetal Silver Mirror Sunglasses 2242 1001/6G 3N Màu Xám', 2590000, N' ','kinh-mat-nam-versace1.png','11/15/2023', 12, 5, 27)
	Insert into SanPham values (N' Kính Mát Calvin Klein Mens Sunglasses CK19316S-045 Màu Xanh Green', 1190000, N' ','kinh-mat-calvin-klein1.png','11/15/2023', 12, 5, 30)
	Insert into SanPham values (N' Kính Mát Nam Calvin Klein Grey Square Mens Sunglasses CK20711S 001 55 Màu Đen Xám', 1290000, N' ','kinh-mat-nam-calvin-klein2.png','11/15/2023', 12, 5, 30)
	Insert into SanPham values (N' Kính Mát Calvin Klein Men Sunglasses CK20121S-717 Màu Xanh', 940000, N' ','kinh-mat-calvin-klein3.png','11/15/2023', 12, 5, 30)
	Insert into SanPham values (N' Kính Mắt Cận Nam Burberry Demo Square Mens Eyeglasses BE2353 3001 Màu Đen', 3890000, N' ','kinh-mat-can-nam-burberry1.png','11/15/2023', 12, 5, 32)
	Insert into SanPham values (N' Kính Mát Nam Dior DiorPacific M1U 11A0 Màu Xám', 5390000, N' ','kinh-mat-nam-dior-d.png','11/15/2023', 12, 5, 26)

	Insert into SanPham values (N' Ốp Điện Thoại Adidas Trong Suốt Cho iPhone 2020 6.7 Inch EX7964', 1135000, N' ','op-dien-thoai-adidas-trong-suot-cho-iphone1.png','11/15/2023', 20, 6, null)
	Insert into SanPham values (N' Ốp Điện Thoại Adidas Trefoil Case iPhone 13 Pro Max GA7423 Màu Đen', 1138000, N' ','op-dien-thoai-adidas-trefoil-case-iphone-13-pro-max.png','11/15/2023', 20, 6, null)
	Insert into SanPham values (N' Máy Hút Mụn Đầu Đen, Bã Nhờn Juvera Màu Trắng', 1350000, N' ','may-hut-mun-dau-den-ba-nhon.png','11/15/2023', 20, 6, null)
	Insert into SanPham values (N' Máy Uốn Mi Nhiệt Juvera Màu Trắng', 890000, N' ','may-uon-mi-nhiet-juvera-mau-trang.png','11/15/2023', 20, 6, null)
	Insert into SanPham values (N' Băng Bảo Vệ Bắp Chân Và Mắt Cá Chân Zamst Calf Ankle Sleeve Màu Đen Size LL', 1090000, N' ','calf-ankle-01.png','11/15/2023', 20, 6, null)
	Insert into SanPham values (N' Ốp UNIQ Coehl Magnetic Charging Linear For iPhone 15 series', 590000, N' ','op_uniq_coehl_magnetic_charging_linear_iphone_15.png','11/15/2023', 20, 6, null)
	Insert into SanPham values (N' Đồng hồ thông minh Garmin 265 Music', 11690000, N' ','dong_ho_thong_minh_garmin_265_music.png','11/15/2023', 20, 6, null)
	Insert into SanPham values (N' Cáp sạc USB-C to Lightning Cable 1m FAE', 590000, N' ','cap_sac_usb_c_lightning_cable.png','11/15/2023', 20, 6, null)
	Insert into SanPham values (N' Balo TOMTOC (USA) Premium Urban Business', 1400000, N' ','balo_tomtoc_usa_prenimu_urban_business.png','11/15/2023', 20, 6, null)

--Dữ liệu cập nhật: Tài khoản quản trị
Create table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	Hoten nVarchar(50)
)
Insert into Admin values('adminVan','123456', N' Hoàng Văn')