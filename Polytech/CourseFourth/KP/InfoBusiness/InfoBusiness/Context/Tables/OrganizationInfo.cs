using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace InfoBusiness.Models
{
    public class OrganizationInfo
    {
        public int Id { get; set; }  
        
        [Required(ErrorMessage = "Ошибка ввода")]
        [Display(Name = "Название")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Ошибка ввода")]
        [Display(Name = "Адрес")]
        public string FullAdress { get; set; }

        [Required(ErrorMessage = "Ошибка ввода")]
        [Display(Name = "Номер телефона")]
        public string PhoneNumber { get; set; }
    }
}
