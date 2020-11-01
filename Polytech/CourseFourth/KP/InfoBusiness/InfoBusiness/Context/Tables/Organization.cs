using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InfoBusiness.Models
{
    public class Organization
    {
        public int Id { get; set; }

        public OrganizationInfo Info { get; set; }
        public List<Product> Products { get; set; }
    }
}
