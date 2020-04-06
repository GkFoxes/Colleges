using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;

namespace lab10A
{
    class Subdivision
    {
        public string Name {
            get;
            set;
        }

        private ObservableCollection<string> workers;
        public ObservableCollection<string> Workers { get { return workers; } set { workers = value; } }

        public void AddWorker(string worker)
        {
            workers.Add(worker);
        }

        public Subdivision()
        {
            Workers = new ObservableCollection<string>();
        }

        public Subdivision(string Name)
        {
            this.Name = Name;

            Workers = new ObservableCollection<string>();
        }

        public Subdivision(string Name, ObservableCollection<string> Workers)
        {
            this.Name = Name;
            this.Workers = Workers;
        }
    }
}
