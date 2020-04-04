using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab0A
{
    class Program
    {
        static void Main(string[] args)
        {
            var object0 = new Angle(2, 3, 'W');
            Console.WriteLine("object0");
            object0.Show();

            var object1 = new Angle();
            Console.WriteLine("object1");
            object1.Show();
            object1.EnterValues();
            object1.Show();
            Console.Read();
        }
    }
}
