using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace InfoBusiness.Models
{
    public class Product
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Ошибка ввода")]
        [Display(Name ="Название")]
        public string Name { get; set; }

        [Required(ErrorMessage ="Ошибка ввода")]
        [Display(Name = "Цена")]
        public decimal Price { get; set; }
    }
}
