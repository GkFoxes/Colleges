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

namespace lab2A
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public Shape shape;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Calculate(object sender, RoutedEventArgs e)
        {
            if (shape is Square)
            {
                shape = new Square(double.Parse(Value_1.Text));
                Out.Text = shape.Show();
            }

            if (shape is Circle)
            {
                shape = new Circle(double.Parse(Value_1.Text));
                Out.Text = shape.Show();
            }

            if (shape is Rect && !(shape is Square))
            {
                shape = new Rect(double.Parse(Value_1.Text), double.Parse(Value_2.Text));
                Out.Text = shape.Show();
            }
        }

        private void Choice(object sender, RoutedEventArgs e)
        {
            RadioButton radioButton = (RadioButton)sender;

            if (radioButton.Name == "Circle")
            {
                shape = new Circle();
                Parametr_1.Text = "Радиус:";

                Value_1.IsEnabled = true;
                Value_2.IsEnabled = false;
            }

            if (radioButton.Name == "Rect")
            {
                shape = new Rect();
                Parametr_1.Text = "Сторона А:";
                Parametr_2.Text = "Сторона B:";

                Value_1.IsEnabled = true;
                Value_2.IsEnabled = true;
            }

            if (radioButton.Name == "Square")
            {
                shape = new Square();
                Parametr_1.Text = "Сторона А:";

                Value_1.IsEnabled = true;
                Value_2.IsEnabled = false;
            }
        }
    }
}
