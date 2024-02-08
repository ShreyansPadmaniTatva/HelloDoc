using HelloDoc.Data;
using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Differencing;
using Microsoft.EntityFrameworkCore;
using Npgsql;
using System.Data;

namespace HelloDoc.Controllers
{
    public class Login : Controller
    {
        private readonly ApplicationDbContext _context;
        public Login(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CheckAccessLoginAsync(Aspnetuser aspNetUser)
        {
            var user = await _context.Aspnetusers.FirstOrDefaultAsync(u => u.Username == aspNetUser.Username && u.Passwordhash == aspNetUser.Passwordhash);

            if (user == null)
            {
                ViewData["error"] = "Invalid Id Pass";
                return View("Index");
            }
            else
            {
                HttpContext.Session.SetString("UserName", user.Username.ToString());
                var U = await _context.Users.FirstOrDefaultAsync(m => m.Aspnetuserid == user.Id.ToString());
                HttpContext.Session.SetString("UserID", U.Userid.ToString());
                return RedirectToAction("Index", "Dashboard");
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        public IActionResult ForgotPassword()
        {
            return View();
        }
    }
}
