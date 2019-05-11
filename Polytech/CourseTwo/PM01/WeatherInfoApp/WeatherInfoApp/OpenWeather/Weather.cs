using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;

namespace WeatherInfoApp.OpenWeather
{
    class Weather
    {
        public int id { get; set; }
        public string main { get; set; }
        public string description { get; set; }

        public string icon;
        public Bitmap Icon
        {
            get
            {
                Bitmap image = new Bitmap($"icons/{icon}.png");
                return image;
            } 
        }    
    }
}
