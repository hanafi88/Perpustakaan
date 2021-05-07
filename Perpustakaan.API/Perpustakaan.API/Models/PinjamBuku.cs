using System;
using System.Collections.Generic;

#nullable disable

namespace Perpustakaan.API.Models
{
    public partial class PinjamBuku
    {
        public int Id { get; set; }
        public int? KonsumenId { get; set; }
        public int? BukuId { get; set; }
        public DateTime? TanggalPinjam { get; set; }
        public int? DurasiHari { get; set; }
        public DateTime? TanggalKembali { get; set; }
        public DateTime? TanggalBuat { get; set; }
        public string DiBuatOleh { get; set; }
        public DateTime? TanggalUbah { get; set; }
        public string DiUbahOleh { get; set; }
    }
}
