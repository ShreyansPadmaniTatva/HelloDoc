﻿using HelloDoc.Data;
using HelloDoc.Models;
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
            //ViewPatientDashboard 
            var result = _context.Requests
                         .Where(r => r.Userid == Convert.ToInt32(CV.UserID()))
                         .OrderByDescending(x => x.Createddate)
                         .Select(r => new ViewPatientDashboard
                         {
                             Requestid = r.Requestid,
                             Createddate = r.Createddate,
                             Status = r.Status,
                             FileCount = _context.Requestwisefiles.Count(f => f.Requestid == r.Requestid)
                         })
                         .ToList();

            return View(result);
        }
        #endregion
    }
}
