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

namespace lab3C
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        int coordinateX;
        int coordinateY;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Canvas_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (coordinateX == default(int) && coordinateY == default(int))
            {
                coordinateX = (int)e.GetPosition(canvas).X - 4;
                coordinateY = (int)e.GetPosition(canvas).Y - 4;
                canvas.Children.Add(new Ellipse
                {
                    Height = 10,
                    Width = 10,
                    Fill = Brushes.Black,
                    Margin = new Thickness(coordinateX, coordinateY, 0, 0)
                });
            } else {
                canvas.Children.Add(new Line
                {
                    X1 = coordinateX + 5,
                    Y1 = coordinateY + 5,
                    X2 = e.GetPosition(canvas).X,
                    Y2 = e.GetPosition(canvas).Y,

                    Stroke = Brushes.Black,
                    StrokeThickness = 2
                });

                coordinateX = (int)e.GetPosition(canvas).X - 5;
                coordinateY = (int)e.GetPosition(canvas).Y - 5;

                canvas.Children.Add(new Ellipse
                {
                    Height = 10,
                    Width = 10,
                    Fill = Brushes.Red,
                    Margin = new Thickness(coordinateX, coordinateY, 0, 0)
                });
            }
        }
    }
}
