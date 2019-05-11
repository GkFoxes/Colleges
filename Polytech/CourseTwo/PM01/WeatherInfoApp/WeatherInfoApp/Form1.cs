using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using Newtonsoft.Json;
using System.IO;

namespace WeatherInfoApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        async void GetWeatherForecast()
        {
            if (InternetConnection.IsConnectedToInternet() == false)
                MessageBox.Show("Отсутствует интернет-соединение!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            else
            {
                WebResponse response;
                string answer = string.Empty;

                string city = textBox1.Text;

                WebRequest request = WebRequest.Create($"http://api.openweathermap.org/data/2.5/weather?q={city}&units=metric&APPID=de8d63d5a267652c85f3fe2614a45ff6");
                textBox1.Text = null;
                request.Method = "POST";
                request.ContentType = "application/x-www-urlencoded";

                try
                {
                    response = await request.GetResponseAsync();
                    using (Stream s = response.GetResponseStream())
                    {
                        using (StreamReader reader = new StreamReader(s))
                        {
                            answer = await reader.ReadToEndAsync();
                        }
                    }
                    response.Close();
                }
                catch
                {
                    MessageBox.Show("Неверное название города!", "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    this.Close();
                }

                OpenWeather.OpenWeather open_w = JsonConvert.DeserializeObject<OpenWeather.OpenWeather>(answer);

                label1.Visible = true;
                groupBox1.Visible = true;
                groupBox2.Visible = true;
                pictureBox2.Visible = false;
                label9.Visible = false;

                // установка картинки фона в зависимости от погоды:
                string back_img = string.Empty;
                switch (open_w.weather[0].icon)
                {
                    case "01d":
                        back_img = "SunShine";
                        break;

                    case "02d":
                        back_img = "CloudSun";
                        break;

                    case "03d":
                        back_img = "CloudsDay";
                        break;

                    case "04d":
                        back_img = "CloudsDay";
                        break;

                    case "09d":
                        back_img = "Rain";
                        break;

                    case "10d":
                        back_img = "Rain";
                        break;

                    case "11d":
                        back_img = "ThunderStorm";
                        break;

                    case "13d":
                        back_img = "SnowFall";
                        break;

                    case "50d":
                        back_img = "Mist";
                        break;

                    case "01n":
                        back_img = "ClearMoon";
                        break;

                    case "02n":
                        back_img = "CloudMoon";
                        break;

                    case "03n":
                        back_img = "CloudsNight";
                        break;

                    case "04n":
                        back_img = "CloudsNight";
                        break;

                    case "09n":
                        back_img = "Rain";
                        break;

                    case "10n":
                        back_img = "Rain";
                        break;

                    case "11n":
                        back_img = "ThunderStorm";
                        break;

                    case "13n":
                        back_img = "SnowFall";
                        break;

                    case "50n":
                        back_img = "Mist";
                        break;
                }
                Bitmap backgr_img = new Bitmap($"icons/{back_img}.jpg");
                Form.ActiveForm.BackgroundImage = backgr_img;

                pictureBox1.BackgroundImage = open_w.weather[0].Icon;
                label1.Text = open_w.name + ", " + open_w.sys.country; // название города и код страны
                label2.Text = open_w.weather[0].main; // сокращенное описание погоды (осадки)
                label3.Text = open_w.weather[0].description; // полное описание погоды (какого рода осадки)
                label4.Text = open_w.main.temp.ToString("0.#") + "°C"; // текущая температура
                label5.Text = "Влажность воздуха: " + open_w.main.humidity.ToString() + "%";
                label6.Text = "Атмосферное давление: " + open_w.main.pressure.ToString("0.") + " mm";
                label7.Text = "Скорость ветра: " + open_w.wind.speed.ToString() + " м/с";
                label8.Text = "Направление ветра: " + open_w.wind.deg.ToString("0.#") + "°";
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            GetWeatherForecast();
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 13)
                GetWeatherForecast();
        }

        private void textBox1_MouseHover(object sender, EventArgs e)
        {
            toolTip1.SetToolTip(textBox1, "Введите здесь название города. . . ");
        }
    }
}
