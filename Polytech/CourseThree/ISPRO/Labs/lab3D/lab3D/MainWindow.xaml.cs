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

namespace lab3D
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

        private void VisualBrush_Click(object sender, RoutedEventArgs e)
        {
            var brush = new VisualBrush() {
                Visual = VisualBrushButton,
                Opacity = 0.4
            };

            rectangle.Fill = brush;
            ellipse.Fill = brush;
            polygon.Fill = brush;
        }

        private void LinearGradientBrush_Click(object sender, RoutedEventArgs e)
        {
            var brush = new LinearGradientBrush()
            {
                Opacity = 0.45,
                StartPoint = new Point(0, 1),
                EndPoint = new Point(1, 0)
            };

            brush.GradientStops.Add(new GradientStop(Colors.Red, 0.0));
            brush.GradientStops.Add(new GradientStop(Colors.Blue, 1));

            rectangle.Fill = brush;
            ellipse.Fill = brush;
            polygon.Fill = brush;
        }

        private void RadialGradientBrush_Click(object sender, RoutedEventArgs e)
        {
            var brush = new RadialGradientBrush()
            {
                Opacity = 0.45,
                GradientOrigin = new Point(0, 0),
                Center = new Point(0, 0),
                RadiusX = 3,
                RadiusY = 3
            };

            brush.GradientStops.Add(new GradientStop(Colors.Blue, 0.0));
            brush.GradientStops.Add(new GradientStop(Colors.Orange, 1));

            rectangle.Fill = brush;
            ellipse.Fill = brush;
            polygon.Fill = brush;
        }

        private void ImageBrush_Click(object sender, RoutedEventArgs e)
        {
            var brush = new ImageBrush()
            {
                Opacity = 0.5
            };

            BitmapImage bitmap = new BitmapImage();
            bitmap.BeginInit();
            bitmap.UriSource = new Uri(@"\\Mac\Home\Documents\Study\ИСРПО\Labs\lab3D\lab3D\image.JPG");
            bitmap.EndInit();

            brush.ImageSource = bitmap;

            rectangle.Fill = brush;
            ellipse.Fill = brush;
            polygon.Fill = brush;
        }
    }
}
