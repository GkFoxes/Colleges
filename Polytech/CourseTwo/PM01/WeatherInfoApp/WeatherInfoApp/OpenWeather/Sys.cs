using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeatherInfoApp.OpenWeather
{
    class Sys
    {
        public double type { get; set; }
        public int id { get; set; }
        public double message { get; set; }
        public string country { get; set; }
        public double sunrise { get; set; }
        public double sunset { get; set; }
    }
}
