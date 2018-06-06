using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.Model
{
    [XmlRoot("sklep_rowerowy", Namespace = "http://www.example.org/dokument")]
    public class SklepRowerowy
    {
        [XmlElement("rodzaj", Namespace = "http://www.example.org/dokument")]
        public List<Rodzaj> ListaRodzaj { get; set; }

        [XmlElement("producenci", Namespace = "http://www.example.org/dokument")]
        public List<Producenci> ListaProducenci { get; set; }

        [XmlElement("stopka", Namespace = "http://www.example.org/dokument")]
        public List<Stopka> ListaStopka { get; set; }
    }
}
