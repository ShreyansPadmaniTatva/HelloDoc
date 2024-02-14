using HelloDoc.Data;
using HelloDoc.Models;
using Humanizer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Differencing;
using Microsoft.EntityFrameworkCore;
using Npgsql;
using NuGet.Protocol.Plugins;
using System.Data;
using System.Net.Mail;
using System.Net;
using System.Text.RegularExpressions;
using HelloDoc.Models.CV;

namespace HelloDoc.Controllers
{
    public class Login : Controller
    {
        #region Configuration
        private readonly EmailConfiguration _emailConfig;
        private readonly ApplicationDbContext _context;
        public Login(ApplicationDbContext context, EmailConfiguration emailConfig)
        {
            _context = context;
            _emailConfig = emailConfig;
        }
        #endregion

        #region Login
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
        #endregion

        #region Forgot_Password
        public IActionResult ForgotPassword()
        {
            return View();
        }

        #region SendMail
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ResetEmail(string Email)
        {
            if (await CheckregisterdAsync(Email))
            {
                // create pass and storde pass
                var aspnetuser = await _context.Aspnetusers.FirstOrDefaultAsync(m => m.Email == Email);
                //var retive = await _context.Aspnetusers.FirstOrDefaultAsync(m => m.Email == Email);
                //aspnetuser.Username = retive.Username;
                //aspnetuser.CreatedDate = retive.CreatedDate;
                aspnetuser.Passwordhash = RandomString(6);
                aspnetuser.Modifieddate = DateTime.Now;
                try
                {
                    _context.Update(aspnetuser);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AspnetuserExists(aspnetuser.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }

                var Subject = "Change PassWord";
                var Body = "<html><body>Your UserName <b>" + aspnetuser.Username + "</b> <br/> Your PassWord <b>" + aspnetuser.Passwordhash + "</b> </body></html>"; ;

               _emailConfig.SendMail(Email, Subject, Body);

                

                ViewData["EmailCheck"] = "Your ID Pass Send In Your Mail";
            }
            else
            {
                 ViewData["EmailCheck"] = "Your Email Is not registered";
                return View("ForgotPassword");
            }
            return View("Index");
        }
        #endregion
        public async Task<bool> CheckregisterdAsync(string email)
        {
            string pattern = @"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";

            if (!string.IsNullOrEmpty(email) && Regex.IsMatch(email, pattern)) {

                var U = await  _context.Aspnetusers.FirstOrDefaultAsync(m => m.Email == email);
                if(U != null)
                {
                    return true;
                }
            }

            return false;
        }
        private static Random random = new Random();

        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        private bool AspnetuserExists(string id)
        {
            return (_context.Aspnetusers?.Any(e => e.Id == id)).GetValueOrDefault();
        }
        #endregion

        #region Logout
        public IActionResult LogOut()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "SubmitRequest");
        }
        #endregion

        #region Create_Account

        public IActionResult CreateAccount()
        {
            return View();
        }
        
        public async Task<IActionResult> CreatNewAccont(string Email, string Password)
        {
            Guid id = Guid.NewGuid();
            Aspnetuser aspnetuser = new Aspnetuser
            {
                Id = id.ToString(),
                Email = Email,
                Passwordhash = Password,
                Username = Email
            };
            _context.Aspnetusers.Add(aspnetuser);
            await _context.SaveChangesAsync();
            var U = await _context.Requestclients.FirstOrDefaultAsync(m => m.Email == Email);
            var User = new User
            {
                Aspnetuserid = aspnetuser.Id,
                Firstname = U.Firstname,

                Email = Email,
                Createdby = aspnetuser.Id,
                Createddate = DateTime.Now,

            };
            _context.Users.Add(User);
            await _context.SaveChangesAsync();




            List<Requestclient> rc = new List<Requestclient>();
            rc = _context.Requestclients.Where(e => e.Email == Email).ToList();
            foreach (var r in rc)
            {
                NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Database=HalloDoc;User Id=postgres;Password=%^78TYui;Include Error Detail=True");
                string Query = "Update request set userid=@UserID where requestid=@RequestID";
                connection.Open();
                NpgsqlCommand command = new NpgsqlCommand(Query, connection);
                command.Parameters.AddWithValue("@userid", User.Userid);
                command.Parameters.AddWithValue("@requestid", r.Requestid);
                command.ExecuteNonQuery();
            }




            HttpContext.Session.SetString("UserName", aspnetuser.Username);
            HttpContext.Session.SetString("UserID", aspnetuser.Id.ToString());


            return RedirectToAction("Index", "Dashboard");
        }


        #endregion
    }
}
