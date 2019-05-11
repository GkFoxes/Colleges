using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace WeatherInfoApp.OpenWeather
{
    class OpenWeather
    {
        public Coord coord;
        public Weather[] weather;
        public string Base { get; set; }
        public CMain main;
        public double visibility { get; set; }
        public Wind wind { get; set; }
        public Clouds clouds;
        public double dt { get; set; }
        public Sys sys;
        public double id { get; set; }
        public string name { get; set; }
        public double cod { get; set; }
        
    }
}
