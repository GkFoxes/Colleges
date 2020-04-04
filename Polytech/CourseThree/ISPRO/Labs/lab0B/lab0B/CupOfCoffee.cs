using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab0B
{
    class CupOfCoffee : HotDrink, ICup
    {
        protected string beanType = "Арабика";
        public string BeanType
        {
            get
            {
                return beanType;
            }

            set
            {
                if (value is string)
                    if (value.Equals("Робуста"))
                        beanType = value;
            }
        }

        protected string type = "Пластик";
        public string Type
        {
            get
            {
                return type;
            }

            set
            {
                if (value is string)
                    if (value == "Стекло")
                        type = value;
            }
        }

        protected double capacity = 0.2;
        public double Capacity
        {
            get
            {
                return capacity;
            }

            set
            {
                if (value <= 0.2) capacity = 0.2;
                if (value > 0.2) capacity = 0.3;
            }
        }

        public void Refill()
        {
            Console.WriteLine(
                "Повторить кофе {4} объемом {0}\n" +
                "Молоко: {1}\n" +
                "Сахар: {2}\n" +
                "Тип стакана: {3}\n", 
                Capacity, Milk, Sugar, Type, BeanType
                );
        }

        public void Wash()
        {
            Console.WriteLine("Вымыть {0} чашку с кофе\n", Type);
        }
    }
}
