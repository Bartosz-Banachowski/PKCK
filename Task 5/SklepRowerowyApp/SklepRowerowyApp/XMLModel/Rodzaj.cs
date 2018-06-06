using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.XMLModel
{
    [XmlRoot("rodzaj", Namespace = "http://www.example.org/dokument")]
    public partial class Rodzaj
    {
        [XmlAttribute("Id")]
        public string IdRodzaj { get; set; }

        [XmlAttribute("nazwa")]
        public string NazwaRodzaj { get; set; }

        [XmlElement("opis", Namespace = "http://www.example.org/dokument")]
        public List<string> ListaOpis { get; set; }

        [XmlElement("lista_rowerów", Namespace = "http://www.example.org/dokument")]
        public List<ListaRowerow> ListaListaRowerow { get; set; }
    }
}
