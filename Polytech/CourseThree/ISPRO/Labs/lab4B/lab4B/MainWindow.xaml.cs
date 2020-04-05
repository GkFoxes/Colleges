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

namespace lab4B
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        int bInt = 1;
        int iInt = 1;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            foreach (FontFamily fontFamily in Fonts.SystemFontFamilies) {
                listBox.Items.Add(fontFamily.Source);
            }

            listBox.SelectedIndex = 0;
        }

        private void Bolt_Click(object sender, RoutedEventArgs e)
        {
            if (richTextBox != null && bInt == 1)
                richTextBox.Selection.ApplyPropertyValue(TextElement.FontWeightProperty, FontWeights.Bold);

            if (bInt == 2)
                richTextBox.Selection.ApplyPropertyValue(TextElement.FontWeightProperty, FontWeights.Normal);

            bInt ^= 3;
        }

        private void Italics_Click(object sender, RoutedEventArgs e)
        {
            if (richTextBox != null && iInt == 1)
                richTextBox.Selection.ApplyPropertyValue(TextElement.FontStyleProperty, FontStyles.Italic);

            if (iInt == 2)
                richTextBox.Selection.ApplyPropertyValue(TextElement.FontStyleProperty, FontStyles.Normal);

            iInt ^= 3;
        }

        private void Slider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if (richTextBox != null)
                richTextBox.Selection.ApplyPropertyValue(TextElement.FontSizeProperty, slider.Value);
        }

        private void ListBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (richTextBox != null && listBox.SelectedValue != null)
                richTextBox.Selection.ApplyPropertyValue(TextElement.FontFamilyProperty, listBox.SelectedValue);
        }
    }
}
