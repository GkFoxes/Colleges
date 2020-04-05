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

namespace lab3B
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

        private void Rotate_Click(object sender, RoutedEventArgs e)
        {
            for (int i = 0; i < Stack.Children.Count; i++) {
                var rotateTransform = Stack.Children[i].RenderTransform as RotateTransform;
                var transform = new RotateTransform(45 + rotateTransform?.Angle ?? 45);

                Stack.Children[i].RenderTransform = transform;
            }
        }

        private void Scale_Click(object sender, RoutedEventArgs e)
        {
            for (int i = 0; i < Stack.Children.Count; i++) {
                var scaleTransform = Stack.Children[i].RenderTransform as ScaleTransform;
                var transform = new ScaleTransform(3 ^ (int)(scaleTransform?.ScaleX ?? 1), 3 ^ (int)(scaleTransform?.ScaleY ?? 1));

                Stack.Children[i].RenderTransform = transform;
            }
        }

        private void Translate_Click(object sender, RoutedEventArgs e)
        {
            for (int i = 0; i < Stack.Children.Count; i++) {
                var translateTransform = Stack.Children[i].RenderTransform as TranslateTransform;
                var transform = new TranslateTransform(45 + translateTransform?.X ?? 45, 45 + translateTransform?.Y ?? 45);

                Stack.Children[i].RenderTransform = transform;
            }
        }
    }
}
