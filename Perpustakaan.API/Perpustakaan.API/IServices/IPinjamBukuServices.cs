using Perpustakaan.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Perpustakaan.API.IServices
{
    public interface IPinjamBukuServices
    {
        IEnumerable<PinjamBuku> GetPinjamBuku();
        PinjamBuku GetPinjamBukuById(int id);
        PinjamBuku AddPinjamBuku(PinjamBuku pinjamBuku);
        PinjamBuku UpdatePinjamBuku(PinjamBuku pinjamBuku);
        PinjamBuku DeletePinjamBuku(int id);

    }
}
