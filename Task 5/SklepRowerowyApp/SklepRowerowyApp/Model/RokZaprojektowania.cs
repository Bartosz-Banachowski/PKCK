using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.Model
{
    [XmlRoot("RokZaprojektowania", Namespace = "http://www.example.org/dokument")]
    public class RokZaprojektowania
    {
        [XmlAttribute("rok")]
        public string Rok { get; set; }
    }
}
