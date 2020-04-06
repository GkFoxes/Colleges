using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using System.Windows.Controls;

namespace lab9B
{
    class TrolleyBusRule: ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            try
            {
                if (int.Parse(value as string) > 60 || int.Parse(value as string) < 2)
                    return new ValidationResult(false, "Значение должно быть между 2 и 60.");

                return new ValidationResult(true, null);
            }

            catch
            {
                return new ValidationResult(false, "Допустимо вводить только числа.");
            }
        }
    }
}
