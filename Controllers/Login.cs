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

namespace HelloDoc.Controllers
{
    public class Login : Controller
    {
        private readonly EmailConfiguration _emailConfig;
        private readonly ApplicationDbContext _context;
        public Login(ApplicationDbContext context, EmailConfiguration emailConfig)
        {
            _context = context;
            _emailConfig = emailConfig;
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
                aspnetuser.Passwordhash = RandomString(5);
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
                ServicePointManager.ServerCertificateValidationCallback =
    (sender, certificate, chain, sslPolicyErrors) => true;

                //send mail
                MailMessage message = new MailMessage();
                message.From = new MailAddress(_emailConfig.From);
                message.Subject = "Change PassWord";
                message.To.Add(new MailAddress(Email));
                message.Body = "<html><body>Your UserName <b>"+ aspnetuser.Passwordhash + "</b> <br/> Your PassWord <b>" + Email + "</b> </body></html>";
                message.IsBodyHtml = true;
                using (var smtpClient = new SmtpClient(_emailConfig.SmtpServer))
                {
                    smtpClient.Port = _emailConfig.Port;
                    smtpClient.Credentials = new NetworkCredential(_emailConfig.UserName, _emailConfig.Password);
                    smtpClient.EnableSsl = true;

                    smtpClient.Send(message);
                }
            }
            else
            {

            }
            

            return View("Index");
        }
       
        public  async Task<bool> CheckregisterdAsync(string email)
        {
            string pattern = @"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$";

            if (!string.IsNullOrEmpty(email) && Regex.IsMatch(email, pattern)) {

                var U = await  _context.Aspnetusers.FirstOrDefaultAsync(m => m.Email == email);
                if(U.Id != null)
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
    
}
}
