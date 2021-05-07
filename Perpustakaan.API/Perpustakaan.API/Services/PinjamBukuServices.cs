using Perpustakaan.API.IServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Perpustakaan.API.Models;
using Microsoft.EntityFrameworkCore;

namespace Perpustakaan.API.Services
{
    public class PinjamBukuServices : IPinjamBukuServices
    {
        private TransaksiPerpustakaanContext context;
        public PinjamBukuServices(TransaksiPerpustakaanContext _context)
        {
            context = _context;
        }
        public IEnumerable<PinjamBuku> GetPinjamBuku()
        {
            return context.PinjamBukus.ToList();
        }

        public PinjamBuku GetPinjamBukuById(int id)
        {
            return context.PinjamBukus.FirstOrDefault(x => x.Id == id);
        }

        public PinjamBuku AddPinjamBuku(PinjamBuku pinjamBuku)
        {
            if (pinjamBuku != null)
            {
                context.Add(pinjamBuku);
                context.SaveChanges();

                return pinjamBuku;
            }

            return null;
        }
        public PinjamBuku UpdatePinjamBuku(PinjamBuku pinjamBuku)
        {
            context.Entry(pinjamBuku).State = EntityState.Modified;
            context.SaveChanges();

            return pinjamBuku;
        }

        public PinjamBuku DeletePinjamBuku(int id)
        {
            PinjamBuku pinjamBuku = context.PinjamBukus.FirstOrDefault(x => x.Id == id);

            context.Entry(pinjamBuku).State = EntityState.Deleted;
            context.SaveChanges();

            return pinjamBuku;
        }
    }
}
