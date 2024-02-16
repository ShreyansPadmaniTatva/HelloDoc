﻿using HelloDoc.Data;
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
using System.Collections;
using static System.Net.WebRequestMethods;
using System;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Globalization;
using System.Text;
using Microsoft.AspNetCore.Identity;
using Microsoft.SqlServer.Server;
using Microsoft.CodeAnalysis.Scripting;

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

        #region Start_session
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CheckAccessLoginAsync(Aspnetuser aspNetUser)
        {
            var user = await _context.Aspnetusers.FirstOrDefaultAsync(u => u.Username == aspNetUser.Username);
            if (user != null)
            {
                var hasher = new PasswordHasher<string>();
                PasswordVerificationResult result = hasher.VerifyHashedPassword(null, user.Passwordhash,aspNetUser.Passwordhash );
                if (result != PasswordVerificationResult.Success)
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
            }
           

            return RedirectToAction(nameof(Index));
        }
        #endregion

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
                var Subject = "Change PassWord";
                var Body = "<html><body> your reset pas link is http://localhost:42161/Login/ResetPassWord?Datetime=" + _emailConfig.Encode(DateTime.Now.ToString("MM/dd/yyyy hh:mm:ss tt")) +"&email="+ _emailConfig.Encode(Email)  + " </body></html>"; ;

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

        #region Help_functions
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

        #endregion

        #region Logout
        public IActionResult LogOut()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "SubmitRequest");
        }
        #endregion

        #region Reset_Password
         #region ResetPassWord
        public async Task<IActionResult> ResetPassWord(string? Datetime, string? email)
        {
            string Decodee = _emailConfig.Decode(email);
            DateTime s = DateTime.ParseExact(_emailConfig.Decode(Datetime),"MM/dd/yyyy hh:mm:ss tt",CultureInfo.InvariantCulture);
            TimeSpan dif =  s - DateTime.Now;
            if (dif.Hours < 24)
            {
                ViewBag.email = Decodee;
                return View();
                 
            }
            else
            {
                ViewBag.TotalStudents = "Url is expaier";
            }
            return View();
        }
        #endregion

         #region ResetPassWord_SavePassAsync
        public async Task<IActionResult> SavePassAsync(string ConfirmPassword, string Password,string Email)
        {
            if (Password != null)
            {
                if (ConfirmPassword != Password)
                {
                    ViewData["error"] = "Pass is Mismatch";
                    return View("ResetPassWord");
                }
                try
                {
                    Aspnetuser U = await _context.Aspnetusers.FirstOrDefaultAsync(m => m.Email == Email);
                    var hasher = new PasswordHasher<string>();
                    U.Passwordhash = hasher.HashPassword(null, Password); ;
                    _context.Update(U);
                    await _context.SaveChangesAsync();
                    ViewData["error"] = "Pass is Upadated";
                }
                catch (DbUpdateConcurrencyException)
                {
                      
                }
            }
            return View("Index");
        }
        #endregion
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
                Isrequestwithemail = new BitArray(1),

            };
            _context.Users.Add(User);
            await _context.SaveChangesAsync();

            var rc = _context.Requestclients.Where(e => e.Email == Email).ToList();

            foreach (var r in rc)
            {
                _context.Requests.Where(n => n.Requestid == r.Requestid)
               .ExecuteUpdate(s => s.SetProperty(
                   n => n.Userid,
                   n => User.Userid));
            }

            HttpContext.Session.SetString("UserName", aspnetuser.Username.ToString());
            HttpContext.Session.SetString("UserID", User.Userid.ToString());

            return RedirectToAction("Index", "Dashboard");
        }


        #endregion
    }
}
