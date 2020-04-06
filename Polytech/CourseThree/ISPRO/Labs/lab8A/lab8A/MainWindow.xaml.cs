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

namespace lab8A
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

        private void Play(object sender, MouseButtonEventArgs e)
        {
            videoPlayer.Play();
        }

        private void Stop(object sender, MouseButtonEventArgs e)
        {
            videoPlayer.Stop();

            videoPlayer.Position = TimeSpan.FromTicks(1);
        }

        private void Pause(object sender, MouseButtonEventArgs e)
        {
            videoPlayer.Pause();
        }

        private void OpenFile(object sender, MouseButtonEventArgs e)
        {
            OpenFileDialog OpenFileD = new OpenFileDialog();
            OpenFileD.Filter = "Video (*.asf, *.avi, *.flv, *.mkv, *.mp2, *.mp4, *.mpeg, *.mpg, *.mov, *.mts, *.swf, *.wmv)|*.3gp; *.asf; *.avi; *.flv; *.mkv; *.mp2; *.mp4; *.mpeg; *.mpg; *.mov; *.mts; *.swf; *.wmv|Music (*aac, *.flac, *.mp3, *.wav, *.wma)|*aac; *.flac; *.mp3; *.wav; *.wma";

            if (OpenFileD.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                videoPlayer.Source = new Uri(OpenFileD.FileName);
                videoPlayer.SpeedRatio = speed.Value;
                videoPlayer.Balance = balance.Value;
                videoPlayer.Volume = volume.Value;

                if (OpenFileD.FilterIndex == 1)
                {
                    Stop(sender, e);
                    image.Visibility = Visibility.Collapsed;
                    videoPlayer.Visibility = Visibility.Visible;
                } else {
                    image.Visibility = Visibility.Visible;
                    videoPlayer.Visibility = Visibility.Collapsed;
                }
            }
        }

        private void volumeChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            videoPlayer.Volume = (double)volume.Value;

            try
            {
                showVolume.Content = (int)((double)volume.Value * 100);
            }

            catch { }
        }

        private void balanceChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            videoPlayer.Balance = (double)balance.Value;

            try
            {
                showBalance.Content = Math.Round(balance.Value, 1);
            }

            catch { }
        }

        private void speedChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            if ((double)speed.Value >= 1)
            {
                videoPlayer.SpeedRatio = (int)speed.Value;

                try
                {
                    showSpeed.Content = "x" + (int)speed.Value;
                }

                catch { }
            } else {
                videoPlayer.SpeedRatio = (double)Math.Round(speed.Value, 1);

                try
                {
                    showSpeed.Content = "x" + (double)Math.Round(speed.Value, 1);
                }

                catch { }
            }
        }

        private void VideoStop(object sender, RoutedEventArgs e)
        {
            videoPlayer.Stop();
            videoPlayer.Position = TimeSpan.FromTicks(1);
        }
    }
}
