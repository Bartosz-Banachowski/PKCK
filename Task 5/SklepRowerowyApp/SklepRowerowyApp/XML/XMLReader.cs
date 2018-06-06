using SklepRowerowyApp.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;

namespace SklepRowerowyApp.XML
{
    public class XMLReader
    {
        public FileInfo XmlFile { get; set; }
        public FileInfo SchemaFile { get; set; }
        XmlSerializer Serializer { get; set; }

        public XMLReader(string xmlFile, string schemaFile)
        {
            XmlFile = new FileInfo(xmlFile);
            SchemaFile = new FileInfo(schemaFile);
            Serializer = new XmlSerializer(typeof(Dokument));
        }

        public Dokument WczytajDane()
        {
            Dokument dokument = null;
            if (XmlFile.Exists)
            {
                using (TextReader reader = new StreamReader(XmlFile.FullName))
                {
                    dokument = (Dokument)Serializer.Deserialize(reader);
                    reader.Close();
                }
            } else
            {
                throw new IOException();
            }
            return dokument;
        }

        public void ZapiszDane(Dokument dokument)
        {
            if (XmlFile.Exists)
            {
                XmlFile.Delete();
            }

            Stream stream = new FileStream(XmlFile.FullName, FileMode.Create);
            Serializer.Serialize(stream, dokument);
            stream.Close();
        }

        public void ZapiszKopieDanych(Dokument dokument)
        {
            FileInfo fileInfo = new FileInfo("kopia.xml");

            if(fileInfo.Exists)
            {
                fileInfo.Delete();
            }

            Stream stream = new FileStream(XmlFile.FullName, FileMode.Create);
            Serializer.Serialize(stream, dokument);
            stream.Close();
        }

        public bool WalidacjaXmlSchema(Dokument dokument)
        {
            try
            {
                ZapiszKopieDanych(dokument);

                XmlDocument xmlDocument = new XmlDocument();
                string xmlText = File.ReadAllText("kopia.xml");
                xmlDocument.LoadXml(xmlText);
                xmlDocument.Schemas.Add("http://www.example.org/dokument", SchemaFile.FullName);
                xmlDocument.Validate(ValidationCallBack);
                return true;
            } catch
            {
                return false;
            }
        }

        private void ValidationCallBack(object sender, ValidationEventArgs e)
        {
            throw new Exception();
        }
    }
}
