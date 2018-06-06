using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.XMLModel
{
    [XmlRoot("waga", Namespace = "http://www.example.org/dokument")]
    public class Waga
    {
        [XmlAttribute("jednostka")]
        public string Jednostka { get; set; }

        [XmlText]
        public string WagaWartosc { get; set; }
    }
}
