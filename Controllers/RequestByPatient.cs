using HelloDoc.Data;
using HelloDoc.Models;
using HelloDoc.Models.CV;
using Microsoft.AspNetCore.Mvc;
using System.Collections;
using System.Globalization;
using System.Linq;

namespace HelloDoc.Controllers
{
    public class RequestByPatient : Controller
    {
        #region Configuration
        private readonly ApplicationDbContext _context;
        public RequestByPatient(ApplicationDbContext context)
        {
            _context = context;
        }
        #endregion

        #region Index
        public IActionResult Index()
        {
            return View();
        }
        #endregion

        #region SubmitForSomeoneElse
        public IActionResult SubmitForSomeoneElse()
        {
           
            return View();
        }
        public IActionResult SubmitForMe()
        {
            var ViewPatientCreateRequest = _context.Users
                               .Where(r => r.Userid == Convert.ToInt32(CV.UserID()))
                               .Select(r => new ViewPatientCreateRequest
                               {
                                   FirstName = r.Firstname,
                                   LastName = r.Lastname,
                                   Email = r.Email,
                                   PhoneNumber = r.Mobile,
                                   BirthDate = new DateTime((int)r.Intyear, Convert.ToInt32(r.Strmonth.Trim()), (int)r.Intdate),
                               })
                               .FirstOrDefault();
            return View(ViewPatientCreateRequest);
        }
        #endregion

        #region PostMeAsync
        public async Task<IActionResult> PostMe(ViewPatientCreateRequest viewpatientrequestforme)
        {
            if (ModelState.IsValid)
            {

                var Request = new Request();
                var Requestclient = new Requestclient();

                Request.Requesttypeid = 2;
                Request.Userid = Convert.ToInt32(CV.UserID());
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
                Requestclient.Latitude = viewpatientrequestforme.latitude;
                Requestclient.Longitude = viewpatientrequestforme.longitude;

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
            }
            else
            {
                return View("../RequestByPatient/SubmitForMe", viewpatientrequestforme);
            }
            return RedirectToAction("Index", "Dashboard");
        }
        #endregion

        #region PostSomeoneElseAsync
        public async Task<IActionResult> PostSomeoneElse(ViewPatientCreateRequest viewpatientrequestforme)
        {
            if (ModelState.IsValid)
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
            }
            else
            {
                return View("../RequestByPatient/SubmitForSomeoneElse", viewpatientrequestforme);
            }
            return View();
        }
        #endregion
    }
}
