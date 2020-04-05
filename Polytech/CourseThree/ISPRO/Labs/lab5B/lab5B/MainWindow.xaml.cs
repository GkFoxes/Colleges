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
using System.ComponentModel;

namespace lab5B
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private BackgroundWorker backgroundWorker;
        int counter = 0;

        public MainWindow()
        {
            InitializeComponent();
            backgroundWorker = (BackgroundWorker)this.FindResource("backgroundWoker");
        }

        private void BackgroundWorker_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            if (counter < 1000)
                num.Text = e.ProgressPercentage.ToString();
            if (counter >= 1000)
                num.Text = (1000 - (Convert.ToInt32(e.ProgressPercentage.ToString()) - 999)).ToString();

            progressBar.Value += 1;
        }

        private void BackgroundWorker_DoWork(object sender, DoWorkEventArgs e)
        {
            BackgroundWorker worker = sender as BackgroundWorker;

            for (; counter < 2000; counter++) {
                if (worker.CancellationPending == true)
                {
                    e.Cancel = true;
                    break;
                } else {
                    System.Threading.Thread.Sleep(5);
                    worker.ReportProgress(counter);
                }
            }
        }

        private void start_Click(object sender, RoutedEventArgs e)
        {
            Start.IsEnabled = false;
            Stop.IsEnabled = true;
            backgroundWorker.RunWorkerAsync();
        }

        private void stop_Click(object sender, RoutedEventArgs e)
        {
            if (backgroundWorker.WorkerSupportsCancellation == true)
            {
                Start.IsEnabled = true;
                backgroundWorker.CancelAsync();
                Stop.IsEnabled = false;
            }
        }

        private void BackgroundWorker_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            //do nothing
        }
    }
}
