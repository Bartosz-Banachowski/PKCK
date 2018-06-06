using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.XMLModel
{
    [XmlRoot("pochodzenie", Namespace = "http://www.example.org/dokument")]
    public class Pochodzenie
    {
        [XmlAttribute("Id")]
        public string IdPochodzenie { get; set; }

        [XmlAttribute("kraj")]
        public string Kraj { get; set; }

        [XmlAttribute("firma")]
        public string Firma { get; set; }
    }
}
