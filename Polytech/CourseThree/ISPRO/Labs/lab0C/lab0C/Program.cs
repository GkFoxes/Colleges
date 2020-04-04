using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab0C
{
    class Program
    {
        static void Main(string[] args)
        {
            var order = new Orders();
            Console.WriteLine("Заказ: ");
            order.itemName = Console.ReadLine();
            Console.WriteLine("Количество: ");
            order.unitCount = int.Parse(Console.ReadLine());
            Console.WriteLine("Стоимость: ");
            order.unitCost = double.Parse(Console.ReadLine());

            Console.WriteLine(
                "-----------------------\n" +
                "Заказа: {0}\n" +
                "Количество: {1}\n" +
                "Цена за единицу: {2}\n" +
                "Общая стоимость: {3}\n",
                order.itemName, order.unitCount, order.unitCost, order.Sum()
                );

            Console.ReadLine();
        }
    }
}
