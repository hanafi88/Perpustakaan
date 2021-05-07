USE MasterPerpustakaan 

-- INITIAL DATA FOR BUKU
DECLARE @I AS INT
SET @I = 0
WHILE @I < 10
BEGIN
	INSERT INTO Buku (NIB,Nama,Penulis,Penerbit,Tahun,TanggalBuat,DiBuatOleh)
	VALUES ('BUKU-00000' + cast(@I as nvarchar(20)), 'Sudahkah Anda Sholat ' + cast(@I as nvarchar(10)), 'Hamba Allah', 'Mizan', 2000+@I, getdate(), 'hanafi_001')

	SET @I = @I + 1
END
--truncate table Buku
select * from Buku

--INITIAL DATA FOR KONSUMEN --DECLARE @I AS INT
SET @I = 0
WHILE @I < 10
BEGIN
	INSERT INTO Konsumen (NIK, Nama, NomorHP, Alamat, TanggalBuat, DiBuatOleh)
	VALUES ('ANGGOTA-00000' + cast(@I as nvarchar(20)), 'Muhammad Hanafi ' + cast(@I as nvarchar(10)), '081289850252', 'Cileungsi', getdate(), 'hanafi_001')

	SET @I = @I + 1
END
--truncate table Konsumen
select * from Konsumen


SET @I = 0
WHILE @I < 10
BEGIN
	INSERT INTO Karyawan (NIK, Nama, NomorHP, Alamat, TanggalBuat, DiBuatOleh)
	VALUES ('KARYAWAN-00000' + cast(@I as nvarchar(20)), 'Muhammad Hanafi ' + cast(@I as nvarchar(10)), '081289850252', 'Cileungsi', getdate(), 'hanafi_001')

	SET @I = @I + 1
END
--truncate table Karyawan
select * from Karyawan



