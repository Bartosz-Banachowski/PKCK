using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace SklepRowerowyApp.Model
{
    [XmlRoot("autor", Namespace = "http://www.example.org/dokument")]
    public class Autor
    {
        [XmlAttribute("Indeks")]
        public string Indeks { get; set; }

        [XmlElement("imię", Namespace = "http://www.example.org/dokument")]
        public List<string> ListaImie { get; set; }

        [XmlElement("nazwisko", Namespace = "http://www.example.org/dokument")]
        public List<string> ListaNazwisko { get; set; }

        [XmlElement("email", Namespace = "http://www.example.org/dokument")]
        public List<string> ListaEmail { get; set; }
    }
}
