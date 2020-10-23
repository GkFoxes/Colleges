using ClassLibrary1;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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

namespace WpfApp2
{
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Class1 a = new Class1();
            int c = a.Plus(1, 2);
        }

        private void Save(object sender, RoutedEventArgs e)
        {
            var Set = new DataSet();
            var dialog = new SaveFileDialog { Filter = "XML files (*.xml)|*.xml|All files (*.*)|*.*" };

            if ((bool)dialog.ShowDialog())
            {
                FileStream fs = new FileStream(dialog.FileName, FileMode.Create);
                Set.Tables.Add((Data.ItemsSource as DataView).ToTable());
                Set.WriteXml(fs);
                fs.Close();
            }
        }

        private void Load(object sender, RoutedEventArgs e)
        {
            try
            {
                var dialog = new OpenFileDialog { Filter = "XML files (*.xml)|*.xml|All files (*.*)|*.*" };

                if ((bool)dialog.ShowDialog())
                {
                    Label.Content = dialog.FileName;
                    var Set = new DataSet();
                    Set.ReadXml((string)Label.Content);
                    Data.ItemsSource = new DataView(Set.Tables[0]);
                }
            }
            catch { MessageBox.Show("Ошибка со считыванием"); }
        }
    }
}
