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
using System.Collections.ObjectModel;

namespace lab10A
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private MyData myData;

        public MainWindow()
        {
            InitializeComponent();

            myData = new MyData();
            DataContext = myData;

            myData.Subdivisions.Add(new Subdivision
            {
                Name = "ffff",
                Workers = new ObservableCollection<string> {
                    "aaa", "bbb"
                }
            });

            listSubdivision.ItemsSource = myData.Subdivisions;
            treeView.ItemsSource = myData.Subdivisions;

        }

        private void AddWorker_Click(object sender, RoutedEventArgs e)
        {
            var subdivision = (listSubdivision.SelectedValue as Subdivision).Name;
            var worker = name.Text;

            foreach (var i in myData.Subdivisions)
                if (i.Name == subdivision)
                {
                    i.AddWorker(worker);
                    break;
                }
        }

        private void AddSubdivision_Click(object sender, RoutedEventArgs e)
        {
            myData.Subdivisions.Add(new Subdivision(subdivision.Text));
        }
    }
}
