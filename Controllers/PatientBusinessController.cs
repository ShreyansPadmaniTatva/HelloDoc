using HelloDoc.Data;
using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections;

namespace HelloDoc.Controllers
{
    public class PatientBusinessController : Controller
    {
        #region Configuration
        public ApplicationDbContext _context;
        public PatientBusinessController(ApplicationDbContext context)
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

        #region Post
        public async Task<IActionResult> Post(ViewPatientBusiness viewdata)
        {
            var Business = new Business();
            var Request = new Request();
            var Requestclient = new Requestclient();
            var Requestbusiness = new Requestbusiness();

            Business.Name = viewdata.BUP_FirstName + viewdata.BUP_LastName;

            Business.Createddate = DateTime.Now;
            _context.Businesses.Add(Business);
            await _context.SaveChangesAsync();
            int id1 = Business.Businessid;


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
            int id2 = Request.Requestid;

            Requestclient.Requestid = Request.Requestid;
            Requestclient.Firstname = viewdata.FirstName;
            Requestclient.Lastname = viewdata.LastName;
            Requestclient.Email = viewdata.Email;
            Requestclient.Phonenumber = viewdata.PhoneNumber;
            _context.Requestclients.Add(Requestclient);
            await _context.SaveChangesAsync();

            Requestbusiness.Requestid = id2;
            Requestbusiness.Businessid = id1;

            _context.Requestbusinesses.Add(Requestbusiness);
            await _context.SaveChangesAsync();


            return RedirectToAction("Index", "SubmitRequest");

        }
        #endregion
    }
}
