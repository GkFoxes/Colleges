using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab0C
{
    struct Orders
    {
        public string itemName;
        public int unitCount;
        public double unitCost;

        public Orders(string itemName, int unitCount, double unitCost)
        {
            this.itemName = itemName;
            this.unitCount = unitCount;
            this.unitCost = unitCost;
        }

        public double Sum()
        {
            return unitCost * unitCount;
        }
    }
}
