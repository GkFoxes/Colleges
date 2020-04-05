using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Forms;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using FolderBrowserDialog = System.Windows.Forms.FolderBrowserDialog;

namespace lab6C
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

        private void NewFile_Checked(object sender, RoutedEventArgs e)
        {
            if (newFile.IsChecked.Value)
            {
                txt.Text = "Путь к папке";
                obj.IsEnabled = true;
            } else {
                obj.IsEnabled = false;
                txt.Text = "Путь к файлу";
            }
        }

        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if (addText.IsChecked.Value)
            {
                File.AppendAllText(path.Text, text.Text);
            } else {
                if (File.Exists(path.Text))
                {
                    FileStream fs = File.Open(path.Text, FileMode.Open, FileAccess.Write);
                    byte[] info = new UTF8Encoding(true).GetBytes(text.Text);

                    fs.Write(info, 0, info.Length);
                    fs.Close();
                } else {
                    FileStream fs = File.Create(path.Text + "\\" + obj.Text + ".txt");
                    byte[] info = new UTF8Encoding(true).GetBytes(text.Text);

                    fs.Write(info, 0, info.Length);
                    fs.Close();
                }
            }
        }

        private void View_Click(object sender, RoutedEventArgs e)
        {
            if (addText.IsChecked.Value)
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "txt files (*.txt)|*.txt";
                openFileDialog.FilterIndex = 2;

                DialogResult result = openFileDialog.ShowDialog();
                path.Text = openFileDialog.FileName;

                if (path.Text != "")
                {
                    save.IsEnabled = true;
                } else {
                    save.IsEnabled = false;
                }
            } else {
                if (newFile.IsChecked.Value)
                {
                    FolderBrowserDialog folder = new FolderBrowserDialog();
                    DialogResult result = folder.ShowDialog();
                    path.Text = folder.SelectedPath;

                    if (path.Text != "")
                    {
                        save.IsEnabled = true;
                    } else {
                        save.IsEnabled = false;
                    }
                } else {
                    OpenFileDialog openFileDialog = new OpenFileDialog();
                    openFileDialog.Filter = "txt files (*.txt)|*.txt";
                    openFileDialog.FilterIndex = 2;

                    DialogResult result = openFileDialog.ShowDialog();
                    path.Text = openFileDialog.FileName;

                    if (path.Text != "")
                    {
                        ReadFile(path.Text);
                        save.IsEnabled = true;
                    } else {
                        save.IsEnabled = false;
                    }
                }
            }
        }

        private void ReadFile(string path)
        {
            FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read);

            using (StreamReader streamReader = new StreamReader(fs, Encoding.UTF8))
            {
                text.Text = streamReader.ReadToEnd();
            }
        }

        private void AddText_Checked(object sender, RoutedEventArgs e)
        {
            txt.Text = "Путь к файлу";
        }

        private void Find_Click(object sender, RoutedEventArgs e)
        {
            if (addText.IsChecked.Value)
            {
                save.IsEnabled = true;
            } else {
                if (File.Exists(path.Text))
                {
                    ReadFile(path.Text);
                    save.IsEnabled = true;
                } else {
                    System.Windows.MessageBox.Show("Файл не найден.");
                    save.IsEnabled = false;
                }
            }
        }

        private void Clean_Click(object sender, RoutedEventArgs e)
        {
            path.Text = "";
            text.Text = "";
        }
    }
}
