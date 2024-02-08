using HelloDoc.Data;
using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections;

namespace HelloDoc.Controllers
{
    public class PatientCreateRequest : Controller
    {
        private readonly ApplicationDbContext _context;
        public PatientCreateRequest(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CheckEmailAsync(string email)
        {
            string message;
            string Data = "0";
            var aspnetuser = await _context.Aspnetusers.FirstOrDefaultAsync(m => m.Email == email);
            //await _context.SaveChangesAsync();
            if (aspnetuser == null)
            {
                message = "False";

                Data = "0";
            }
            else
            {
                 message = "success";
                var user = await _context.Users.FirstOrDefaultAsync(m => m.Aspnetuserid == aspnetuser.Id.ToString());
                HttpContext.Session.SetString("UserName", aspnetuser.Username.ToString());
                HttpContext.Session.SetString("UserID", user.Userid.ToString());
                Data = user.Userid.ToString();
            }
            return Json(new
            {
                Data,
                Message = message,
            });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(ViewPatientCreateRequest viewpatientcreaterequest)
        {
            var Aspnetuser = new Aspnetuser();
            var User = new User();
            var Request = new Request();
            var Requestclient = new Requestclient();

           

            if (viewpatientcreaterequest.UserName != null  && viewpatientcreaterequest.PassWord != null)
            {
                // Aspnetuser
                Aspnetuser.Id = new Guid().ToString();
                Aspnetuser.Username =  viewpatientcreaterequest.UserName;
                Aspnetuser.Passwordhash =  viewpatientcreaterequest.PassWord;
                Aspnetuser.CreatedDate = DateTime.Now;
               _context.Aspnetusers.Add(Aspnetuser);
                await _context.SaveChangesAsync();

                User.Aspnetuserid = Aspnetuser.Id;
                User.Firstname = viewpatientcreaterequest.FirstName;
                User.Lastname = viewpatientcreaterequest.LastName;
                User.Email = viewpatientcreaterequest.Email;
                User.Createdby = Aspnetuser.Id;
                User.Createddate = DateTime.Now;
                _context.Users.Add(User);
                await _context.SaveChangesAsync();

                Request.Requesttypeid = 2;
                Request.Userid = User.Userid;
                Request.Firstname = viewpatientcreaterequest.FirstName;
                Request.Lastname = viewpatientcreaterequest.LastName;
                Request.Email = viewpatientcreaterequest.Email;
                Request.Phonenumber = viewpatientcreaterequest.PhoneNumber;
                Request.Isurgentemailsent = new BitArray(1);
                Request.Createddate = DateTime.Now;
                _context.Requests.Add(Request);
                await _context.SaveChangesAsync();

                Requestclient.Requestid = Request.Requestid;
                Requestclient.Firstname = viewpatientcreaterequest.FirstName;
                Requestclient.Address = viewpatientcreaterequest.Street;
                Requestclient.Lastname = viewpatientcreaterequest.LastName;
                Requestclient.Email = viewpatientcreaterequest.Email;
                Requestclient.Phonenumber = viewpatientcreaterequest.PhoneNumber;
                
                _context.Requestclients.Add(Requestclient);
                await _context.SaveChangesAsync();

                if (viewpatientcreaterequest.UploadFile != null)
                {
                    string FilePath = "wwwroot\\Upload";
                    string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);

                    string fileNameWithPath = Path.Combine(path, viewpatientcreaterequest.UploadFile.FileName);
                    viewpatientcreaterequest.UploadImage = "~" + FilePath.Replace("wwwroot\\", "/") + "/" + viewpatientcreaterequest.UploadFile.FileName;

                    using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                    {
                        viewpatientcreaterequest.UploadFile.CopyTo(stream);
                    }

                    var requestwisefile = new Requestwisefile
                    {
                        Requestid = Request.Requestid,
                        Filename = viewpatientcreaterequest.UploadImage,
                        Createddate = DateTime.Now,
                    };
                    _context.Requestwisefiles.Add(requestwisefile);
                    _context.SaveChanges();
                }


                return RedirectToAction("Index", "Dashboard");
            }
            else if (viewpatientcreaterequest.UserId != 0)
            {
               

                Request.Requesttypeid = 2;
                Request.Userid = viewpatientcreaterequest.UserId;
                Request.Firstname = viewpatientcreaterequest.FirstName;
                Request.Lastname = viewpatientcreaterequest.LastName;
                Request.Email = viewpatientcreaterequest.Email;
                Request.Phonenumber = viewpatientcreaterequest.PhoneNumber;
                Request.Isurgentemailsent = new BitArray(1);
                Request.Createddate = DateTime.Now;
                _context.Requests.Add(Request);
                await _context.SaveChangesAsync();

                Requestclient.Requestid = Request.Requestid;
                Requestclient.Firstname = viewpatientcreaterequest.FirstName;
                Requestclient.Address = viewpatientcreaterequest.Street;
                Requestclient.Lastname = viewpatientcreaterequest.LastName;
                Requestclient.Email = viewpatientcreaterequest.Email;
                Requestclient.Phonenumber = viewpatientcreaterequest.PhoneNumber;

                _context.Requestclients.Add(Requestclient);
                await _context.SaveChangesAsync();
                if (viewpatientcreaterequest.UploadFile != null)
                {
                    string FilePath = "wwwroot\\Upload";
                    string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);

                    if (!Directory.Exists(path))
                        Directory.CreateDirectory(path);

                    string fileNameWithPath = Path.Combine(path, viewpatientcreaterequest.UploadFile.FileName);
                    viewpatientcreaterequest.UploadImage = "~" + FilePath.Replace("wwwroot\\", "/") + "/" + viewpatientcreaterequest.UploadFile.FileName;

                    using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                    {
                        viewpatientcreaterequest.UploadFile.CopyTo(stream);
                    }

                    var requestwisefile = new Requestwisefile
                    {
                        Requestid = Request.Requestid,
                        Filename = viewpatientcreaterequest.UploadImage,
                        Createddate = DateTime.Now,
                    };
                    _context.Requestwisefiles.Add(requestwisefile);
                    _context.SaveChanges();
                }

                return RedirectToAction("Index", "Dashboard");
            }
            
            return RedirectToAction("Index", "Aspnetusers");
        }
    }
}
