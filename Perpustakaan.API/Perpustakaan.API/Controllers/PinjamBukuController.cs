using Microsoft.AspNetCore.Mvc;
using Perpustakaan.API.IServices;
using Perpustakaan.API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Perpustakaan.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PinjamBukuController : Controller
    {
        private readonly IPinjamBukuServices service;
        public PinjamBukuController(IPinjamBukuServices _service)
        {
            service = _service;
        }

        [HttpGet]
        [Route("[action]")]
        public IEnumerable<PinjamBuku> GetPinjamBuku()
        {
            return service.GetPinjamBuku();
        }

        [HttpGet]
        [Route("[action]")]
        public PinjamBuku GetPinjamBukuById(int id)
        {
            return service.GetPinjamBukuById(id);
        }


        [HttpPost]
        [Route("[action]")]
        public PinjamBuku AddPinjamBuku(PinjamBuku pinjamBuku)
        {
            return service.AddPinjamBuku(pinjamBuku);
        }

        [HttpPut]
        [Route("[action]")]
        public PinjamBuku EditPinjamBuku(PinjamBuku pinjamBuku)
        {
            return service.UpdatePinjamBuku(pinjamBuku);
        }

        [HttpDelete]
        [Route("[action]")]
        public PinjamBuku DeletePinjamBuku(int id)
        {
            return service.DeletePinjamBuku(id);
        }
    }
}
