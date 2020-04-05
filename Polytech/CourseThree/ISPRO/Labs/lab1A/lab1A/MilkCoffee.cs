using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab1A
{
    class MilkCoffee: CoffeeDecorator
    {
        public MilkCoffee(Coffee coffee): base(coffee.Name + ", c молоком", coffee) { }

        public override int GetCost()
        {
            return coffee.GetCost() + 10;
        }
    }
}
