using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeatherInfoApp.OpenWeather
{
    class CMain
    {
        public double temp { get; set; }

        private double _pressure;
        public double pressure
        {
            get
            {
                return _pressure;
            }
            set
            {
                _pressure = value / 1.333;
            }
        }
        public double humidity { get; set; }
        public double temp_min { get; set; }
        public double temp_max { get; set; }


    }
}
