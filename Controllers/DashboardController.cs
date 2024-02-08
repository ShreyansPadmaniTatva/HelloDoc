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
            var s = _context.Requests.Where(b => b.Userid == Convert.ToInt32(CV.UserID())).ToList();


            return View(s);
        }
    }
}
