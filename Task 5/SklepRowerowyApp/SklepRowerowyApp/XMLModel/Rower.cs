using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.XMLModel
{
    [XmlRoot("rower", Namespace = "http://www.example.org/dokument")]
    public class Rower
    {
        [XmlAttribute("Id")]
        public string IdRower { get; set; }

        [XmlElement("producent", Namespace = "http://www.example.org/dokument")]
        public List<Producent> ListaProducent { get; set; }

        [XmlElement("nazwa", Namespace = "http://www.example.org/dokument")]
        public List<string> ListaNazwa { get; set; }

        [XmlElement("waga", Namespace = "http://www.example.org/dokument")]
        public List<Waga> ListaWaga { get; set; }

        [XmlElement("cena", Namespace = "http://www.example.org/dokument")]
        public List<Cena> ListaCena { get; set; }

        [XmlElement("RokZaprojektowania", Namespace = "http://www.example.org/dokument")]
        public List<RokZaprojektowania> ListaRokZaprojektowania { get; set; }
    }
}
