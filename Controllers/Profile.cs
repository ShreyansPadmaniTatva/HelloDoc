using HelloDoc.Data;
using HelloDoc.Models;
using HelloDoc.Models.CV;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace HelloDoc.Controllers
{
    [CheckAccess]
    public class Profile : Controller
    {
        private readonly ApplicationDbContext _context;

        public Profile(ApplicationDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            var UsersProfile = _context.Users.Where(r => r.Userid == Convert.ToInt32(CV.UserID())).FirstOrDefault();
            return View(UsersProfile);
        }
        public async Task<IActionResult> Put(User userprofile)
        {
            try
            {
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
    }
}
