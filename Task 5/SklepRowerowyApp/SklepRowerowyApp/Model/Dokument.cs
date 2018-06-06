using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.Model
{
    [XmlRoot("dokument", Namespace = "http://www.example.org/dokument")]
    public partial class Dokument
    {
        [XmlElement("autorzy", Namespace = "http://www.example.org/dokument")]
        public List<Autorzy> ListaAutorzy { get; set; }

        [XmlElement("sklep_rowerowy", Namespace = "http://www.example.org/dokument")]
        public List<SklepRowerowy> ListaSklepowRowerowych { get; set; }
    }
}
