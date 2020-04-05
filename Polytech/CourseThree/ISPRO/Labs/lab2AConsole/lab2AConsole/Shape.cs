using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab2AConsole
{
    class Shape
    {
        protected string Name;
        protected double Perimeter;
        protected double Area;

        public Shape()
        {
            Name = "";
            Perimeter = 0;
            Area = 0;
        }

        public void Show()
        {
            Console.WriteLine(
                $"Название: \t{Name}\n" +
                $"Периметр: \t{Perimeter}\n" +
                $"Площадь: \t{Area}\n");
        }
    }
}
