use QuanLyKyTucXa
go

--Thong Ke TienDien
CREATE PROCEDURE sp_LuongDienTheoThang
    @nam INT,
    @thang INT
AS
BEGIN
    SELECT ISNULL(SUM(sodientieuthu), 0) AS TongSoDien
    FROM TienDien
    WHERE YEAR(ngaylap) = @nam AND MONTH(ngaylap) = @thang
END
GO


--QuanLySinhVien

-- 1. Lấy tất cả sinh viên
CREATE PROCEDURE sp_LayTatCaSinhVien
AS
BEGIN
    SELECT * FROM SinhVien
END
GO

-- 2. Thêm sinh viên
CREATE PROCEDURE sp_ThemSinhVien
    @MaSV NVARCHAR(10),
    @HoTen NVARCHAR(50),
    @GioiTinh NVARCHAR(5),
    @NgaySinh DATE,
    @QueQuan NVARCHAR(100),
    @Khoa NVARCHAR(50),
    @Lop NVARCHAR(50),
    @LoaiUuTien NVARCHAR(50),
    @MaPhong NVARCHAR(10)
AS
BEGIN
    INSERT INTO SinhVien(masv, tensv, gioitinh, ngaysinh, quequan, khoa, lop, loaiuutien, maphong)
    VALUES (@MaSV, @HoTen, @GioiTinh, @NgaySinh, @QueQuan, @Khoa, @Lop, @LoaiUuTien, @MaPhong)
END
GO

-- 3. Cập nhật sinh viên

CREATE PROCEDURE sp_SuaSinhVien
    @MaSV NVARCHAR(10),
    @HoTen NVARCHAR(50),
    @GioiTinh NVARCHAR(5),
    @NgaySinh DATE,
    @QueQuan NVARCHAR(100),
    @Email NVARCHAR(100),
    @Khoa NVARCHAR(50),
    @Lop NVARCHAR(50),
    @LoaiUuTien NVARCHAR(50),
    @MaPhong NVARCHAR(10)
AS
BEGIN
    UPDATE SinhVien
    SET tensv = @HoTen,
        gioitinh = @GioiTinh,
        ngaysinh = @NgaySinh,
        quequan = @QueQuan,
        email = @Email,
        khoa = @Khoa,
        lop = @Lop,
        loaiuutien = @LoaiUuTien,
        maphong = @MaPhong
    WHERE masv = @MaSV
END
GO

-- 4. Xóa sinh viên
CREATE PROCEDURE sp_XoaSinhVien
    @MaSV NVARCHAR(10)
AS
BEGIN
    DELETE FROM SinhVien WHERE masv = @MaSV
END
GO

-- 5. Tìm kiếm theo mã sinh viên
CREATE PROCEDURE sp_TimKiemSinhVien_TheoMa
    @TuKhoa NVARCHAR(50)
AS
BEGIN
    SELECT * FROM SinhVien WHERE masv LIKE '%' + @TuKhoa + '%'
END
GO

-- 6. Tìm kiếm theo tên sinh viên
CREATE PROCEDURE sp_TimKiemSinhVien_TheoTen
    @TuKhoa NVARCHAR(50)
AS
BEGIN
    SELECT * FROM SinhVien WHERE tensv LIKE '%' + @TuKhoa + '%'
END
GO

-- 7. Tìm kiếm theo mã phòng
CREATE PROCEDURE sp_TimKiemSinhVien_TheoPhong
    @TuKhoa NVARCHAR(50)
AS
BEGIN
    SELECT * FROM SinhVien WHERE maphong LIKE '%' + @TuKhoa + '%'
END
GO

