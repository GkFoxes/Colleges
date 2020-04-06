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
using System.Data;
using System.Data.SqlClient;

namespace lab10B
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DataSet dataSet = new DataSet();

        public MainWindow()
        {
            InitializeComponent();

            string connection = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=\\Mac\Home\Documents\Study\ИСРПО\Labs\lab10B\lab10B\Database1.mdf;Integrated Security=True";

            string queryString = "SELECT * FROM [Table]";

            using (SqlConnection sqlConnection = new SqlConnection(connection))
            {
                sqlConnection.Open();
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(queryString, connection);
                sqlDataAdapter.Fill(dataSet, "Table");
            }

            List.DataContext = dataSet;
        }
    }
}
