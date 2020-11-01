using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using InfoBusiness.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace InfoBusiness.Context
{
    public class dbContext : IdentityDbContext<User>
    {
        public dbContext(DbContextOptions<dbContext> options) : base(options)
        {
            //Database.EnsureCreated();
        }
        public DbSet<User> User { get; set; }
        public DbSet<Organization> Organizations { get; set; }
        public DbSet<OrganizationInfo> OrganizationInfo { get; set; }
        public DbSet<Product> Products { get; set; }
    }
}
