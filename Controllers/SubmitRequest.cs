using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class SubmitRequest : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
