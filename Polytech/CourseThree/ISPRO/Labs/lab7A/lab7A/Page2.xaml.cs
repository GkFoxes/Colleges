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
    /// Логика взаимодействия для Page2.xaml
    /// </summary>
    public partial class Page2 : Page
    {
        public List<string> Fill {
            get;
            private set;
        }

        public Page2(IEnumerable<string> list = null)
        {
            InitializeComponent();
            Fill = new List<string>();

            if (list != null)
            {
                foreach (string s in list) {
                    listAdd.Items.Add(new ListBoxItem { Content = s });
                }
            }
        }

        private void Sub_Click(object sender, RoutedEventArgs e)
        {
            if (listAdd.SelectedItem != null)
            {
                var item = listAdd.SelectedItem as ListBoxItem;
                listAdd.Items.Remove(item);
            }
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            var item = list.SelectedItem as ListBoxItem;
            listAdd.Items.Add(new ListBoxItem { Content = item.Content.ToString() });
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            foreach (ListBoxItem s in listAdd.Items)
                Fill.Add(s.Content.ToString());

            this.NavigationService.Navigate(new Page1(Fill));
        }
    }
}
