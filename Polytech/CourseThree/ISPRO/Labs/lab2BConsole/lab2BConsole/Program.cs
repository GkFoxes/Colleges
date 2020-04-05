using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab2BConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] Suits = new string[] { "Черви", "Буби", "Крести", "Пики" };
            Deck deck = new Deck();

            for (int i = 0; i < 52; i += 4)
                for (int j = 0; j < 4; j++)
                    deck.SetCard(i + j, i, Suits[j]);

            for (int i = 0; i < 52; i += 4)
                for (int j = 0; j < 4; j++)
                    Console.WriteLine(deck.GetCard(i + j).ToString());

            int counter;

            do
            {
                switch (counter = int.Parse(Console.ReadLine()))
                {
                    case 1:
                        deck.Shuffle();
                        for (int i = 0; i < 52; i += 4)
                            for (int j = 0; j < 4; j++)
                                Console.WriteLine(deck.GetCard(i + j).ToString());
                        break;
                }
            } while (counter != 0);
        }
    }
}
