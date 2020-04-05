using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab1B
{
    class Elevator
    {
        public int Stage = 0;

        public int Now {
            get;
            set;
        } = 1;

        public int Way {
            get;
            set;
        }

        public readonly int MaxFloor = 7;

        public Elevator(int MaxFloor)
        {
            this.MaxFloor = MaxFloor;
        }

        public string Upstair()
        {
            return "Лифт движется ("+ ++Now +")";
        }

        public string Downstair()
        {
            return "Лифт движется ("+ --Now +")";
        }

        public string OpenDoor()
        {
            return "Двери открыты";
        }

        public string CloseDoor()
        {
            return "Двери закрыты";
        }

        public bool IsEnd()
        {
            if (Now == Way) return true;
            return false;
        }
    }
}
