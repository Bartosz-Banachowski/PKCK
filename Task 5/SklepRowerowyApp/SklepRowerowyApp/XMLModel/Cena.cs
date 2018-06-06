using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.XMLModel
{
    [XmlRoot("cena", Namespace = "http://www.example.org/dokument")]
    public class Cena
    {
        [XmlAttribute("waluta")]
        public string Waluta { get; set; }

        [XmlText]
        public string CenaWartosc { get; set; }
    }
}
