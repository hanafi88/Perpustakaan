CREATE DATABASE [MasterPerpustakaan]
GO

USE [MasterPerpustakaan]
GO

/****** Object:  Table [dbo].[Buku]    Script Date: 5/6/2021 9:29:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Buku](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NIB] [nvarchar](20) NOT NULL,
	[Nama] [nvarchar](100) NULL,
	[Penulis] [nvarchar](100) NULL,
	[Penerbit] [nvarchar](100) NULL,
	[Tahun] [int] NULL,
	[TanggalBuat] [datetime] NOT NULL,
	[DiBuatOleh] [nvarchar](30) NULL,
	[TanggalUbah] [datetime] NULL,
	[DiUbahOleh] [nvarchar](30) NULL,
 CONSTRAINT [IX_Buku_NIB] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Buku] ADD  CONSTRAINT [DF_Buku_TanggalBuat]  DEFAULT (getdate()) FOR [TanggalBuat]
GO

USE [MasterPerpustakaan]
GO

/****** Object:  Table [dbo].[Buku]    Script Date: 5/7/2021 8:31:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Buku](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NIB] [nvarchar](20) NOT NULL,
	[Nama] [nvarchar](100) NULL,
	[Penulis] [nvarchar](100) NULL,
	[Penerbit] [nvarchar](100) NULL,
	[Tahun] [int] NULL,
	[TanggalBuat] [datetime] NOT NULL,
	[DiBuatOleh] [nvarchar](30) NULL,
	[TanggalUbah] [datetime] NULL,
	[DiUbahOleh] [nvarchar](30) NULL,
 CONSTRAINT [PK_Buku] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Buku_NIB] UNIQUE NONCLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Buku] ADD  CONSTRAINT [DF_Buku_TanggalBuat]  DEFAULT (getdate()) FOR [TanggalBuat]
GO



USE [MasterPerpustakaan]
GO

/****** Object:  Table [dbo].[Karyawan]    Script Date: 5/7/2021 8:32:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Karyawan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NIK] [nvarchar](20) NOT NULL,
	[Nama] [nvarchar](100) NULL,
	[NomorHP] [nvarchar](20) NULL,
	[Alamat] [nvarchar](250) NULL,
	[TanggalBuat] [datetime] NULL,
	[DiBuatOleh] [nvarchar](30) NULL,
	[TanggalUbah] [datetime] NULL,
	[DiUbahOleh] [nvarchar](30) NULL,
 CONSTRAINT [PK_Karyawan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Karyawan_NIK] UNIQUE NONCLUSTERED 
(
	[NIK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Karyawan] ADD  CONSTRAINT [DF_Karyawan_TanggalBuat]  DEFAULT (getdate()) FOR [TanggalBuat]
GO





USE [MasterPerpustakaan]
GO

/****** Object:  Table [dbo].[Konsumen]    Script Date: 5/7/2021 8:33:49 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Konsumen](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NIK] [nvarchar](20) NULL,
	[Nama] [nvarchar](100) NULL,
	[NomorHP] [nvarchar](20) NULL,
	[Alamat] [nvarchar](250) NULL,
	[TanggalBuat] [datetime] NULL,
	[DiBuatOleh] [nvarchar](30) NULL,
	[TanggalUbah] [datetime] NULL,
	[DiUbahOleh] [nvarchar](30) NULL,
 CONSTRAINT [PK_Konsumen] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Konsumen_NIK] UNIQUE NONCLUSTERED 
(
	[NIK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Konsumen] ADD  CONSTRAINT [DF_Konsumen_TanggalBuat]  DEFAULT (getdate()) FOR [TanggalBuat]
GO





Create DATABASE [TransaksiPerpustakaan] 
GO


USE [TransaksiPerpustakaan]
GO

/****** Object:  Table [dbo].[PinjamBuku]    Script Date: 5/7/2021 8:35:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PinjamBuku](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KonsumenId] [int] NULL,
	[BukuId] [int] NULL,
	[TanggalPinjam] [datetime] NULL,
	[DurasiHari] [int] NULL,
	[TanggalKembali] [datetime] NULL,
	[TanggalBuat] [datetime] NULL,
	[DiBuatOleh] [nvarchar](30) NULL,
	[TanggalUbah] [datetime] NULL,
	[DiUbahOleh] [nvarchar](30) NULL,
 CONSTRAINT [PK_PinjamBuku] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PinjamBuku] ADD  CONSTRAINT [DF_PinjamBuku_TanggalBuat]  DEFAULT (getdate()) FOR [TanggalBuat]
GO



