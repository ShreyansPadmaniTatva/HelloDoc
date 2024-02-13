using Microsoft.AspNetCore.Mvc;

namespace HelloDoc.Controllers
{
    public class SubmitRequest : Controller
    {
        #region Index
        public IActionResult Index()
        {
            return View();
        }
        #endregion
    }
}
