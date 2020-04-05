using System;
using System.IO;
using System.Security;
using System.Windows;
using System.Windows.Controls;

namespace lab6D
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

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            SetTreeView(new DirectoryInfo(@"\\Mac\Home\Documents\"));
        }

        private void SetTreeView(DirectoryInfo directory, ItemCollection collection = null)
        {
            try
            {
                if (collection == null) collection = treeView.Items;

                foreach (DirectoryInfo folder in directory.GetDirectories()) {
                    var tvi = new TreeViewItem()
                    {
                        Header = new TextBlock()
                        {
                            Text = folder.Name,
                            Tag = folder.FullName,

                        }
                    };

                    collection.Add(tvi);
                    SetTreeView(folder, tvi.Items);
                }
            }
            catch (SecurityException) { }
            catch (DirectoryNotFoundException) { }
            catch (UnauthorizedAccessException) { }
        }

        private void TreeView_SelectedItemChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            object newValue = e.NewValue;
            var directory = new DirectoryInfo(((TextBlock)((TreeViewItem)newValue).Header).Tag.ToString());

            info.Text = 
                "Attributes: " + directory.Attributes +
                "\nCreation Time: " + directory.CreationTime +
                "\nLast Opened: " + directory.LastAccessTime +
                "\nLast Edited: " + directory.LastWriteTime +
                "\nFull Name: " + directory.FullName +
                "\nName: " + directory.Name;
        }
    }
}
