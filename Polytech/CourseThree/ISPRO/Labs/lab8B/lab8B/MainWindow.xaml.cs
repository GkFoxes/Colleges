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
using System.Windows.Forms;
using System.Collections.ObjectModel;

namespace lab8B
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        ObservableCollection<Image> images = new ObservableCollection<Image>();

        public MainWindow()
        {
            InitializeComponent();

            ImagesBox.ItemsSource = images;
            ImagesView.ItemsSource = images;
            ImagesComboBox.ItemsSource = images;
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image Files(*.png;*.jpg)|*.png;*.jpg|All files (*.*)|*.*";
            openFileDialog.FilterIndex = 1;

            DialogResult result = openFileDialog.ShowDialog();

            images.Add(new Image(openFileDialog.SafeFileName, openFileDialog.FileName));
        }
    }
}
