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

namespace lab9A
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private int tempTest = 500;

        public MainWindow()
        {
            InitializeComponent();
            tbDateTime.Text = DateTime.Now.Day + "." + DateTime.Now.Month + "." + DateTime.Now.Year;

            var timer = new System.Windows.Threading.DispatcherTimer {
                Interval = TimeSpan.FromMilliseconds(tempTest)
            };
        }
    }
}
