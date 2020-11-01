using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Support.UI;
using OpenQA.Selenium.Support.Extensions;
using System;
using System.Threading;
using System.Linq;

namespace Tests
{
    public class Tests
    {
        IWebDriver driver;
        WebDriverWait wait;
        public string login = "user@mail.ru";
        public string pass = "userUser1!";

        [SetUp]
        public void Setup()
        {
            var options = new ChromeOptions() { };
            //options.AddArguments("--headless");
            driver = new ChromeDriver();
            driver.Navigate().GoToUrl("https://localhost:44304/");
            wait = new WebDriverWait(driver, TimeSpan.FromSeconds(20));
        }

        [Test]
        public void addProduct()
        {
            Login();

            driver.Navigate().GoToUrl("https://localhost:44304/User/EditOrganizationView?id=1");

            wait.Until(ExpectedConditions.ElementExists(By.ClassName("table")));
            var elBeforeTest = driver.FindElements(By.CssSelector("[role='row']")).Count;

            driver.ExecuteJavaScript("$(\".addProduct\")[0].click()");
            wait.Until(ExpectedConditions.ElementExists(By.ClassName("modal")));

            driver.ExecuteJavaScript($"$(\"[data-name = 'Name']\")[0].value = \"Test {DateTime.Now.ToString("HH:mm:ss")}\"");
            driver.ExecuteJavaScript($"$(\"[data-name = 'Price']\")[0].value = \"{new Random().Next(10000)}\"");

            driver.ExecuteJavaScript("$(\"[data-save = 'modal']\")[0].click()");

            Thread.Sleep(2000);
            wait.Until(ExpectedConditions.ElementExists(By.ClassName("table")));

            var elAfterTest = driver.FindElements(By.CssSelector("[role='row']")).Count;

            if (elAfterTest > elBeforeTest) //исходя и строк в таблице после теста
            {
                Assert.Pass();
            }
            else
            {
                Assert.Fail();
            }

        }

        [Test]
        public void removeProduct()
        {
            Login();

            driver.Navigate().GoToUrl("https://localhost:44304/User/EditOrganizationView?id=1");

            wait.Until(ExpectedConditions.ElementExists(By.ClassName("table")));
            var elBeforeTest = driver.FindElements(By.CssSelector("[role='row']")).Count;

            driver.FindElement(By.ClassName("dropdown-toggle")).Click();
            driver.FindElements(By.CssSelector("[title='Удалить выбранную запись'")).FirstOrDefault().Click();

            Thread.Sleep(2000);
            wait.Until(ExpectedConditions.ElementExists(By.ClassName("table")));

            var elAfterTest = driver.FindElements(By.CssSelector("[role='row']")).Count;

            if (elAfterTest < elBeforeTest)  //исходя и строк в таблице после теста
            {
                Assert.Pass();
            }
            else
            {
                Assert.Fail();
            }
        }

        public void Login()
        {
            driver.Navigate().GoToUrl("https://localhost:44304/Account/Login");

            driver.ExecuteJavaScript($"$(\"[type = 'email']\")[0].value = \"{login}\"");
            driver.ExecuteJavaScript($"$(\"[type = 'password']\")[0].value = \"{pass}\"");
            driver.ExecuteJavaScript("$(\"[type = 'submit']\")[0].click()");
            wait = new WebDriverWait(driver, TimeSpan.FromSeconds(20));
        }


    }
}