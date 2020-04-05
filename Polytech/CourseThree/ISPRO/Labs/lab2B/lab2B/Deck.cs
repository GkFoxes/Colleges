using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab2B
{
    public class Deck
    {
        public Card[] cards;

        public Deck()
        {
            cards = new Card[52];
        }

        public void SetCard(int index, int rank, string suit)
        {
            cards[index] = new Card(rank, suit);
        }

        public Card GetCard(int index)
        {
            return cards[index];
        }

        public void Shuffle()
        {
            Random random = new Random();
            for (int i = 0; i < 52; i++) {
                int j = random.Next(52);

                Card buf = cards[j];
                cards[j] = cards[i];
                cards[i] = buf;
            }
        }
    }
}
