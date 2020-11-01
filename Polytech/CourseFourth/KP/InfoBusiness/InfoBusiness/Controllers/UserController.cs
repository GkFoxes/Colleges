using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using InfoBusiness.Context;
using InfoBusiness.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace InfoBusiness.Controllers
{
    public class UserController : Controller
    {
        private dbContext _db;
        public UserController(dbContext db)
        {
            _db = db;
        }
        /// <summary>
        /// Главная страница у user (список организаций)
        /// </summary>
        /// <returns></returns>
        public IActionResult Index()
        {
            //создание организации
            //_db.Organizations.Add(new Organization()
            //{
            //    Info = new OrganizationInfo
            //    {
            //        Name = "Билайн",
            //        FullAdress = "Ул. Ленина, д.1",
            //        PhoneNumber = "+89999999991"
            //    },
            //});
            //_db.SaveChanges();

            var model = _db.Organizations
                .Include(x => x.Info)
                .Include(x => x.Products)
                .ToList();

            return View(model);
        }
        /// <summary>
        /// Редактирование списка услуг для организации
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IActionResult EditOrganizationView(int id)
        {
            var model = _db.Organizations
                .Include(x => x.Info)
                .Include(x => x.Products)
                .ToList()
                .Where(x => x.Id == id)
                .FirstOrDefault();

            return View(model);
        }
        /// <summary>
        /// Отображаем частичное представление для редактирования информации об орагнизации
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public IActionResult _EditOrganizationInfoPartial(int id)
        {
             var model = _db.Organizations
                .Include(x => x.Info)
                .Include(x => x.Products)
                .ToList()
                .Where(x => x.Id == id)
                .FirstOrDefault();
            return PartialView(model);
        }
        /// <summary>
        /// Проверяем и сохраняем информацию об организации
        /// </summary>
        /// <param name="organization"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult _EditOrganizationInfoPartial(Organization organization)
        {
            if (!ModelState.IsValid)
            {
                return PartialView(organization);
            }

             var fullOrganization = _db.Organizations
                .Include(x => x.Info)
                .Include(x => x.Products)
                .ToList()
                .Where(x => x.Id == organization.Id)
                .FirstOrDefault();

            fullOrganization.Info.Name = organization.Info.Name;
            fullOrganization.Info.PhoneNumber = organization.Info.PhoneNumber;
            fullOrganization.Info.FullAdress = organization.Info.FullAdress;

            _db.SaveChanges();
            return PartialView(organization);
        }

        /// <summary>
        /// Отображаем частичное представление для редактирования или добавления услуги
        /// </summary>
        /// <param name="organizationId"></param>
        /// <param name="productId"></param>
        /// <returns></returns>
        public IActionResult _EditProductPartial(int organizationId, int productId)
        {
            var model = new EditProductViewModel() { FormInput = _db.Products.Find(productId)?? new Product(), OrganizationId = organizationId };
            return PartialView(model);
        }
        /// <summary>
        /// Проверяем и сохраняем услугу
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult _EditProductPartial(EditProductViewModel model)
        {
            if(!ModelState.IsValid)
            {
                return PartialView(model);
            }

            var organization = _db.Organizations
               .Include(x => x.Info)
               .Include(x => x.Products)
               .ToList()
               .Where(x => x.Id == model.OrganizationId)
               .FirstOrDefault();

            if (model.FormInput.Id == 0)
            {
                var newProduct = new Product() { Name = model.FormInput.Name, Price = model.FormInput.Price };
                organization.Products.Add(newProduct);
            }
            else
            {
                var product = _db.Products.Find(model.FormInput.Id);
                product.Name = model.FormInput.Name;
                product.Price = model.FormInput.Price;

            }
            _db.SaveChanges();

            return PartialView(model);
        }
        /// <summary>
        /// Удаляем услугу
        /// </summary>
        /// <param name="productId"></param>
        /// <param name="organizationId"></param>
        /// <returns></returns>
        public IActionResult RemoveProduct(int productId, int organizationId)
        {
            var organization = _db.Organizations
               .Include(x => x.Info)
               .Include(x => x.Products)
               .ToList()
               .Where(x => x.Id == organizationId)
               .FirstOrDefault();

            _db.Products.Remove(_db.Products.Find(productId));
            _db.SaveChanges();

            return View("EditOrganizationView", organization);
        }
    }
}
