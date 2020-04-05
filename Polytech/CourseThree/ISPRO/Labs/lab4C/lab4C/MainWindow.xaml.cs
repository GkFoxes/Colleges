using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace lab4C
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Calculator calculator = new Calculator();

        public MainWindow()
        {
            InitializeComponent();
        }

        private void click(object sender, RoutedEventArgs e)
        {
            var button = (Button)sender;

            switch (button.Content)
            {
                case "+":
                    sum.Text += " + ";
                    break;
                case "-":
                    sum.Text += " - ";
                    break;
                case "*":
                    sum.Text += " * ";
                    break;
                case "/":
                    sum.Text += " / ";
                    break;
                case "0":
                    sum.Text += "0";
                    break;
                case "1":
                    sum.Text += "1";
                    break;
                case "2":
                    sum.Text += "2";
                    break;
                case "3":
                    sum.Text += "3";
                    break;
                case "4":
                    sum.Text += "4";
                    break;
                case "5":
                    sum.Text += "5";
                    break;
                case "6":
                    sum.Text += "6";
                    break;
                case "7":
                    sum.Text += "7";
                    break;
                case "8":
                    sum.Text += "8";
                    break;
                case "9":
                    sum.Text += "9";
                    break;
                case ",":
                    sum.Text += ",";
                    break;
                case "C":
                    sum.Text = calculator.Clean();
                    break;
                case "=":
                    sum.Text = calculator.Calculate(sum.Text).ToString();
                    break;
            }
        }
    }
}
