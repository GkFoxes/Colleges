using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab1A
{
    class Espresso: Coffee
    {
        public Espresso(): base("Espresso") { }

        public override int GetCost()
        {
            return 25;
        }
    }
}
