using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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

namespace WpfApp1
{
    public partial class MainWindow : Window
    {
        

        public MainWindow()
        {
            InitializeComponent();
        }

        private void MetricsDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            String patch = @"Z:\ИСРПО\Lab1\WpfApp1\resource\Persons.csv";
            using (StreamReader sr = new StreamReader(patch))
            {
                string line;
                while ((line=sr.ReadLine()) !=null)
                {
                    string[] name = line.Split(';');
                    using (SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=Z:\ИСРПО\Lab1\WpfApp1\Database1.mdf;Integrated Security=True"))
                    {
                        con.Open();
                        string str = "INSERT INTO Person VALUES('" + name[0] + "','" + name[1] + "')";
                        SqlCommand com = new SqlCommand(str, con);
                        com.ExecuteNonQuery();
                    }
                }
            }
        }
    }
}
