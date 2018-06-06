using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.XMLModel
{
    [XmlRoot("lista_rowerów", Namespace = "http://www.example.org/dokument")]
    public partial class ListaRowerow
    {
        [XmlElement("rower", Namespace = "http://www.example.org/dokument")]
        public List<Rower> ListaRower { get; set; }
    }
}
