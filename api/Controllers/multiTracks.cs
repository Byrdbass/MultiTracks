using Microsoft.AspNetCore.Mvc;

namespace api.Controllers
{
    public class multiTracks : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
