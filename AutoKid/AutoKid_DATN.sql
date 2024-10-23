create database DATN_AutoKID
go

use DATN_AutoKID
go

-- Bảng chuc_vu
CREATE TABLE chuc_vu (
    id_chuc_vu INT PRIMARY KEY IDENTITY,
    ma_chuc_vu NVARCHAR(50),
    ten_chuc_vu NVARCHAR(100)
);

-- Bảng nhan_vien
CREATE TABLE nhan_vien (
    id_nv INT PRIMARY KEY IDENTITY,
    ma_nv NVARCHAR(100),
    ten_nv NVARCHAR(100),
    gioi_tinh NVARCHAR(10),
    ngay_sinh DATE,
    ngay_lam_viec DATE,
    mat_khau NVARCHAR(255),
    sdt NVARCHAR(20),
    email NVARCHAR(100),
    trang_thai_nv NVARCHAR(20),
    dia_chi TEXT,
    id_chuc_vu INT,
    FOREIGN KEY (id_chuc_vu) REFERENCES chuc_vu(id_chuc_vu)
);

-- Bảng thong_tin_van_chuyen
CREATE TABLE thong_tin_van_chuyen (
    id_ttvc INT PRIMARY KEY IDENTITY,
    ma_ttvc NVARCHAR(50),
    tinh NVARCHAR(50),
    huyen NVARCHAR(50),
    xa NVARCHAR(50),
    dia_chi NVARCHAR(255),
    ten_nguoi_nhan NVARCHAR(100),
    sdt NVARCHAR(20)
);

-- Bảng khach_hang
CREATE TABLE khach_hang (
    id_kh INT PRIMARY KEY IDENTITY,
    ma_kh NVARCHAR(100),
    ten_kh NVARCHAR(100),
    email NVARCHAR(100),
    sdt NVARCHAR(20),
    dia_chi TEXT,
    mat_khau NVARCHAR(255),
    id_ttvc INT,
    FOREIGN KEY (id_ttvc) REFERENCES thong_tin_van_chuyen(id_ttvc)
);

-- Bảng phuong_thuc_thanh_toan
CREATE TABLE phuong_thuc_thanh_toan (
    id_pttt INT PRIMARY KEY IDENTITY,
    ma_pttt NVARCHAR(50),
    ten_pttt NVARCHAR(100),
    ma_code NVARCHAR(100),
    thong_tin_thanh_toan TEXT,
    trang_thai NVARCHAR(50)
);

-- Bảng loai_sp
CREATE TABLE loai_sp (
    id_loai_sp INT PRIMARY KEY IDENTITY,
    ma_lsp NVARCHAR(50),
    ten_loai NVARCHAR(100),
    trang_thai NVARCHAR(50),
    mo_ta TEXT
);

-- Bảng kich_co
CREATE TABLE kich_co (
    id_kich_co INT PRIMARY KEY IDENTITY,
    ma_kc NVARCHAR(50),
    ten_kc NVARCHAR(50),
    trang_thai_kc NVARCHAR(50),
    mo_ta TEXT
);

-- Bảng mau_sac
CREATE TABLE mau_sac (
    id_mau_sac INT PRIMARY KEY IDENTITY,
    ma_ms NVARCHAR(50),
    ten_ms NVARCHAR(50),
    trang_thai_ms NVARCHAR(50)
);

-- Bảng chat_lieu
CREATE TABLE chat_lieu (
    id_chat_lieu INT PRIMARY KEY IDENTITY,
    ma_cl NVARCHAR(50),
    ten_cl NVARCHAR(50),
    trang_thai_cl VARCHAR(50)
);

-- Bảng thuong_hieu
CREATE TABLE thuong_hieu (
    id_thuong_hieu INT PRIMARY KEY IDENTITY,
    ma_th NVARCHAR(50),
    ten_th NVARCHAR(100),
    trang_thai_th NVARCHAR(50),
    dia_chi TEXT
);

-- Bảng san_pham
CREATE TABLE san_pham (
    id_san_pham INT PRIMARY KEY IDENTITY,
    ma_sp NVARCHAR(50),
    ten_sp NVARCHAR(100),
    trang_thai_sp NVARCHAR(50),
    id_loai_sp INT,
    FOREIGN KEY (id_loai_sp) REFERENCES loai_sp(id_loai_sp)
);

-- Bảng san_pham_chi_tiet
CREATE TABLE san_pham_chi_tiet (
    id_san_pham_chi_tiet INT PRIMARY KEY IDENTITY,
    ma_spct NVARCHAR(50),
    id_san_pham INT,
    id_chat_lieu INT,
    id_mau_sac INT,
    id_kich_co INT,
    id_thuong_hieu INT,
    mo_ta TEXT,
    so_luong INT,
    don_gia MONEY,
    anh NVARCHAR(255),
    trang_thai_spct NVARCHAR(50),
    FOREIGN KEY (id_san_pham) REFERENCES san_pham(id_san_pham),
    FOREIGN KEY (id_chat_lieu) REFERENCES chat_lieu(id_chat_lieu),
    FOREIGN KEY (id_mau_sac) REFERENCES mau_sac(id_mau_sac),
    FOREIGN KEY (id_kich_co) REFERENCES kich_co(id_kich_co),
    FOREIGN KEY (id_thuong_hieu) REFERENCES thuong_hieu(id_thuong_hieu)
);

-- Bảng hoa_don
CREATE TABLE hoa_don (
    id_hd INT PRIMARY KEY IDENTITY,
    ma_hd NVARCHAR(100),
    id_kh INT,
    id_nv INT,
    id_pttt INT,
    ngay_tao DATETIME,
    phi_ship MONEY,
    hinh_thuc_thanh_toan NVARCHAR(50),
    tong_tien MONEY,
    trang_thai_hd NVARCHAR(50),
    FOREIGN KEY (id_kh) REFERENCES khach_hang(id_kh),
    FOREIGN KEY (id_nv) REFERENCES nhan_vien(id_nv),
    FOREIGN KEY (id_pttt) REFERENCES phuong_thuc_thanh_toan(id_pttt)
);

-- Bảng hoa_don_chi_tiet
CREATE TABLE hoa_don_chi_tiet (
    id_hoa_don_chi_tiet INT PRIMARY KEY IDENTITY,
    id_hd INT,
    id_san_pham_chi_tiet INT,
    so_luong INT,
    don_gia MONEY,
    don_gia_sau_giam MONEY,
    FOREIGN KEY (id_hd) REFERENCES hoa_don(id_hd),
    FOREIGN KEY (id_san_pham_chi_tiet) REFERENCES san_pham_chi_tiet(id_san_pham_chi_tiet)
);

-- Bảng khuyen_mai
CREATE TABLE khuyen_mai (
    id_khuyen_mai INT PRIMARY KEY IDENTITY,
    ma_km NVARCHAR(50),
    ten_km NVARCHAR(100),
    muc_giam_gia INT,
    dieu_kien NVARCHAR(100),
    ngay_bat_dau DATETIME,
    ngay_ket_thuc DATETIME,
    kieu_giam_gia NVARCHAR(50),
    so_luong INT,
    trang_thai_km NVARCHAR(50),
    id_hd INT,
    FOREIGN KEY (id_hd) REFERENCES hoa_don(id_hd)
);

-- Bảng gio_hang
CREATE TABLE gio_hang (
    id_gio_hang INT PRIMARY KEY IDENTITY,
    id_kh INT,
    trang_thai NVARCHAR(50),
    ngay_tao DATETIME,
    FOREIGN KEY (id_kh) REFERENCES khach_hang(id_kh)
);

-- Bảng gio_hang_chi_tiet
CREATE TABLE gio_hang_chi_tiet (
    id_gio_hang_chi_tiet INT PRIMARY KEY IDENTITY,
    id_gio_hang INT,
    id_san_pham_chi_tiet INT,
    so_luong INT,
    don_gia MONEY,
    FOREIGN KEY (id_gio_hang) REFERENCES gio_hang(id_gio_hang),
    FOREIGN KEY (id_san_pham_chi_tiet) REFERENCES san_pham_chi_tiet(id_san_pham_chi_tiet)
);

-- Bảng hoa_don_history
CREATE TABLE hoa_don_history (
    id_lich_su_hoa_don INT PRIMARY KEY IDENTITY,
    id_hd INT,
    ngay_thay_doi DATETIME,
    ngay_tao DATETIME,
    trang_thai NVARCHAR(50),
    FOREIGN KEY (id_hd) REFERENCES hoa_don(id_hd)
);

-- Bảng danh_gia
CREATE TABLE danh_gia (
    id_danh_gia INT PRIMARY KEY IDENTITY,
    id_san_pham_chi_tiet INT,
    noi_dung_danh_gia TEXT,
    ngay_tao DATETIME,
    so_sao INT,
    FOREIGN KEY (id_san_pham_chi_tiet) REFERENCES san_pham_chi_tiet(id_san_pham_chi_tiet)
);

INSERT INTO loai_sp (ma_lsp, ten_loai, trang_thai, mo_ta) 
VALUES 
('LSP001', N'Xe đạp trẻ em 3 bánh', N'Hoạt động', N'Xe đạp 3 bánh dành cho trẻ từ 1-3 tuổi'),
('LSP002', N'Xe đạp trẻ em có bánh phụ', N'Hoạt động', N'Xe đạp có bánh phụ dành cho trẻ từ 3-5 tuổi'),
('LSP003', N'Xe đạp trẻ em thể thao', N'Hoạt động', N'Xe đạp thể thao dành cho trẻ từ 5-7 tuổi'),
('LSP004', N'Xe đạp thăng bằng', N'Hoạt động', N'Xe đạp thăng bằng dành cho trẻ em từ 2-5 tuổi'),
('LSP005', N'Xe đạp điện trẻ em', N'Hoạt động', N'Xe đạp điện cho trẻ em từ 6-10 tuổi');

INSERT INTO san_pham (ma_sp, ten_sp, trang_thai_sp, id_loai_sp) 
VALUES 
('SP001', N'Xe đạp 3 bánh ABC', N'Còn hàng', 1),
('SP002', N'Xe đạp có bánh phụ XYZ', N'Còn hàng', 2),
('SP003', N'Xe đạp thể thao KidsSport', N'Còn hàng', 3),
('SP004', N'Xe đạp thăng bằng JoyBalance', N'Còn hàng', 4),
('SP005', N'Xe đạp điện mini E-Bike', N'Còn hàng', 5);

INSERT INTO chat_lieu (ma_cl, ten_cl, trang_thai_cl) 
VALUES 
('CL001', N'Thép', N'Hoạt động'),
('CL002', N'Hợp kim nhôm', N'Hoạt động'),
('CL003', N'Nhựa cao cấp', N'Hoạt động'),
('CL004', N'Nhôm', N'Hoạt động'),
('CL005', N'Carbon', N'Hoạt động');

INSERT INTO mau_sac (ma_ms, ten_ms, trang_thai_ms) 
VALUES 
('MS001', N'Đỏ', N'Hoạt động'),
('MS002', N'Xanh lá', N'Hoạt động'),
('MS003', N'Vàng', N'Hoạt động'),
('MS004', N'Đen', N'Hoạt động'),
('MS005', N'Hồng', N'Hoạt động');

INSERT INTO kich_co (ma_kc, ten_kc, trang_thai_kc, mo_ta) 
VALUES 
('KC001', N'Nhỏ', N'Hoạt động', N'Kích thước nhỏ dành cho trẻ từ 1-3 tuổi'),
('KC002', N'Trung bình', N'Hoạt động', N'Kích thước trung bình dành cho trẻ từ 3-5 tuổi'),
('KC003', N'Lớn', N'Hoạt động', N'Kích thước lớn dành cho trẻ từ 5-7 tuổi'),
('KC004', N'Rất lớn', N'Hoạt động', N'Kích thước rất lớn dành cho trẻ trên 7 tuổi'),
('KC005', N'Siêu nhỏ', N'Hoạt động', N'Kích thước dành cho trẻ sơ sinh');

INSERT INTO thuong_hieu (ma_th, ten_th, trang_thai_th, dia_chi) 
VALUES 
('TH001', N'ABC', N'Hoạt động', N'Địa chỉ ABC - Việt Nam'),
('TH002', N'XYZ', N'Hoạt động', N'Địa chỉ XYZ - Nhật Bản'),
('TH003', N'KidsSport', N'Hoạt động', N'Địa chỉ KidsSport - Hàn Quốc'),
('TH004', N'JoyBalance', N'Hoạt động', N'Địa chỉ JoyBalance - Mỹ'),
('TH005', N'Mini E-Bike', N'Hoạt động', N'Địa chỉ Mini E-Bike - Trung Quốc');

INSERT INTO san_pham_chi_tiet (ma_spct, id_san_pham, id_chat_lieu, id_mau_sac, id_kich_co, id_thuong_hieu, mo_ta, so_luong, don_gia, anh, trang_thai_spct) 
VALUES 
('SPCT001', 1, 1, 1, 1, 1, N'Xe đạp 3 bánh ABC màu đỏ, khung thép, kích cỡ nhỏ', 50, 500000, 'abc_red.jpg', N'Còn hàng'),
('SPCT002', 2, 2, 2, 2, 2, N'Xe đạp có bánh phụ XYZ màu xanh, khung hợp kim, kích cỡ trung bình', 30, 800000, 'xyz_green.jpg', N'Còn hàng'),
('SPCT003', 3, 3, 3, 3, 3, N'Xe đạp thể thao KidsSport màu vàng, khung hợp kim, kích cỡ lớn', 20, 1500000, 'kidsport_yellow.jpg', N'Còn hàng'),
('SPCT004', 4, 4, 4, 4, 4, N'Xe đạp thăng bằng JoyBalance màu hồng, khung nhôm, kích cỡ nhỏ', 40, 600000, 'joybalance_pink.jpg', N'Còn hàng'),
('SPCT005', 5, 5, 5, 5, 5, N'Xe đạp điện mini E-Bike màu đen, khung thép, kích cỡ lớn', 15, 2500000, 'ebike_black.jpg', N'Còn hàng'),
('SPCT006', 1, 1, 2, 1, 1, N'Xe đạp 3 bánh ABC màu xanh, khung thép, kích cỡ nhỏ', 45, 520000, 'abc_green.jpg', N'Còn hàng'),
('SPCT007', 2, 2, 3, 2, 2, N'Xe đạp có bánh phụ XYZ màu vàng, khung hợp kim, kích cỡ trung bình', 35, 820000, 'xyz_yellow.jpg', N'Còn hàng'),
('SPCT008', 3, 3, 4, 3, 3, N'Xe đạp thể thao KidsSport màu đen, khung hợp kim, kích cỡ lớn', 18, 1520000, 'kidsport_black.jpg', N'Còn hàng'),
('SPCT009', 4, 4, 5, 4, 4, N'Xe đạp thăng bằng JoyBalance màu xanh dương, khung nhôm, kích cỡ nhỏ', 37, 620000, 'joybalance_blue.jpg', N'Còn hàng'),
('SPCT010', 5, 5, 1, 5, 5, N'Xe đạp điện mini E-Bike màu trắng, khung thép, kích cỡ lớn', 10, 2550000, 'ebike_white.jpg', N'Còn hàng');

INSERT INTO chuc_vu (ma_chuc_vu, ten_chuc_vu) 
VALUES 
('CV001', N'Quản lý'),
('CV002', N'Nhân viên'),
('CV003', N'ADMIN');

INSERT INTO nhan_vien (ma_nv, ten_nv, gioi_tinh, ngay_sinh, ngay_lam_viec, mat_khau, sdt, email, trang_thai_nv, dia_chi, id_chuc_vu) 
VALUES 
('NV001', N'Trần Văn A', N'Nam', '1990-05-15', '2023-01-01', 'password123', '0901234567', 'trana@gmail.com', N'Hoạt động', N'Số 1, đường A', 1),
('NV002', N'Nguyễn Thị B', N'Nữ', '1995-08-20', '2023-02-01', 'password123', '0907654321', 'nguyenb@gmail.com', N'Hoạt động', N'Số 2, đường B', 2),
('NV003', N'Nguyễn Văn C', N'Nam', '1992-11-10', '2023-03-15', 'password123', '0902223334', 'nguyenc@gmail.com', N'Hoạt động', N'Số 3, đường C', 3);

INSERT INTO thong_tin_van_chuyen (ma_ttvc, tinh, huyen, xa, dia_chi, ten_nguoi_nhan, sdt) 
VALUES 
('TTVC001', N'Thành phố Hà Nội', N'Quận Hoàn Kiếm', N'Phường Tràng Tiền', N'Số 4, phố B', N'Trần Văn A', '0901234567'),
('TTVC002', N'Tỉnh Thanh Hóa', N'Huyện Hoằng Hóa', N'Xã Hoằng Lộc', N'Số 10, đường C', N'Nguyễn Thị B', '0907654321'),
('TTVC003', N'Da Nang', N'Quận Hải Châu', N'Phường Thạch Thang', N'Số 3, Đường C', N'Nguyễn Văn F', '0123456784');

INSERT INTO khach_hang (ma_kh, ten_kh, email, sdt, dia_chi, mat_khau, id_ttvc) 
VALUES 
('KH001', N'Nguyễn Văn G', 'kh1@example.com', '0123456785', N'Số 4, Đường D', 'password1', 1),
('KH002', N'Trần Thị H', 'kh2@example.com', '0123456786', N'Số 5, Đường E', 'password2', 2),
('KH003', N'Nguyễn Văn I', 'kh3@example.com', '0123456787', N'Số 6, Đường F', 'password3', 3);

INSERT INTO phuong_thuc_thanh_toan (ma_pttt, ten_pttt, ma_code, thong_tin_thanh_toan, trang_thai) 
VALUES 
('PTTT004', N'Thanh toán khi nhận hàng', 'TP004', N'Thanh toán bằng tiền mặt khi nhận hàng', N'Hoạt động'),
('PTTT005', N'Chuyển khoản nhanh', 'TP005', N'Chuyển khoản qua dịch vụ ngân hàng nhanh', N'Hoạt động'),
('PTTT006', N'Thẻ ghi nợ', 'TP006', N'Sử dụng thẻ ghi nợ để thanh toán', N'Hoạt động');


INSERT INTO hoa_don (ma_hd, id_kh, id_nv, id_pttt, ngay_tao, phi_ship, hinh_thuc_thanh_toan, tong_tien, trang_thai_hd) 
VALUES 
('HD001', 1, 1, 1, GETDATE(), 50000, N'Transfer', 1500000, N'Hoạt động'),
('HD002', 2, 2, 2, GETDATE(), 60000, N'Pay on delivery', 3000000, N'Hoạt động');

INSERT INTO hoa_don_chi_tiet (id_hd, id_san_pham_chi_tiet, so_luong, don_gia, don_gia_sau_giam) 
VALUES 
(1, 1, 2, 500000, 1000000),
(1, 2, 1, 800000, 800000),
(2, 3, 3, 1500000, 4500000);

INSERT INTO khuyen_mai (ma_km, ten_km, muc_giam_gia, dieu_kien, ngay_bat_dau, ngay_ket_thuc, kieu_giam_gia, so_luong, trang_thai_km, id_hd) 
VALUES 
('KM001', N'Giảm giá mùa hè', 10, N'Mua 2 sản phẩm', '2024-06-01', '2024-06-30', N'Giảm giá theo phần trăm', 100, N'Hoạt động', 1);

INSERT INTO gio_hang (id_kh, trang_thai, ngay_tao) 
VALUES 
(1, N'Đang hoạt động', GETDATE()),
(2, N'Đang hoạt động', GETDATE());

INSERT INTO gio_hang_chi_tiet (id_gio_hang, id_san_pham_chi_tiet, so_luong, don_gia) 
VALUES 
(1, 1, 1, 500000),
(1, 2, 2, 800000),
(2, 3, 1, 1500000);

INSERT INTO danh_gia (id_san_pham_chi_tiet, noi_dung_danh_gia, ngay_tao, so_sao) 
VALUES 
(1, N'Sản phẩm rất tốt, trẻ em thích.', GETDATE(), 5),
(2, N'Chất lượng tốt nhưng giá hơi cao.', GETDATE(), 4);

INSERT INTO hoa_don_history (id_hd, ngay_thay_doi, ngay_tao, trang_thai) 
VALUES 
(1, GETDATE(), GETDATE(), N'Hoạt động'),
(2, GETDATE(), GETDATE(), N'Hoạt động');
