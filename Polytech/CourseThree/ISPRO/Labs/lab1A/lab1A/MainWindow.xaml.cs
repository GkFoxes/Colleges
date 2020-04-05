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

namespace lab1A
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Coffee coffee = null;

        public MainWindow()
        {
            InitializeComponent();
        }

        public void GiveMoney(object sender, RoutedEventArgs e)
        {
            if (Sum.Text == "")
                Sum.Text = Money.Text;
            else
                Sum.Text = (Convert.ToInt32(Sum.Text) + Convert.ToInt32(Money.Text)).ToString();
        }

        public void CoffeeImage(object sender, RoutedEventArgs e)
        {
            RadioButton radioButton = (RadioButton)sender;
            ChoiceObject();

            coffee.ChangeImage(ImageCoffee);
            SumCost.Text = coffee.GetCost().ToString();
        }

        public void ImageChecked(object sender, RoutedEventArgs e)
        {
            CheckBox checkBox = (CheckBox)sender;

            if (checkBox.Name == "Milk")
            {
                coffee = new MilkCoffee(coffee);
                ImageMilk.Visibility = Visibility.Visible;
            } else {
                coffee = new SugarCoffee(coffee);
                ImageSugar.Visibility = Visibility.Visible;
            }

            SumCost.Text = coffee.GetCost().ToString();
        }

        public void ImageUnChecked(object sender, RoutedEventArgs e)
        {
            CheckBox checkBox = (CheckBox)sender;
            ChoiceObject();

            if (checkBox.Name == "Milk")
            {
                if (Sugar.IsChecked == true)
                    coffee = new SugarCoffee(coffee);

                ImageMilk.Visibility = Visibility.Hidden;
            } else {
                if (Milk.IsChecked == true)
                    coffee = new MilkCoffee(coffee);

                ImageSugar.Visibility = Visibility.Hidden;
            }

            SumCost.Text = coffee.GetCost().ToString();
        }

        public void ChoiceObject()
        {
            if (Americano.IsChecked == true)
                coffee = new Americano();
            if (Cacao.IsChecked == true)
                coffee = new Cacao();
            if (Cappuccino.IsChecked == true)
                coffee = new Cappuccino();
            if (Espresso.IsChecked == true)
                coffee = new Espresso();
        }

        private void Drink_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (int.Parse(Sum.Text) >= int.Parse(SumCost.Text))
                {
                    Change.Text = (int.Parse(Sum.Text) - int.Parse(SumCost.Text)).ToString();
                    MessageBox.Show("Операция выполнена успешно.");
                } else {
                    MessageBox.Show("Недостаточно средств.");
                }
            }

            catch (Exception)
            {
                Change.Text = "0";
            }
        }
    }
}
