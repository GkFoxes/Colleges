using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab9B
{
    class TrolleyBus
    {
        static private DateTime startWorkingTime { get; set; }
        static public int Count { get; set; }
        public int Number { get; set; }
        public bool IsActive { get; set; }

        static public string StartWorkingTime
        {
            get
            {
                return startWorkingTime.ToString("dd/MM/yyyy HH:mm:ss");
            }
        }

        static TrolleyBus()
        {
            startWorkingTime = DateTime.Now;
            Count = 5;
        }

        public TrolleyBus()
        {
            Number = 2;
        }

        public TrolleyBus(int Number)
        {
            this.Number = Number;
        }

        public string Drive()
        {
            IsActive = true;
            return "Выехал троллейбус №" + Number + " в " + DateTime.Now.ToString("HH:mm:ss") + ". Через " + DateTime.Now.Subtract(startWorkingTime).ToString(@"hh\:mm\:ss") + " от начала работы парка.\n";
        }
    }
}
