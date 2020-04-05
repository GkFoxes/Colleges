using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab4C
{
    class Calculator
    {
        private double Add(double a, double b) => a + b;
        private double Multiply(double a, double b) => a * b;
        private double Divide(double a, double b) => a / b;
        private double Subtract(double a, double b) => a - b;

        private double Count { get; set; }
        private delegate double Cucl(double a, double b);

        public double Calculate(string equation)
        {
            equation.Trim();
            string[] split = equation.Split();

            if (equation.Contains("+"))
            {
                Cucl c = Add;

                for (int i = 0; i < split.Length; i++)
                    if (split[i].CompareTo("+") == 0)
                    {
                        split = NewSplit(split, i, c);
                        i = 0;
                    }
            }

            if (equation.Contains("-"))
            {
                Cucl c = Subtract;

                for (int i = 0; i < split.Length; i++)
                    if (split[i].CompareTo("-") == 0)
                    {
                        split = NewSplit(split, i, c);
                        i = 0;
                    }
            }

            if (equation.Contains("*"))
            {
                Cucl c = Multiply;

                for (int i = 0; i < split.Length; i++)
                    if (split[i].CompareTo("*") == 0)
                    {
                        split = NewSplit(split, i, c);
                        i = 0;
                    }
            }

            if (equation.Contains("/"))
            {
                Cucl c = Divide;

                for (int i = 0; i < split.Length; i++)
                    if (split[i].CompareTo("/") == 0)
                    {
                        split = NewSplit(split, i, c);
                        i = 0;
                    }
            }

            return Count;
        }

        private string[] NewSplit(string[] split, int i, Cucl c)
        {
            Count = c(Convert.ToDouble(split[i - 1]), Convert.ToDouble(split[i + 1]));
            string[] newSplit = new string[split.Length - 2];

            for (int j = 0, shift = 0; j < newSplit.Length; j++, shift++) {
                if (shift != i - 1)
                    newSplit[j] = split[shift];
                else {
                    newSplit[j] = Count.ToString();
                    shift += 2;
                }
            }

            return newSplit;
        }

        public string Clean()
        {
            Count = 0;
            return "";
        }
    }
}
