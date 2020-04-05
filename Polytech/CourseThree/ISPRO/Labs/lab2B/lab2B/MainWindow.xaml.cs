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

namespace lab2B
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Deck deck = new Deck();
        string[] Suits = new string[] {"diamond", "heart", "cross", "spear"};

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Deck_Click(object sender, RoutedEventArgs e)
        {
            Cards.Children.Clear();
            for (int i = 0; i < 52; i += 4) {
                StackPanel stackPanel = new StackPanel { Width = 90 };

                for (int j = 0; j < 4; j++) {
                    deck.SetCard(i + j, i, Suits[j]);
                    stackPanel.Children.Add(new Image { Source = new BitmapImage(new Uri(@"\\Mac\Home\Documents\Study\ИСРПО\Labs\lab2B\lab2B\card-white-" + Suits[j] + "-" + (i / 4 + 2).ToString() + ".png")) });
                }

                Cards.Children.Add(stackPanel);
            }
        }

        private void NewDeck_Click(object sender, RoutedEventArgs e)
        {
            Cards.Children.Clear();
            deck.Shuffle();

            for (int i = 0; i < 52; i += 4) {
                StackPanel stackPanel = new StackPanel { Width = 90 };

                for (int j = 0; j < 4; j++) {
                    string rank = (int.Parse(deck.cards[i + j].ToString().Split(' ')[1]) / 4 + 2).ToString();
                    string suit = deck.cards[i + j].ToString().Split(' ')[0];
                    stackPanel.Children.Add(new Image { Source = new BitmapImage(new Uri(@"\\Mac\Home\Documents\Study\ИСРПО\Labs\lab2B\lab2B\card-white-" + suit + "-" + rank + ".png")) });
                }

                Cards.Children.Add(stackPanel);
            }
        }
    }
}
