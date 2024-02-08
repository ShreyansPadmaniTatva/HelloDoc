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
        public async Task<IActionResult> CheckAccessLoginAsync( Aspnetuser aspNetUser)
        {
            var user = await _context.Aspnetusers.FirstOrDefaultAsync(u => u.Email == aspNetUser.Email && u.Passwordhash == aspNetUser.Passwordhash);

            if (user == null)
            {
                ViewData["error"] = "Invalid Id Pass";
                return View("Index");
            }
            else
            {
                return RedirectToAction("Index", "Dashboard");
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        //public async Task<IActionResult> CheckAccessLoginAsync_(string Email, string Password)
        //{


        //    var connection = new NpgsqlConnection(_connectionString);
        //    string Query = "SELECT * FROM  aspnetusers where username=@Email and passwordhash=@Password";
        //    connection.Open();
        //    NpgsqlCommand command = new NpgsqlCommand(Query, connection);
        //    command.Parameters.AddWithValue("@Email", Email);
        //    command.Parameters.AddWithValue("@Password", Password);

        //    NpgsqlDataReader reader = command.ExecuteReader();

        //    DataTable dataTable = new DataTable();
        //    dataTable.Load(reader);
        //    int numRows = dataTable.Rows.Count;
        //    if (numRows > 0)
        //    {
        //        foreach (DataRow dr in dataTable.Rows)
        //        {
        //            HttpContext.Session.SetString("UserName", dr["username"].ToString());
        //            var U = await _context.Users.FirstOrDefaultAsync(m => m.Aspnetuserid == dr["id"].ToString());
        //            HttpContext.Session.SetString("UserID", U.Userid.ToString());
        //            break;
        //        }

        //        return RedirectToAction("Index", "Dashboard");
        //    }
        //    else
        //    {
        //        ViewData["error"] = "Invalid Id Pass";
        //        return View("Index");
        //    }
        //}
        public IActionResult ForgotPassword()
        {
            return View();
        }
    }
}
