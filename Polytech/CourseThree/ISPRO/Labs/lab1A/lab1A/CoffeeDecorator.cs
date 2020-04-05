using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab1A
{
    abstract class CoffeeDecorator : Coffee
    {
        protected Coffee coffee;

        public CoffeeDecorator(string name, Coffee coffee) : base(name)
        {
            this.coffee = coffee;
        }
    }
}
