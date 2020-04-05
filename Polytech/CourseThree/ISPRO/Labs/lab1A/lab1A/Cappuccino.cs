using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab1A
{
    class Cappuccino: Coffee
    {
        public Cappuccino(): base("Cappuccino") { }

        public override int GetCost()
        {
            return 60;
        }
    }
}
