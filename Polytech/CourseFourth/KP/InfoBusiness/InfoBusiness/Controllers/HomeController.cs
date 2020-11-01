using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using InfoBusiness.Context;
using InfoBusiness.Models;

namespace InfoBusiness.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        public UserManager<User> _userManager;
        public dbContext _dbContext;

        public HomeController(ILogger<HomeController> logger, dbContext dbContext, UserManager<User> userManager)
        {
            _logger = logger;
            _dbContext = dbContext;
            _userManager = userManager;
        }

        public IActionResult Index()
        {
            if (User.IsInRole("admin")) return RedirectToAction("Admin");
            if (User.IsInRole("user")) return RedirectToAction("Index", "User");

            return View();
        }

        [HttpGet]
        public IActionResult Admin()
        {
            var users = _dbContext.User.
                Select(x => new UserWithRole { User = x, Role = _userManager.GetRolesAsync(x).Result.FirstOrDefault() })
                .ToList();

            var model = new AdminViewModel
            {
                UserWithRole = users,
            };

            return View(model);
        }

    }
}
