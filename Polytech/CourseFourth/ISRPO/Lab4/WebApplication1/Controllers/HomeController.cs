using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
        public ActionResult AfterLoadFile(HttpPostedFileBase upload)
        {
            List<Tuple<double, double>> data = new
               List<Tuple<double, double>>();
            if (upload != null)
            {
                string fileName =
                   Path.GetFileName(upload.FileName);
                string filePath = Server.MapPath("~/Files/"
                                     + fileName);
                upload.SaveAs(filePath);
            }
            return View();


        }

    }
}