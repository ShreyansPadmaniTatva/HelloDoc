﻿using HelloDoc.Data;
using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections;

namespace HelloDoc.Controllers
{
    public class PatientConcierge : Controller
    {
        public ApplicationDbContext _context;

        public PatientConcierge(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> Create(ViewPatientConcierge viewdata)
        {
            var Concierge = new Concierge();

            var Request = new Request();
            var Requestclient = new Requestclient();
            var Requestconcierge = new Requestconcierge();
            Random _random = new Random();

            Concierge.Conciergename = viewdata.CON_FirstName + viewdata.CON_LastName;
            Concierge.Street = viewdata.CON_Street;
            Concierge.City = viewdata.CON_City;
            Concierge.State = viewdata.CON_State;
            Concierge.Zipcode = viewdata.CON_ZipCode;
            Concierge.Regionid = 1;
            Concierge.Createddate = DateTime.Now;
            _context.Concierges.Add(Concierge);
            await _context.SaveChangesAsync();
            int id1 = Concierge.Conciergeid;


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

            Requestconcierge.Requestid = id2;
            Requestconcierge.Conciergeid = id1;

            _context.Requestconcierges.Add(Requestconcierge);
            await _context.SaveChangesAsync();


            return View("../Dashboard/Dashboard");

        }
    }
}
