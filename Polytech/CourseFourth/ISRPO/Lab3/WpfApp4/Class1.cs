using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;

namespace WpfApp4
{
    class Converter : IMultiValueConverter
    {
        public object Convert(object[] values, Type targetType, object parameter, System.Globalization.CultureInfo culture)
        {
            int day = -1, month = -1, year = -1;

            try
            {
                Int32.TryParse(values[0].ToString(), out year);
                Int32.TryParse(values[1].ToString(), out month);
                Int32.TryParse(values[2].ToString(), out day);

                DateTime a = new DateTime(day, month, year);

                return a.ToString().Substring(0, a.ToString().IndexOf(" "));
            }
            catch
            {
                return null;
            }
        }


        public object[] ConvertBack(object value, Type[] targetTypes, object parameter, System.Globalization.CultureInfo culture)
        {
            string[] values = (value as string).Split('.');

            try
            {
                int day = -1, month = -1, year = -1;
                Int32.TryParse(values[0].ToString(), out year);
                Int32.TryParse(values[1].ToString(), out month);
                Int32.TryParse(values[2].ToString(), out day);

                DateTime a = new DateTime(day, month, year);
                string b = a.ToString().Substring(0, a.ToString().IndexOf(" "));
                object c = b;

                return (c as string).Split('.');
            }
            catch
            {
                return null;
            }
        }
    }
}

