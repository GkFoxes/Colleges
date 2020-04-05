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
using System.IO;

namespace lab6E
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Write_Click(object sender, RoutedEventArgs e)
        {
            var path = @"\\Mac\Home\Documents\Study\txt.txt";
            WriteFile(path, sender as RichTextBox);
        }

        private async void WriteFile(string path, RichTextBox rbt)
        {
            FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Write);

            using (StreamWriter streamWriter = new StreamWriter(fs, Encoding.UTF8))
            {
                string s = new TextRange(rtb.Document.ContentStart, rtb.Document.ContentEnd).Text;

                await streamWriter.WriteAsync(s);

                MessageBox.Show("Файл записан.");
            }
        }

        private void Read_Click(object sender, RoutedEventArgs e)
        {
            var path = @"\\Mac\Home\Documents\Study\txt.txt";
            ReadFile(path, sender as RichTextBox);
        }

        private async void ReadFile(string path, RichTextBox rbt)
        {
            FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read);

            using (StreamReader streamReader = new StreamReader(fs, Encoding.UTF8))
            {
                string s = await streamReader.ReadToEndAsync();

                if (rbt != null) rbt.Document.Blocks.Clear();

                rtb.Document.Blocks.Add(new Paragraph(new Run(s)));
            }
        }
    }
}
