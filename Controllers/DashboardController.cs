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
        #region Configuration
        private readonly ApplicationDbContext _context;

        public DashboardController(ApplicationDbContext context)
        {
            _context = context;
        }
        #endregion

        #region Index
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
        #endregion
    }
}
