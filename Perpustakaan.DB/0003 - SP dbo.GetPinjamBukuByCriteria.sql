create proc dbo.GetPinjamBukuByCriteria 
	@NIKKonsumen nvarchar(20),
	@NamaKonsumen nvarchar(100),
	@NamaKaryawan nvarchar(30),
	@NamaBuku nvarchar(100),
	@NIB nvarchar(20),
	@TanggalPinjam datetime = NULL,
	@TanggalKembali datetime = NULL
as
begin
	if len(@NIKKonsumen) > 0
	begin
		select a.*
		from PinjamBuku a
		join MasterPerpustakaan..Konsumen b ON a.KonsumenId = b.Id
		where b.NIK LIKE @NIKKonsumen
		order by a.TanggalBuat desc
	end
	else if len(@NamaKonsumen) > 0
	begin
		select a.*
		from PinjamBuku a
		join MasterPerpustakaan..Konsumen b ON a.KonsumenId = b.Id
		where b.Nama LIKE @NamaKonsumen
		order by a.TanggalBuat desc
	end
	else if len(@NamaKaryawan) > 0
	begin
		select a.*
		from PinjamBuku a
		where a.DiBuatOleh LIKE @NamaKaryawan
		order by a.TanggalBuat desc
	end
	else if len(@NamaBuku) > 0
	begin
		select a.*
		from PinjamBuku a
		join MasterPerpustakaan..Buku b on a.BukuId = b.Id
		where b.Nama LIKE @NamaBuku
		order by a.TanggalBuat desc
	end
	else if len(@NIB) > 0
	begin
		select a.*
		from PinjamBuku a
		join MasterPerpustakaan..Buku b on a.BukuId = b.Id
		where b.NIB LIKE @NIB
		order by a.TanggalBuat desc
	end
	else if @TanggalPinjam IS NOT NULL
	begin
		select a.*
		from PinjamBuku a
		where cast(a.TanggalPinjam as date) = cast(@TanggalPinjam as date)
		order by a.TanggalBuat desc
	end
	else if @TanggalKembali IS NOT NULL
	begin
		select a.*
		from PinjamBuku a
		where cast(a.TanggalKembali as date) = cast(@TanggalKembali as date)
		order by a.TanggalBuat desc
	end
end