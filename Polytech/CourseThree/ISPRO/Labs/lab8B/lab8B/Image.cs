using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab8B
{
    class Image
    {
        readonly string name;
        public string Name {
            get {
                return name;
            }
        }

        readonly string path;
        public string Path {
            get {
                return path;
            }
        }

        public Image(string name, string path)
        {
            this.name = name;
            this.path = path;
        }
    }
}
