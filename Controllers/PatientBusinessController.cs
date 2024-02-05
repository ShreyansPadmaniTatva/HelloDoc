using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class PatientBusinessController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
