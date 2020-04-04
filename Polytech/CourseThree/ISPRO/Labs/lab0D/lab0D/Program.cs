using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab0D
{
    class Program
    {
        static void Main(string[] args)
        {
            int number = int.MaxValue;

            try
            {
                number = checked(number + 1);
            }

            catch (OverflowException exception)
            {
                Console.WriteLine(
                    "Обнаружена ошибка: {0}",
                    exception.Message
                    );
            }

            Console.Read();
        }
    }
}
