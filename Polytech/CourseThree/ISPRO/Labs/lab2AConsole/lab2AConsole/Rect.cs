using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab2AConsole
{
    class Rect: Shape
    {
        public double sideA { get; }
        public double sideB { get; }

        public Rect()
        {
            Name = "Прямоугольник";
            sideA = 0;
            sideB = 0;
        }

        public Rect(double sideA, double sideB)
        {
            Name = "Прямоугольник";
            this.sideA = sideA;
            this.sideB = sideB;

            CalculateArea();
            CalculatePerimeter();
        }

        public void CalculateArea()
        {
            Area = sideA * sideB;
        }

        public void CalculatePerimeter()
        {
            Perimeter = 2 * (sideA + sideB);
        }
    }
}
