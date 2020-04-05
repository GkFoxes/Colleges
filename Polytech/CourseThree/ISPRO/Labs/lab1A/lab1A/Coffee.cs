using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace lab1A
{
    abstract class Coffee
    {
        public string Name {
            get;
            protected set;
        }

        public abstract int GetCost();

        public Coffee(string Name)
        {
            this.Name = Name;
        }

        public Grid ChangeImage(Grid grid)
        {
            Image image = new Image
            {
                Source = new BitmapImage(new Uri(@"\\Mac\Home\Documents\Study\ИСРПО\Labs\lab1A\lab1A\" + Name + ".jpg"))
            };

            grid.Children.Clear();
            grid.Children.Add(image);
            return grid;
        }
    }
}
