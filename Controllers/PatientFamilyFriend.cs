using HelloDoc.Data;
using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections;

namespace HelloDoc.Controllers
{
    public class PatientFamilyFriend : Controller
    {
        private readonly ApplicationDbContext _context;

        public PatientFamilyFriend(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Post(ViewPatientFamilyFriend viewdata)
        {

            var Request = new Request();
            var Requestclient = new Requestclient();

            Request.Requesttypeid = 3;
            Request.Status = 1;
            Request.Firstname = viewdata.FirstName;
            Request.Lastname = viewdata.LastName;
            Request.Email = viewdata.Email;
            Request.Phonenumber = viewdata.PhoneNumber;
            Request.Isurgentemailsent = new BitArray(1);
            Request.Createddate = DateTime.Now;
            _context.Requests.Add(Request);
            await _context.SaveChangesAsync();

            Requestclient.Requestid = Request.Requestid;
            Requestclient.Firstname = viewdata.FirstName;
            Requestclient.Address = viewdata.Street;
            Requestclient.Lastname = viewdata.LastName;
            Requestclient.Email = viewdata.Email;
            Requestclient.Phonenumber = viewdata.PhoneNumber;

            _context.Requestclients.Add(Requestclient);
            await _context.SaveChangesAsync();


            return RedirectToAction("Index", "SubmitRequest");

        }
    }
}
