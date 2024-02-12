using HelloDoc.Data;
using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HelloDoc.Controllers
{
    [CheckAccess]
    public class DocumentsinfoController : Controller
    {
        private readonly ApplicationDbContext _context;

        public DocumentsinfoController(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index(int? id)
        {
            List<Requestclient> Request = _context.Requestclients.Where(r => r.Requestid == id).ToList();
            ViewBag.requestinfo = Request;
            List<Requestwisefile> DocList = _context.Requestwisefiles.Where(r => r.Requestid == id).ToList();
            ViewBag.DocList = DocList;

            return View();
        }
        public IActionResult UploadDoc(int Requestid,IFormFile file)
        {
            string UploadDoc;
            if (file != null)
            {
                string FilePath = "wwwroot\\Upload";
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileNameWithPath = Path.Combine(path, file.FileName);
                UploadDoc = "~" + FilePath.Replace("wwwroot\\", "/") + "/" + file.FileName;

                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    file.CopyTo(stream);
                }

                var requestwisefile = new Requestwisefile
                {
                    Requestid = Requestid,
                    Filename = UploadDoc,
                    Createddate = DateTime.Now,
                };
                _context.Requestwisefiles.Add(requestwisefile);
                _context.SaveChanges();
            }

            return RedirectToAction("Index", new { id = Requestid } );
        }
    }
   
}
