using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class Login : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult ForgotPassword()
        {
            return View();
        }
    }
}
