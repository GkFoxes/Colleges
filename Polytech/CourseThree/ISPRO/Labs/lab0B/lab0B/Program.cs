using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab0B
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Выберите напиток: кофе <1> или чай <2>: ");
            switch (int.Parse(Console.ReadLine()))
            {
                case 1:
                    ProcessCup(new CupOfCoffee());
                    break;
                case 2:
                    ProcessCup(new CupOfTea());
                    break;
                default:
                    Console.WriteLine("Другого пока нет");
                    break;
            }

            Console.ReadLine();
        }

        static void ProcessCup(CupOfCoffee cup)
        {
            Console.WriteLine(
                "Тип зерна: Арабика или Робуста <по умолчанию Арабика>;\n" +
                "Сахар: 0...5 <по умолчанию 3>;\n" +
                "Молоко: 0...10 <по умолчанию 3>;\n" +
                "Тип стакана: Пластик или Стекло <по умолчанию Пластик>;\n" +
                "Объем 0,2 или 0,3 <по умолчанию 0,2>;\n"
                );


            Console.WriteLine("Тип зерна: ");
            cup.BeanType = Console.ReadLine();
            Console.WriteLine("Молоко: ");
            cup.Milk = int.Parse(Console.ReadLine());
            Console.WriteLine("Сахар: ");
            cup.Sugar = int.Parse(Console.ReadLine());
            Console.WriteLine("Тип стакана: ");
            cup.Type = Console.ReadLine();
            Console.WriteLine("Объем <мл>: ");
            cup.Capacity = double.Parse(Console.ReadLine());

            Console.WriteLine(
                "------------------------------\n" +
                "В кофе добавлен сахар: {0}\n" +
                "В кофе добавлено молоко: {1}\n" +
                "Получите кофе: {2}\n", 
                cup.Sugar, cup.Milk, cup.BeanType
                );

            cup.Drink();
            cup.Wash();
            cup.Refill();
        }

        static void ProcessCup(CupOfTea cup)
        {
            Console.WriteLine(
                "Тип чая: Зеленый или Черный <по умолчанию Зеленый>;\n" +
                "Сахар: 0...5 <по умолчанию 3>\n" +
                "Молоко: 0...10 <по умолчанию 3>\n" +
                "Тип стакана: Пластик или Стекло <по умолчанию Пластик>\n" +
                "Объем 0,2 или 0,3 <по умолчанию 0,2>\n"
                );

            Console.WriteLine("Тип чая: ");
            cup.LeafType = Console.ReadLine();
            Console.WriteLine("Молоко: ");
            cup.Milk = int.Parse(Console.ReadLine());
            Console.WriteLine("Сахар: ");
            cup.Sugar = int.Parse(Console.ReadLine());
            Console.WriteLine("Тип стакана: ");
            cup.Type = Console.ReadLine();
            Console.WriteLine("Объем <мл>: ");
            cup.Capacity = double.Parse(Console.ReadLine());

            Console.WriteLine(
                "------------------------------\n" +
                "В чай добавлен сахар: {0}\n" +
                "В чай добавлено молоко: {1}\n" +
                "Получите чай: {2}\n", 
                cup.Sugar, cup.Milk, cup.LeafType
                );

            cup.Drink();
            cup.Wash();
            cup.Refill();
        }
    }
}
