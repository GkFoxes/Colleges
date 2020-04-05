using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab1A
{
    class SugarCoffee: CoffeeDecorator
    {
        public SugarCoffee(Coffee coffee) : base(coffee.Name + ", c сахором", coffee) { }

        public override int GetCost()
        {
            return coffee.GetCost() + 5;
        }
    }
}
