using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class PatientFamilyFriend : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Post()
        {

            return View();
        }
    }
}
