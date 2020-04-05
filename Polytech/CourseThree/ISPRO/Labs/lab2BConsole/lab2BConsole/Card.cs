using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab2BConsole
{
    class Card
    {
        private readonly int rank;
        private readonly string suit;

        Card()
        {
            rank = 0;
            suit = "";
        }

        public Card(int rank, string suit)
        {
            this.rank = rank;
            this.suit = suit;
        }

        public override string ToString()
        {
            return $"{suit} {rank}";
        }
    }
}
