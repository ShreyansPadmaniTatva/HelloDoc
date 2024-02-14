using HelloDoc.Data;
using HelloDoc.Models;
using HelloDoc.Models.CV;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HelloDoc.Controllers
{
    [CheckAccess]
    public class DocumentsinfoController : Controller
    {
        #region Configuration
        private readonly ApplicationDbContext _context;

        public DocumentsinfoController(ApplicationDbContext context)
        {
            _context = context;
        }
        #endregion

        #region Index
        public IActionResult Index(int? id)
        {
            var result = _context.Requestwisefiles
                        .Where(r => r.Requestid == id)
                        .OrderByDescending(x => x.Createddate)
                        .Select(r => new ViewPatientDashboard
                        {
                            Requestid = r.Requestid,
                            Createddate = r.Createddate,
                            Filename = r.Filename

                        })
                        .ToList();

            
            return View(result);
        }
        #endregion

        #region UploadDoc_Files
        public IActionResult UploadDoc(int Requestid,IFormFile file)
        {
            string UploadDoc;
            if (file != null)
            {
                string FilePath = "wwwroot\\Upload\\" + Requestid;
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string newfilename = $"{Path.GetFileNameWithoutExtension(file.FileName)}-{DateTime.Now.ToString("yyyyMMddhhmmss")}.{Path.GetExtension(file.FileName).Trim('.')}";

                string fileNameWithPath = Path.Combine(path, newfilename);
                UploadDoc = FilePath.Replace("wwwroot\\Upload\\", "/Upload/") + "/" + newfilename;
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
        #endregion
    }
}
