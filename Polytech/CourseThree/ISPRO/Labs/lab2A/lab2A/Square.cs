using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab2A
{
    public class Square: Rect
    {
        public new double sideA { get; }

        public Square()
        {
            Name = "Квадрат";
            sideA = 0;
        }

        public Square(double sideA)
        {
            Name = "Квадрат";
            this.sideA = sideA;

            CalculateArea();
            CalculatePerimeter();
        }

        public new void CalculateArea()
        {
            Area = sideA * sideA;
        }

        public new void CalculatePerimeter()
        {
            Perimeter = 4 * sideA;
        }
    }
}
