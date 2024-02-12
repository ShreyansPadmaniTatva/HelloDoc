using HelloDoc.Data;
using HelloDoc.Models;
using HelloDoc.Models.CV;
using Microsoft.AspNetCore.Mvc;
using System.Collections;

namespace HelloDoc.Controllers
{
    public class RequestByPatient : Controller
    {
        private readonly ApplicationDbContext _context;
        public RequestByPatient(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult SubmitForSomeoneElse()
        {
            return View();
        }
        public IActionResult SubmitForMe()
        {
            return View();
        }
        public async Task<IActionResult> PostMeAsync(ViewPatientCreateRequest viewpatientrequestforme)
        {
            var Request = new Request();
            var Requestclient = new Requestclient();

            Request.Requesttypeid = 2;
            Request.Userid = Convert.ToInt32(CV.UserID())   ;
            Request.Firstname = viewpatientrequestforme.FirstName;
            Request.Lastname = viewpatientrequestforme.LastName;
            Request.Email = viewpatientrequestforme.Email;
            Request.Phonenumber = viewpatientrequestforme.PhoneNumber;
            Request.Isurgentemailsent = new BitArray(1);
            Request.Createddate = DateTime.Now;
            _context.Requests.Add(Request);
            await _context.SaveChangesAsync();

            Requestclient.Requestid = Request.Requestid;
            Requestclient.Firstname = viewpatientrequestforme.FirstName;
            Requestclient.Address = viewpatientrequestforme.Street;
            Requestclient.Lastname = viewpatientrequestforme.LastName;
            Requestclient.Email = viewpatientrequestforme.Email;
            Requestclient.Phonenumber = viewpatientrequestforme.PhoneNumber;

            _context.Requestclients.Add(Requestclient);
            await _context.SaveChangesAsync();


            if (viewpatientrequestforme.UploadFile != null)
            {
                string FilePath = "wwwroot\\Upload";
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileNameWithPath = Path.Combine(path, viewpatientrequestforme.UploadFile.FileName);
                viewpatientrequestforme.UploadImage = "~" + FilePath.Replace("wwwroot\\", "/") + "/" + viewpatientrequestforme.UploadFile.FileName;

                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    viewpatientrequestforme.UploadFile.CopyTo(stream);
                }

                var requestwisefile = new Requestwisefile
                {
                    Requestid = Request.Requestid,
                    Filename = viewpatientrequestforme.UploadImage,
                    Createddate = DateTime.Now,
                };
                _context.Requestwisefiles.Add(requestwisefile);
                _context.SaveChanges();
            }

            return RedirectToAction("Index", "Dashboard");
        }
        public async Task<IActionResult> PostSomeoneElseAsync(ViewPatientCreateRequest viewpatientrequestforme)
        {
            var Request = new Request();
            var Requestclient = new Requestclient();

            Request.Requesttypeid = 2;
            Request.Userid = Convert.ToInt32(CV.UserID());
            Request.Firstname = viewpatientrequestforme.FirstName;
            Request.Lastname = viewpatientrequestforme.LastName;
            Request.Email = viewpatientrequestforme.Email;
            Request.Phonenumber = viewpatientrequestforme.PhoneNumber;
            Request.Relationname = viewpatientrequestforme.Realtion;
            Request.Isurgentemailsent = new BitArray(1);
            Request.Createddate = DateTime.Now;
            _context.Requests.Add(Request);
            await _context.SaveChangesAsync();

            Requestclient.Requestid = Request.Requestid;
            Requestclient.Firstname = viewpatientrequestforme.FirstName;
            Requestclient.Address = viewpatientrequestforme.Street;
            Requestclient.Lastname = viewpatientrequestforme.LastName;
            Requestclient.Email = viewpatientrequestforme.Email;
            Requestclient.Phonenumber = viewpatientrequestforme.PhoneNumber;

            _context.Requestclients.Add(Requestclient);
            await _context.SaveChangesAsync();


            if (viewpatientrequestforme.UploadFile != null)
            {
                string FilePath = "wwwroot\\Upload";
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);

                string fileNameWithPath = Path.Combine(path, viewpatientrequestforme.UploadFile.FileName);
                viewpatientrequestforme.UploadImage = "~" + FilePath.Replace("wwwroot\\", "/") + "/" + viewpatientrequestforme.UploadFile.FileName;

                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    viewpatientrequestforme.UploadFile.CopyTo(stream);
                }

                var requestwisefile = new Requestwisefile
                {
                    Requestid = Request.Requestid,
                    Filename = viewpatientrequestforme.UploadImage,
                    Createddate = DateTime.Now,
                };
                _context.Requestwisefiles.Add(requestwisefile);
                _context.SaveChanges();
            }

            return View();
        }

    }
}
