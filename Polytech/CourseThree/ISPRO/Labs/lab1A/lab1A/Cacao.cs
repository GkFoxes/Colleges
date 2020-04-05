using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab1A
{
    class Cacao: Coffee
    {
        public Cacao() : base("Cacao") { }

        public override int GetCost()
        {
            return 50;
        }
    }
}
