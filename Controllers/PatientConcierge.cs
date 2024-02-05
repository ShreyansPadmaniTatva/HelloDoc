using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class PatientConcierge : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
