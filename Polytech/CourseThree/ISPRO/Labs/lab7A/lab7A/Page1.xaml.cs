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

namespace lab7A
{
    /// <summary>
    /// Логика взаимодействия для Page1.xaml
    /// </summary>
    public partial class Page1 : Page
    {
        public List<string> Fill {
            get;
            private set;
        }

        public Page1()
        {
            InitializeComponent();
        }

        public Page1(IEnumerable<string> list = null)
        {

            InitializeComponent();
            Fill = new List<string>();

            if (list != null)
                foreach (string s in list) {
                    Fill.Add(s);
                    selectedList.Items.Add(s);
                }
        }

        private void Checkout_Click(object sender, RoutedEventArgs e)
        {
            int sum = 0;

            if (avergePizza.IsChecked.Value == true) sum = 340;
            if (bigPizza.IsChecked.Value == true) sum = 450;
            if (smallPizza.IsChecked.Value == true) sum = 280;

            MessageBox.Show($"Сумма заказа: {sum + Fill.Count * 20}");
        }

        private void ChooseTheFilling_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new Page2(Fill));
        }
    }
}
