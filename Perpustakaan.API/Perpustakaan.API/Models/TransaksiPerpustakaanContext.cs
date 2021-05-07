using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Perpustakaan.API.Models
{
    public partial class TransaksiPerpustakaanContext : DbContext
    {
        public TransaksiPerpustakaanContext()
        {
        }

        public TransaksiPerpustakaanContext(DbContextOptions<TransaksiPerpustakaanContext> options)
            : base(options)
        {
        }

        public virtual DbSet<PinjamBuku> PinjamBukus { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<PinjamBuku>(entity =>
            {
                entity.ToTable("PinjamBuku");

                entity.HasIndex(e => e.BukuId, "IX_PinjamBuku_BukuId");

                entity.HasIndex(e => e.KonsumenId, "IX_PinjamBuku_KosumenId");

                entity.Property(e => e.DiBuatOleh).HasMaxLength(30);

                entity.Property(e => e.DiUbahOleh).HasMaxLength(30);

                entity.Property(e => e.TanggalBuat)
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.TanggalKembali).HasColumnType("datetime");

                entity.Property(e => e.TanggalPinjam).HasColumnType("datetime");

                entity.Property(e => e.TanggalUbah).HasColumnType("datetime");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
