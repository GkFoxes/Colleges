using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab0A
{
    class Angle
    {
        public int degree;
        public float numberOfMinutes;
        public char direction;

        public Angle()
        {
            degree = 0;
            numberOfMinutes = 0;
            direction = 'S';
        }

        public Angle(int degree, float numberOfMinutes, char direction)
        {
            this.degree = degree;
            this.numberOfMinutes = numberOfMinutes;
            this.direction = direction;
        }

        public void EnterValues()
        {
            Console.WriteLine("Enter degree: ");
            degree = int.Parse(Console.ReadLine());

            Console.WriteLine("Enter number of minutes: ");
            numberOfMinutes = float.Parse(Console.ReadLine());

            Console.WriteLine("Enter direction: ");
            direction = char.Parse(Console.ReadLine());
        }

        public void Show()
        {
            Console.WriteLine(
                "Degree: {0}\n" +
                "Number of minutes: {1}\n" +
                "Direction: {2}\n", 
                degree, numberOfMinutes, direction
                );
        }
    }
}
