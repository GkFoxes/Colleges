using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab2AConsole
{
    class Circle: Shape
    {
        public double Radius { get; }

        public Circle()
        {
            Name = "Круг";
            Radius = 0;
        }

        public Circle(double Radius)
        {
            Name = "Круг";
            this.Radius = Radius;

            CalculateArea();
            CalculatePerimeter();
        }

        public void CalculateArea()
        {
            Area = Math.PI * Radius * Radius;
        }

        public void CalculatePerimeter()
        {
            Perimeter = Math.PI * Radius * 2;
        }
    }
}
