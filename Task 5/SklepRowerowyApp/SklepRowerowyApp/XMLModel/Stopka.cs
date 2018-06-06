using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.XMLModel
{
    [XmlRoot("stopka", Namespace = "http://www.example.org/dokument")]
    public class Stopka
    {
        [XmlAttribute("dataUtworzenia")]
        public string DataUtworzenia { get; set; }

        [XmlAttribute("dataEdycji")]
        public string DataEdycji { get; set; }
    }
}
