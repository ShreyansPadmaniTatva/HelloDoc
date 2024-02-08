using HelloDoc.Data;
using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
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

        public IActionResult Checkemail()
        {
            return Json();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(ViewPatientCreateRequest viewpatientcreaterequest)
        {
            var Aspnetuser = new Aspnetuser();
            var User = new User();
            var Request = new Request();
            var Requestclient = new Requestclient();

            if (ModelState.IsValid)
            {
                // Aspnetuser
                Aspnetuser.Id = new Guid().ToString();
                Aspnetuser.Username =  viewpatientcreaterequest.UserName;
                Aspnetuser.Passwordhash =  viewpatientcreaterequest.PassWord;
                Aspnetuser.CreatedDate = DateTime.Now;
               _context.Aspnetusers.Add(Aspnetuser);
                await _context.SaveChangesAsync();

                User.Aspnetuserid = viewpatientcreaterequest.Id;
                User.Firstname = viewpatientcreaterequest.FirstName;
                User.Lastname = viewpatientcreaterequest.LastName;
                User.Email = viewpatientcreaterequest.Email;
                User.Createdby = viewpatientcreaterequest.Id;
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


                return RedirectToAction("Index", "Dashboard");
            }

            return RedirectToAction("Index", "Aspnetusers");
        }
    }
}
