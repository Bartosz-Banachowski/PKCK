using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.XMLModel
{
    [XmlRoot("producent", Namespace = "http://www.example.org/dokument")]
    public class Producent
    {
        [XmlAttribute("idref")]
        public string Idref { get; set; }
    }
}
