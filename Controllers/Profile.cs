using HelloDoc.Data;
using HelloDoc.Models;
using HelloDoc.Models.CV;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace HelloDoc.Controllers
{
    [CheckAccess]
    public class Profile : Controller
    {
        #region Configuration
        private readonly ApplicationDbContext _context;

        public Profile(ApplicationDbContext context)
        {
            _context = context;
        }
        #endregion

        #region Index
        public IActionResult Index()
        {
            var UsersProfile = _context.Users.Where(r => r.Userid == Convert.ToInt32(CV.UserID())).FirstOrDefault();
            return View(UsersProfile);
        }
        #endregion

        #region Put
        public async Task<IActionResult> Put(User userprofile)
        {
            try
            {
                userprofile.Modifiedby = userprofile.Createdby;
                userprofile.Modifieddate = DateTime.Now;
                _context.Update(userprofile);
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(userprofile.Userid))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
            return RedirectToAction("Index");
        }
        private bool UserExists(object id)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
