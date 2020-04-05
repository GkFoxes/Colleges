using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab1A
{
    class Americano: Coffee
    {
        public Americano(): base("Americano") { }

        public override int GetCost()
        {
            return 30;
        }
    }
}
