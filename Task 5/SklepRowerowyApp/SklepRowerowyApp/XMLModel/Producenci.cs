using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.XMLModel
{
    [XmlRoot("producenci", Namespace = "http://www.example.org/dokument")]
    public class Producenci
    {
        [XmlElement("pochodzenie", Namespace = "http://www.example.org/dokument")]
        public List<Pochodzenie> ListaPochodzenie { get; set; }
    }
}
