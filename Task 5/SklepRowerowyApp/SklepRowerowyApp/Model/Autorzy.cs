using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.Model
{
    [XmlRoot("autorzy", Namespace = "http://www.example.org/dokument")]
    public class Autorzy
    {
        [XmlElement("autor", Namespace = "http://www.example.org/dokument")]
        public List<Autor> ListaAutor { get; set; }
    }
}
