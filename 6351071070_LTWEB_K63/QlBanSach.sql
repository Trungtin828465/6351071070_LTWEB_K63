

create database Qlsach
GO
use Qlsach

GO

CREATE TABLE TACGIA (
    MaTG INT PRIMARY KEY identity(1,1),
    TenTG NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    TieuSu NVARCHAR(255) NOT NULL,
    DienThoai NVARCHAR(15) NOT NULL
);

CREATE TABLE NHAXUATBAN (
    MaNXB INT PRIMARY KEY identity(1,1),
    TenNXB NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    DienThoai NVARCHAR(15) NOT NULL
);

CREATE TABLE CHUDE (
    MaCD INT PRIMARY KEY,
    TenChuDe NVARCHAR(50) NOT NULL
);


CREATE TABLE SACH (
    MaSach INT PRIMARY KEY identity(1,1),
    TenSach NVARCHAR(50) NOT NULL,
    GiaBan DECIMAL(10, 2) NOT NULL,
    MoTa NVARCHAR(255) NOT NULL,
    AnhBia NVARCHAR(255) NOT NULL,
    NgayCapNhat DATE NOT NULL,
    SoLuongTon INT NOT NULL,
    MaCD INT NOT NULL,
    MaNXB INT NOT NULL,
    MaTG INT NOT NULL,
	tmp int DEFAULT 0,
    FOREIGN KEY (MaCD) REFERENCES CHUDE(MaCD),
    FOREIGN KEY (MaNXB) REFERENCES NHAXUATBAN(MaNXB),
    FOREIGN KEY (MaTG) REFERENCES TACGIA(MaTG)
);

CREATE TABLE KHACHHANG (
    MaKH INT PRIMARY KEY identity(1,1),
    HoTen NVARCHAR(50) NOT NULL,
    TaiKhoan NVARCHAR(50) NOT NULL,
    MatKhau NVARCHAR(50) NOT NULL,
    Email NVARCHAR(50) NOT NULL,
    DiaChi NVARCHAR(100) NOT NULL,
    DienThoaiKH NVARCHAR(15) NOT NULL,
    NgaySinh DATE NOT NULL
);

CREATE TABLE DONDATHANG (
    MaDonHang INT PRIMARY KEY identity(1,1),
    DaThanhToan BIT NOT NULL,
    TriGia DECIMAL(10, 2) NOT NULL,
    NgayLap DATE NOT NULL,
    NgayGiao DATE,
    MaKH INT NOT NULL,
    FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH)
);

CREATE TABLE CHITIETDONDATHANG (
    MaDonHang INT NOT NULL,
    MaSach INT NOT NULL,
    SoLuong INT NOT NULL,
    DonGia DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (MaDonHang, MaSach),
    FOREIGN KEY (MaDonHang) REFERENCES DONDATHANG(MaDonHang),
    FOREIGN KEY (MaSach) REFERENCES SACH(MaSach)
);

CREATE TABLE VIETSACH (
    MaTG INT NOT NULL,
    MaSach INT NOT NULL,
    VaiTro NVARCHAR(50) NOT NULL,
    PRIMARY KEY (MaTG, MaSach),
    FOREIGN KEY (MaTG) REFERENCES TACGIA(MaTG),
    FOREIGN KEY (MaSach) REFERENCES SACH(MaSach)
);
INSERT INTO TACGIA (TenTG, DiaChi, TieuSu, DienThoai)
VALUES 
(N'Nguyễn Nhật Ánh', N'123 Đường Sách, Quận 1, TP.HCM', N'Tác giả nổi tiếng với các tác phẩm văn học dành cho thanh thiếu niên.', '0909123456'),
(N'Tô Hoài', N'456 Đường Văn Học, Quận 3, TP.HCM', N'Nhà văn nổi tiếng với các tác phẩm dành cho thiếu nhi.', '0909123457'),
(N'Nguyễn Huy Thiệp', N'789 Đường Văn Cao, Quận 5, TP.HCM', N'Tác giả của nhiều truyện ngắn nổi bật.', '0909123458'),
(N'Nam Cao', N'123 Đường Văn Học, Quận 1, TP.HCM', N'Nhà văn hiện thực phê phán nổi tiếng.', '0909123459'),
(N'Vũ Trọng Phụng', N'456 Đường Phổ Biến, Quận 2, TP.HCM', N'Tác giả của Số đỏ.', '0909123460'),
(N'Ngô Tất Tố', N'789 Đường Văn Học, Quận 10, TP.HCM', N'Nhà văn nổi tiếng với các tác phẩm hiện thực.', '0909123461'),
(N'Xuân Diệu', N'123 Đường Sách, Quận 1, TP.HCM', N'Thơ tình nổi tiếng với phong cách lãng mạn.', '0909123462'),
(N'Thanh Tịnh', N'456 Đường Văn Học, Quận 4, TP.HCM', N'Tác giả nổi bật trong văn học hiện đại.', '0909123463'),
(N'Thanh Lam', N'789 Đường Văn Cao, Quận 7, TP.HCM', N'Nhà thơ nổi bật của Việt Nam.', '0909123464'),
(N'Thanh Nhàn', N'321 Đường Lý Thường Kiệt, Quận 5, TP.HCM', N'Nhà thơ trẻ, tác giả của nhiều tập thơ hiện đại.', '0909123465'),
(N'Tố Hữu', N'234 Đường Độc Lập, Quận 9, TP.HCM', N'Nhà thơ với phong cách lãng mạn.', '0909123466'),
(N'Nguyễn Bính', N'345 Đường Cách Mạng, Quận 6, TP.HCM', N'Thơ của Nguyễn Bính thiên về tình cảm.', '0909123467'),
(N'Chế Lan Viên', N'567 Đường Đống Đa, Quận 11, TP.HCM', N'Nhà thơ nổi bật trong nền văn học Việt.', '0909123468'),
(N'Văn Cao', N'789 Đường Độc Lập, Quận 3, TP.HCM', N'Nhạc sĩ nổi tiếng với nhiều tác phẩm yêu nước.', '0909123469'),
(N'Trang Thế Hy', N'654 Đường Sáng Tác, Quận 8, TP.HCM', N'Tác giả viết nhiều tác phẩm chân thực về cuộc sống.', '0909123470');
INSERT INTO NHAXUATBAN (TenNXB, DiaChi, DienThoai)
VALUES 
(N'NXB Trẻ', N'12 Đường Phạm Ngọc Thạch, Quận 3, TP.HCM', '0911234567'),
(N'NXB Kim Đồng', N'24 Đường Lý Thái Tổ, Quận 10, TP.HCM', '0911234568'),
(N'NXB Văn Học', N'30 Đường Nguyễn Thị Minh Khai, Quận 1, TP.HCM', '0911234569'),
(N'NXB Giáo Dục', N'45 Đường Lê Lợi, Quận 3, TP.HCM', '0911234570'),
(N'NXB Hội Nhà Văn', N'50 Đường Hai Bà Trưng, Quận 1, TP.HCM', '0911234571'),
(N'NXB Tổng Hợp', N'15 Đường Ngô Quyền, Quận 5, TP.HCM', '0911234572'),
(N'NXB Tự Do', N'88 Đường Độc Lập, Quận 9, TP.HCM', '0911234573'),
(N'NXB Sống Mới', N'30 Đường Lê Quang Định, Quận 2, TP.HCM', '0911234574'),
(N'NXB Lao Động', N'90 Đường Bùi Viện, Quận 3, TP.HCM', '0911234575'),
(N'NXB Công An', N'100 Đường Nguyễn Đình Chiểu, Quận 10, TP.HCM', '0911234576'),
(N'NXB Chính Trị', N'12 Đường Lý Thái Tổ, Quận 11, TP.HCM', '0911234577'),
(N'NXB Đời Sống', N'75 Đường Nam Kỳ Khởi Nghĩa, Quận 1, TP.HCM', '0911234578'),
(N'NXB Thanh Niên', N'66 Đường Cộng Hòa, Quận Tân Bình, TP.HCM', '0911234579'),
(N'NXB Y Học', N'40 Đường Đoàn Văn Bơ, Quận 4, TP.HCM', '0911234580'),
(N'NXB Công Nghệ', N'55 Đường Phan Văn Hân, Quận Bình Thạnh, TP.HCM', '0911234581');

INSERT INTO CHUDE (MaCD, TenChuDe)
VALUES 
(1, N'Văn học thiếu nhi'),
(2, N'Văn học trung đại'),
(3, N'Khoa học viễn tưởng'),
(4, N'Trinh thám'),
(5, N'Truyện cổ tích'),
(6, N'Kinh doanh'),
(7, N'Lịch sử'),
(8, N'Tâm lý học'),
(9, N'Y học'),
(10, N'Triết học'),
(11, N'Kỹ năng sống'),
(12, N'Châm ngôn'),
(13, N'Thơ ca'),
(14, N'Tôn giáo'),
(15, N'Xã hội học');

INSERT INTO SACH (TenSach, GiaBan, MoTa, AnhBia, NgayCapNhat, SoLuongTon, MaCD, MaNXB, MaTG)
VALUES 
(N'Dế Mèn phiêu lưu ký', 90000, N'Tác phẩm thiếu nhi nổi bật của Tô Hoài.', 'demen.jpg', '2024-01-02', 30, 1, 1, 2),
(N'Số đỏ', 120000, N'Một trong những tiểu thuyết nổi tiếng nhất của Vũ Trọng Phụng.', 'sodo.jpg', '2024-01-03', 20, 2, 3, 5),
(N'Lão Hạc', 95000, N'Tác phẩm nổi tiếng của Nam Cao.', 'laohac.jpg', '2024-02-01', 25, 2, 4, 4),
(N'Chí Phèo', 88000, N'Tác phẩm hiện thực phê phán nổi bật của Nam Cao.', 'chipheo.jpg', '2024-02-02', 22, 2, 5, 4),
(N'Truyện Kiều', 150000, N'Tác phẩm kinh điển của Nguyễn Du.', 'truyenkieu.jpg', '2024-02-03', 10, 2, 6, 1),
(N'Vợ nhặt', 105000, N'Tác phẩm nổi tiếng của Kim Lân.', 'vonhat.jpg', '2024-03-01', 20, 2, 7, 7),
(N'Truyện cổ Grim', 130000, N'Truyển cổ tích Grim nổi tiếng.', 'truyencogrim.jpg', '2024-03-02', 15, 1, 1, 8),
(N'Tuyển tập thơ Hàn Mặc Tử', 120000, N'Tuyển tập thơ của Hàn Mặc Tử.', 'thohanmactu.jpg', '2024-03-03', 12, 13, 2, 9),
(N'Tâm lý học đại cương', 170000, N'Tài liệu về tâm lý học đại cương.', 'tamly.jpg', '2024-04-01', 10, 8, 2, 10),
(N'Triết học nhập môn', 180000, N'Tài liệu triết học cho người mới bắt đầu.', 'triethoc.jpg', '2024-04-02', 8, 10, 2, 11),
(N'Lịch sử Việt Nam', 140000, N'Tác phẩm về lịch sử Việt Nam.', 'lichsu.jpg', '2024-04-03', 15, 7, 1, 12),
(N'Kỹ năng sống cho người trẻ', 115000, N'Tác phẩm về kỹ năng sống.', 'kynangsong.jpg', '2024-05-01', 18, 11, 2, 13),
(N'Lớn để trưởng thành', 135000, N'Tác phẩm châm ngôn sống.', 'chamngon.jpg', '2024-05-02', 10, 12, 1, 14),
(N'Tình yêu và cuộc sống', 125000, N'Sách về tình yêu và cuộc sống.', 'tinhyeu.jpg', '2024-05-03', 22, 3, 2, 15),
(N'Những tấm lòng cao cả', 125000, N'Tác phẩm thiếu nhi nổi bật.', 'caoca.jpg', '2024-05-03', 22, 1, 15, 15),
(N'Đồi thỏ', 125000, N'Tác phẩm thiếu nhi nổi bật của Kim Đồng.', 'doitho.jpg', '2024-05-03', 22, 1, 15, 15);


INSERT INTO KHACHHANG (HoTen, TaiKhoan, MatKhau, Email, DiaChi, DienThoaiKH, NgaySinh)
VALUES 
(N'Nguyễn Văn Anh', N'nguyenvana', N'password123', N'vana@gmail.com', N'123 Đường Lý Thường Kiệt, Quận 1, TP.HCM', '0905123456', '1990-01-15'),
(N'Trần Thị Bích', N'tranthibich', N'password123', N'bichtran@gmail.com', N'456 Đường Nguyễn Huệ, Quận 3, TP.HCM', '0905123457', '1988-02-18'),
(N'Phạm Văn Cường', N'phamvancuong', N'password123', N'cuongpham@gmail.com', N'789 Đường Cách Mạng Tháng 8, Quận 5, TP.HCM', '0905123458', '1992-03-22'),
(N'Lê Thị Dung', N'lethidung', N'password123', N'dungle@gmail.com', N'321 Đường Võ Thị Sáu, Quận 4, TP.HCM', '0905123459', '1995-04-05'),
(N'Nguyễn Thị Hiền', N'nguyenthihien', N'password123', N'hiennguyen@gmail.com', N'654 Đường Phạm Văn Đồng, Quận 7, TP.HCM', '0905123460', '1991-05-10'),
(N'Trần Văn Phú', N'tranvanphu', N'password123', N'phutran@gmail.com', N'987 Đường Điện Biên Phủ, Quận 6, TP.HCM', '0905123461', '1989-06-12'),
(N'Phạm Thị Hương', N'phamthihuong', N'password123', N'huongpham@gmail.com', N'123 Đường Hoàng Sa, Quận 8, TP.HCM', '0905123462', '1993-07-14'),
(N'Lê Văn Hùng', N'levanhung', N'password123', N'hungle@gmail.com', N'456 Đường Trường Chinh, Quận 9, TP.HCM', '0905123463', '1996-08-19'),
(N'Nguyễn Thị Lan', N'nguyenthilan', N'password123', N'lannguyen@gmail.com', N'789 Đường Nam Kỳ Khởi Nghĩa, Quận 10, TP.HCM', '0905123464', '1994-09-23'),
(N'Trần Văn Khánh', N'tranvankhanh', N'password123', N'khanhtran@gmail.com', N'321 Đường Hùng Vương, Quận 11, TP.HCM', '0905123465', '1987-10-28'),
(N'Phạm Văn Lâm', N'phamvanlam', N'password123', N'lampham@gmail.com', N'654 Đường Quang Trung, Quận 2, TP.HCM', '0905123466', '1992-11-30'),
(N'Lê Thị Minh', N'lethiminh', N'password123', N'minhle@gmail.com', N'987 Đường Hàm Nghi, Quận 3, TP.HCM', '0905123467', '1990-12-31'),
(N'Nguyễn Văn Nam', N'nguyenvannam', N'password123', N'namnguyen@gmail.com', N'123 Đường Kinh Dương Vương, Quận 4, TP.HCM', '0905123468', '1995-01-05'),
(N'Trần Thị Oanh', N'tranthioanh', N'password123', N'oanhtran@gmail.com', N'456 Đường Nguyễn Đình Chiểu, Quận 5, TP.HCM', '0905123469', '1993-02-12'),
(N'Phạm Thị Phương', N'phamthiphuong', N'password123', N'phuongpham@gmail.com', N'789 Đường Lê Lợi, Quận 6, TP.HCM', '0905123470', '1991-03-17');
INSERT INTO DONDATHANG (DaThanhToan, TriGia, NgayLap, NgayGiao, MaKH)
VALUES 
(1, 250000, '2024-01-10', '2024-01-15', 1),
(0, 150000, '2024-01-12', '2024-01-17', 2),
(1, 300000, '2024-01-15', '2024-01-20', 3),
(1, 500000, '2024-01-18', '2024-01-25', 4),
(0, 750000, '2024-01-20', '2024-01-27', 5),
(1, 200000, '2024-01-22', '2024-01-28', 6),
(0, 120000, '2024-01-24', '2024-01-30', 7),
(1, 400000, '2024-01-26', '2024-02-01', 8),
(0, 350000, '2024-01-28', '2024-02-05', 9),
(1, 280000, '2024-01-30', '2024-02-06', 10),
(1, 320000, '2024-02-02', '2024-02-08', 11),
(0, 100000, '2024-02-04', '2024-02-10', 12),
(1, 500000, '2024-02-06', '2024-02-12', 13),
(0, 600000, '2024-02-08', '2024-02-15', 14),
(1, 900000, '2024-02-10', '2024-02-18', 15);
INSERT INTO CHITIETDONDATHANG (MaDonHang, MaSach, SoLuong, DonGia)
VALUES 
(1, 1, 2, 125000),
(1, 2, 1, 250000),
(2, 3, 1, 150000),
(3, 4, 1, 300000),
(3, 5, 1, 300000),
(4, 6, 1, 500000),
(5, 7, 2, 375000),
(6, 8, 1, 200000),
(7, 9, 1, 120000),
(8, 10, 2, 200000),
(9, 11, 1, 350000),
(10, 12, 1, 280000),
(11, 13, 1, 320000),
(12, 14, 1, 100000),
(13, 15, 1, 500000);
INSERT INTO VIETSACH (MaTG, MaSach, VaiTro)
VALUES 
(1, 1, N'Tác giả chính'),
(2, 2, N'Tác giả phụ'),
(3, 3, N'Tác giả chính'),
(4, 4, N'Tác giả chính'),
(5, 5, N'Tác giả chính'),
(6, 6, N'Tác giả phụ'),
(7, 7, N'Tác giả chính'),
(8, 8, N'Tác giả phụ'),
(9, 9, N'Tác giả chính'),
(10, 10, N'Tác giả chính'),
(11, 11, N'Tác giả phụ'),
(12, 12, N'Tác giả chính'),
(13, 13, N'Tác giả chính'),
(14, 14, N'Tác giả phụ'),
(15, 15, N'Tác giả chính');

create table MoTa(
IdMoTa int identity(1,1) primary key,
MaSach INT not null,
Mota nvarchar(500) not null,
FOREIGN KEY (MaSach) REFERENCES Sach(MaSach)
);
INSERT INTO MoTa (MaSach, Mota) VALUES
(1, N'Tác phẩm thiếu nhi nổi bật của Tô Hoài, kể về cuộc phiêu lưu của Dế Mèn, một chú dế thông minh và gan dạ. Qua hành trình khám phá thế giới xung quanh, câu chuyện không chỉ mang tính giải trí mà còn chứa đựng nhiều bài học quý giá về tình bạn, lòng dũng cảm và sự kiên trì.'),
(2, N'Một trong những tiểu thuyết nổi tiếng nhất của Vũ Trọng Phụng, phản ánh sự thay đổi của xã hội Việt Nam trong giai đoạn đầu thế kỷ 20. Tác phẩm sử dụng lối viết châm biếm để chỉ trích những thói hư tật xấu của xã hội, đồng thời thể hiện được cái nhìn sâu sắc về con người và cuộc sống.'),
(3, N'Tác phẩm nổi tiếng của Nam Cao, kể về cuộc đời của Lão Hạc, một người nông dân lương thiện và nghèo khó. Tác phẩm khắc họa một cách tinh tế những giá trị đạo đức và nhân văn, đồng thời cho thấy nỗi đau và sự hy sinh của con người trong cuộc sống khắc nghiệt.'),
(4, N'Tác phẩm hiện thực phê phán nổi bật của Nam Cao, nói về cuộc đời bi thảm của Chí Phèo, một người nông dân lương thiện bị xã hội đẩy vào con đường tội lỗi. Qua đó, tác giả phê phán chế độ thực dân và những bất công xã hội, đồng thời khẳng định giá trị con người và quyền sống của mỗi cá nhân.'),
(5, N'Tác phẩm kinh điển của Nguyễn Du, là một trong những biểu tượng vĩ đại của văn học Việt Nam. Qua hình ảnh của Kiều, tác phẩm không chỉ tái hiện những bi kịch trong cuộc đời mà còn thể hiện được tấm lòng nhân ái, sự đau khổ và khát vọng tự do của con người.'),
(6, N'Tác phẩm nổi tiếng của Kim Lân, phản ánh cuộc sống khổ cực của người dân trong thời kỳ đói kém. Qua câu chuyện tình yêu của nhân vật chính, tác phẩm mang đến một thông điệp mạnh mẽ về tình người, sự sống còn và những giá trị nhân văn cao cả trong hoàn cảnh khó khăn.'),
(7, N'Bộ truyện cổ tích nổi tiếng của Đức, chứa đựng nhiều câu chuyện đầy màu sắc và ý nghĩa. Mỗi câu chuyện không chỉ giải trí mà còn giáo dục những bài học về đạo đức, sự công bằng và niềm tin vào điều thiện.'),
(8, N'Một tuyển tập những bài thơ tiêu biểu của Hàn Mặc Tử, thể hiện tâm hồn nhạy cảm và sự khao khát yêu thương. Thơ của ông thường mang âm hưởng buồn bã, sâu lắng và đầy chất thơ.'),
(9, N'Tài liệu cung cấp kiến thức cơ bản về tâm lý học, bao gồm các khái niệm, lý thuyết và ứng dụng thực tiễn. Đây là một cuốn sách hữu ích cho những ai muốn tìm hiểu về tâm lý con người và các yếu tố ảnh hưởng đến hành vi.'),
(10, N'Tài liệu triết học dành cho người mới bắt đầu, giới thiệu các trường phái triết học lớn, những vấn đề triết học cơ bản và cách tiếp cận tư duy triết học. Cuốn sách này giúp độc giả hiểu rõ hơn về các khái niệm triết học và ứng dụng của chúng trong cuộc sống.'),
(11, N'Tác phẩm nghiên cứu về lịch sử Việt Nam, từ các thời kỳ cổ đại đến hiện đại. Cuốn sách cung cấp cái nhìn tổng quát về các sự kiện lịch sử, văn hóa và xã hội, giúp độc giả hiểu rõ hơn về đất nước và con người Việt Nam.'),
(12, N'Tác phẩm hướng dẫn về các kỹ năng cần thiết cho thanh niên trong cuộc sống hiện đại. Cuốn sách đề cập đến những vấn đề như giao tiếp, quản lý thời gian, giải quyết xung đột và phát triển bản thân, giúp người trẻ tự tin hơn trong cuộc sống.'),
(13, N'Tác phẩm châm ngôn sống, giúp độc giả khám phá và áp dụng những giá trị tích cực vào cuộc sống hàng ngày. Qua từng trang sách, người đọc sẽ tìm thấy động lực để vượt qua khó khăn và phát triển bản thân.'),
(14, N'Sách về tình yêu và cuộc sống, khám phá các khía cạnh khác nhau của tình yêu, từ tình yêu đôi lứa đến tình yêu gia đình và bạn bè. Qua những câu chuyện thực tế và bài học quý giá, độc giả sẽ tìm thấy những giá trị đẹp đẽ trong cuộc sống.'),
(15, N'Cuốn sách “Những tấm lòng cao cả” là thiên tiểu thuyết viết dưới dạng nhật ký của cậu bé 11 tuổi người Ý tên là Enricô, trong suốt năm học lớp ba đã đều đặn ghi lại những mẩu chuyện ấn tượng nhất đối với em.'),
(16, N'Hành trình, Trên ngọn đồi Watership, Efrafa và Thủ lĩnh Cây Phỉ. Đó là một trong những lý do khiến Đồi thỏ thành công vang dội với bạn đọc mọi lứa tuổi,');



CREATE TABLE Admin (
    AdminID INT PRIMARY KEY IDENTITY(1,1),     -- Mã quản trị viên (tự động tăng)
    UserAdmin NVARCHAR(50) NOT NULL UNIQUE  ,   -- Tên đăng nhập của quản trị viên (không được trùng)
    PasswordAdmin NVARCHAR(255) NOT NULL,
	FullName nvarchar(255) not null,-- Mật khẩu của quản trị viên
	
);

-- Dữ liệu mẫu cho Admin
INSERT INTO Admin (UserAdmin, PasswordAdmin, FullName)
VALUES 
('tin', '123', N'Nguyễn Trung Tín');