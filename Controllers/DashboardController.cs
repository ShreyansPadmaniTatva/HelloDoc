using HelloDoc.Data;
using HelloDoc.Models.CV;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Npgsql;
using System.Configuration;
using System.Data;

namespace HelloDoc.Controllers
{
    [CheckAccess]
    public class DashboardController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly string _connectionString;

        public DashboardController(ApplicationDbContext context, IConfiguration configuration)
        {
            _context = context;
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IActionResult> Index()
        {
          
                var Request = _context.Requests.Where(r => r.Userid == Convert.ToInt32(CV.UserID())).ToList();
                List<int> ids = new List<int>();

                foreach (var request in Request)
                {

                    var doc = _context.Requestwisefiles.Where(r => r.Requestid == request.Requestid).FirstOrDefault();
                    if (doc != null)
                    {
                        ids.Add(request.Requestid);
                    }
                }
                ViewBag.docidlist = ids;
                ViewBag.listofrequest = Request;
           


            return View();
        }
        public IActionResult Indsex()
        {
            var UserIDForRequest = _context.Users.Where(r => r.Aspnetuserid == CV.UserID()).FirstOrDefault();

            if (UserIDForRequest != null)
            {
                List<Models.Request> Request = _context.Requests.Where(r => r.Userid == UserIDForRequest.Userid).ToList();
                List<int> ids = new List<int>();

                foreach (var request in Request)
                {

                    var doc = _context.Requestwisefiles.Where(r => r.Requestid == request.Requestid).FirstOrDefault();
                    if (doc != null)
                    {
                        ids.Add(request.Requestid);
                    }
                }
                ViewBag.docidlist = ids;
                ViewBag.listofrequest = Request;
            }


            return View("Dashboard");
        }
    }
}
