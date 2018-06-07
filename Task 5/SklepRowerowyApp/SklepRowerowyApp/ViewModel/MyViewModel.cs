using SklepRowerowyApp.XMLModel;
using SklepRowerowyApp.XML;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;
using SklepRowerowyApp.Model;
using ibex4;
using System.IO;
using System.Xml.Xsl;
using System.Xml;

namespace SklepRowerowyApp.ViewModel
{
    public class MyViewModel : INotifyPropertyChanged
    {

        public MyViewModel()
        {
            StworzListaProducentow();
            StworzListaJednostek();
            StworzListaWalut();
            StworzListaRodzajow();
            StworzListaRodzajowEdycja();

            WczytajDane = new DelegateCommand(Wczytaj);
            DodajDane = new DelegateCommand(Dodaj);
            UsunDane = new DelegateCommand(Usun);
            ZapiszDane = new DelegateCommand(Zapisz);
            KonwertujDoPDF = new DelegateCommand(XSLtoPDF);
            KonwertujDoXHTML = new DelegateCommand(TransformXMLToHTML);
            KonwertujDoSVG = new DelegateCommand(TransformXMLToSVG);
            KonwertujDoTXT = new DelegateCommand(TransformXMLToTXT);
        }

        public ICommand WczytajDane { get; }
        public ICommand DodajDane { get; }
        public ICommand UsunDane { get; }
        public ICommand ZapiszDane { get; }
        public ICommand KonwertujDoPDF { get; }
        public ICommand KonwertujDoXHTML { get; }
        public ICommand KonwertujDoSVG { get; }
        public ICommand KonwertujDoTXT { get; }
        private RowerM wybranyRowerM;
        private ObservableCollection<RowerM> _listaRowerowM;
        private List<string> _listaProducentow, _listaJednostek, _listaWalut, _listaRodzajow, _listaRodzajowEdycja;
        private string _wybranyProducent, _wybranaJednostka, _wybranaWaluta, _wybranyRodzaj, _id, _nazwa, _waga, _cena, _rokStworzenia;

        public RowerM WybranyRowerM
        {
            get { return wybranyRowerM; }
            set { this.wybranyRowerM = value;
                if (WybranyRowerM != null)
                {
                    WybranyRodzajEdycja = WybranyRowerM.IdRodzaj;
                    IDEdycja = WybranyRowerM.Id;
                    WybranyProducentEdycja = WybranyRowerM.Producent;
                    NazwaEdycja = WybranyRowerM.Nazwa;
                    WagaEdycja = WybranyRowerM.Waga.Substring(0, WybranyRowerM.Waga.Length - 3);
                    WybranaJednostkaEdycja = WybranyRowerM.Waga.Substring(WybranyRowerM.Waga.Length - 2);
                    CenaEdycja = WybranyRowerM.Cena.Substring(0, WybranyRowerM.Cena.Length - 4);
                    WybranaWalutaEdycja = WybranyRowerM.Cena.Substring(WybranyRowerM.Cena.Length - 3);
                    RokStworzeniaEdycja = WybranyRowerM.RokZaprojektowania;
                }
                }
        }

        public RoweryM RoweryM { get; set; }
        public ObservableCollection<RowerM> ListaRowerowM
        {
            get { return _listaRowerowM; }
            set { this._listaRowerowM = value;
                RaisePropertyChanged("ListaRowerowM");
            }
        }

        public List<string> ListaRodzajowEdycja
        {
            get { return _listaRodzajowEdycja; }
            set { this._listaRodzajowEdycja = value; }

        }

        public Dokument Dokument { get; set; }
        
        public XMLReader XmlReader { get; set; }

        #region Dodawanie rowerow

        public List<string> ListaProducentow
        {
            get { return _listaProducentow;}
            set { this._listaProducentow = value; }
        }
        public string WybranyProducent
        {
            get { return _wybranyProducent; }
            set { this._wybranyProducent = value; }
        }

        public List<string> ListaJednostek
        {
            get { return _listaJednostek; }
            set { this._listaJednostek = value; }
        }

        public string WybranaJednostka
        {
            get { return _wybranaJednostka; }
            set { this._wybranaJednostka = value; }
        }

        public List<string> ListaWalut
        {
            get { return _listaWalut; }
            set { this._listaWalut = value;}
        }
  
        public string WybranaWaluta
        {
            get { return _wybranaWaluta; }
            set { this._wybranaWaluta = value; }
        }

        public List<string> ListaRodzajow
        {
            get { return _listaRodzajow; }
            set { this._listaRodzajow = value;}
        }

        public string WybranyRodzaj
        {
            get { return _wybranyRodzaj; }
            set { this._wybranyRodzaj = value; }
        }

        public string ID
        {
            get { return _id; }
            set { this._id = value; }
        }

        public string Nazwa
        {
            get { return _nazwa; }
            set { this._nazwa = value;
                RaisePropertyChanged("Nazwa");
            }
        }

        public string Waga
        {
            get { return _waga; }
            set { this._waga = value; }
        }

        public string Cena
        {
            get { return _cena; }
            set { this._cena = value; }
        }

        public string RokStworzenia
        {
            get { return _rokStworzenia; }
            set { this._rokStworzenia = value; }
        }
        #endregion

        #region edycja rowerow

        private string wybranyRodzajEdycja, idEdycja, wybranyProducentEdycja, nazwaEdycja, wagaEdycja, wybranaJednostkaEdycja, cenaEdycja, wybranaWalutaEdycja, rokStworzeniaEdycja;

        public string WybranyRodzajEdycja
        {
            get { return wybranyRodzajEdycja; }
            set { this.wybranyRodzajEdycja = value;
                RaisePropertyChanged("WybranyRodzajEdycja");
            }
        }

        public string IDEdycja
        {
            get { return idEdycja; }
            set { this.idEdycja = value;
                RaisePropertyChanged("IDEdycja");
            }
        }

        public string WybranyProducentEdycja
        {
            get { return wybranyProducentEdycja; }
            set { this.wybranyProducentEdycja = value;
                RaisePropertyChanged("WybranyProducentEdycja");
            }
        }

        public string NazwaEdycja
        {
            get { return nazwaEdycja; }
            set { this.nazwaEdycja = value;
                RaisePropertyChanged("NazwaEdycja");
            }
        }

        public string WagaEdycja
        {
            get { return wagaEdycja; }
            set { this.wagaEdycja = value;
                RaisePropertyChanged("WagaEdycja");
            }
        }

        public string WybranaJednostkaEdycja
        {
            get { return wybranaJednostkaEdycja; }
            set { this.wybranaJednostkaEdycja = value;
                RaisePropertyChanged("WybranaJednostkaEdycja");
            }
        }

        public string CenaEdycja
        {
            get { return cenaEdycja; }
            set { this.cenaEdycja = value;
                RaisePropertyChanged("CenaEdycja");
            }
        }

        public string WybranaWalutaEdycja
        {
            get { return wybranaWalutaEdycja; }
            set { this.wybranaWalutaEdycja = value;
                RaisePropertyChanged("WybranaWalutaEdycja");
            }
        }

        public string RokStworzeniaEdycja
        {
            get { return rokStworzeniaEdycja; }
            set { this.rokStworzeniaEdycja = value;
                RaisePropertyChanged("RokStworzeniaEdycja");
            }
        }

        #endregion


        public event PropertyChangedEventHandler PropertyChanged;
        private void RaisePropertyChanged(string propertyName_)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName_));
        }

        public void StworzListaProducentow()
        {
            ListaProducentow = new List<string>()
            {
                "kross",
                "specialized",
                "legrand",
                "trek"
            };
        }

        public void StworzListaJednostek()
        {
            ListaJednostek = new List<string>()
            {
                "kg",
                "lbs"
            };
        }

        public void StworzListaWalut()
        {
            ListaWalut = new List<string>()
            {
                "PLN",
                "EUR",
                "USD"
            };
        }

        public void StworzListaRodzajow()
        {
            ListaRodzajow = new List<string>()
            {
                "Szosowy",
                "Górskie",
                "Miejskie",
                "Elektryczne",
                "Zjazdowy"
            };
        }

        public void StworzListaRodzajowEdycja()
        {
            ListaRodzajowEdycja = new List<string>()
            {
                "S",
                "G",
                "M",
                "E",
                "Z"
            };
        }

        public void Wczytaj()
        {
            Dokument = new Dokument();
            XmlReader = new XMLReader(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\skleprowerowy.xml", @"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\skleprowerowy.xsd");
            if (!XmlReader.XmlFile.Exists)
            {
                MessageBox.Show("error");
            }
            else
            {
                Dokument = XmlReader.WczytajDane();
                RoweryM = new RoweryM(Dokument);
                MessageBox.Show("Sukces!");
            }
            ListaRowerowM = RoweryM.getListaRowerowM();
        }

        public void Dodaj()
        {
            var coTo = Dokument.ListaSklepowRowerowych.FirstOrDefault().ListaRodzaj.FirstOrDefault(x => x.IdRodzaj == WybranyRodzaj.ElementAt(0).ToString()).ListaListaRowerow.FirstOrDefault().ListaRower.Count + 1;

            var IDtemp = WybranyRodzaj.ElementAt(0).ToString() + coTo.ToString();
            if(IDtemp.Length == 2)
            {
                IDtemp = WybranyRodzaj.ElementAt(0).ToString() + "0" + coTo.ToString();
            }


            Rower rower = new Rower()
            {
                IdRower = IDtemp
            };
            rower.ListaProducent = new List<Producent>();
            rower.ListaProducent.Add(new Producent() {Idref = WybranyProducent });

            rower.ListaNazwa = new List<string>();
            rower.ListaNazwa.Add(Nazwa);

            rower.ListaWaga = new List<Waga>();
            rower.ListaWaga.Add(new Waga() {Jednostka = WybranaJednostka, WagaWartosc = Waga });

            rower.ListaCena = new List<Cena>();
            rower.ListaCena.Add(new Cena() {Waluta = WybranaWaluta, CenaWartosc = Cena });

            rower.ListaRokZaprojektowania = new List<RokZaprojektowania>();
            rower.ListaRokZaprojektowania.Add(new RokZaprojektowania() { Rok = RokStworzenia });

            

            Dokument.ListaSklepowRowerowych.FirstOrDefault().ListaRodzaj.FirstOrDefault(x => x.NazwaRodzaj == WybranyRodzaj).ListaListaRowerow.FirstOrDefault().ListaRower.Add(rower);




            try
            {
                XmlReader.ZapiszDane(Dokument);
                RoweryM = new RoweryM(Dokument);
                ListaRowerowM = RoweryM.getListaRowerowM();
            } catch (Exception e)
            {
                MessageBox.Show("cos nie bangla");
            }
        }

        public void Usun()
        {
            MessageBoxResult messageBoxResult = MessageBox.Show("Usunac wybrany rower?",WybranyRowerM.Nazwa.ToString(), MessageBoxButton.YesNo);
            if(messageBoxResult == MessageBoxResult.Yes)
            {
                Dokument.ListaSklepowRowerowych.FirstOrDefault().ListaRodzaj.SingleOrDefault(x => x.IdRodzaj == WybranyRowerM.IdRodzaj).ListaListaRowerow.FirstOrDefault().ListaRower.RemoveAll(x => x.IdRower == WybranyRowerM.Id);
               // RoweryM.ListaRowerowM.Remove(WybranyRowerM);
                ListaRowerowM.Remove(WybranyRowerM);
                XmlReader.ZapiszDane(Dokument);
            }   
        }

        public void Zapisz()
        {
           // WybranaJednostkaEdycja = WybranyRowerM.Waga.Substring(WybranyRowerM.Waga.Length - 2);
          

            var coTo = Dokument.ListaSklepowRowerowych.FirstOrDefault().ListaRodzaj.FirstOrDefault(x => x.IdRodzaj == WybranyRodzajEdycja.ElementAt(0).ToString()).ListaListaRowerow.FirstOrDefault().ListaRower.Count + 1;

            var IDtemp = WybranyRodzajEdycja.ElementAt(0).ToString() + coTo.ToString();
            if (IDtemp.Length == 2)
            {
                IDtemp = WybranyRodzajEdycja.ElementAt(0).ToString() + "0" + coTo.ToString();
            }

            Dokument.ListaSklepowRowerowych.FirstOrDefault().ListaRodzaj.SingleOrDefault(x => x.IdRodzaj == WybranyRowerM.IdRodzaj).ListaListaRowerow.FirstOrDefault().ListaRower.RemoveAll(x => x.IdRower == WybranyRowerM.Id);

            Rower rower = new Rower()
            {
                IdRower = IDtemp
            };
            rower.ListaProducent = new List<Producent>();
            rower.ListaProducent.Add(new Producent() { Idref = WybranyProducentEdycja });

            rower.ListaNazwa = new List<string>();
            rower.ListaNazwa.Add(NazwaEdycja);

            var jednostka = WybranaJednostkaEdycja;
            var waluta = WybranaWalutaEdycja;
            rower.ListaWaga = new List<Waga>();
            rower.ListaWaga.Add(new Waga() { Jednostka = WybranaJednostkaEdycja, WagaWartosc = WagaEdycja });

           // WybranaWalutaEdycja = WybranyRowerM.Cena.Substring(WybranyRowerM.Cena.Length - 3);

            rower.ListaCena = new List<Cena>();
            rower.ListaCena.Add(new Cena() { Waluta = WybranaWalutaEdycja, CenaWartosc = CenaEdycja });

            rower.ListaRokZaprojektowania = new List<RokZaprojektowania>();
            rower.ListaRokZaprojektowania.Add(new RokZaprojektowania() { Rok = RokStworzeniaEdycja });

            Dokument.ListaSklepowRowerowych.FirstOrDefault().ListaRodzaj.FirstOrDefault(x => x.IdRodzaj == WybranyRodzajEdycja).ListaListaRowerow.FirstOrDefault().ListaRower.Add(rower);

            
                XmlReader.ZapiszDane(Dokument);
                RoweryM = new RoweryM(Dokument);
                ListaRowerowM = RoweryM.getListaRowerowM();
 
            

        }

        public void XSLtoPDF()
        {
            FileStream xml = new FileStream(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\testDokumentPomocniczy.xml", FileMode.Open);
           
            FileStream xsl = new FileStream(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\XSLtoPDF.xsl", FileMode.Open);
            FileStream pdf = new FileStream(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\PDF.pdf", FileMode.Create);
           
            var doc = new FODocument();
            doc.generate(xml, xsl, pdf);

            MessageBox.Show("Sukces!");
        }

        public void TransformXMLToHTML()
        {
         
            string inputXml = File.ReadAllText(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\testDokumentPomocniczy.xml");
            string xsltString = File.ReadAllText(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\xhtml.xsl");
            XslCompiledTransform transform = new XslCompiledTransform();
            using (XmlReader reader = System.Xml.XmlReader.Create(new StringReader(xsltString)))
            {
              
                transform.Load(reader);
            }
            StringWriter results = new StringWriter();
            using (XmlReader reader = System.Xml.XmlReader.Create(new StringReader(inputXml)))
            {
                transform.Transform(reader, null, results);
            }
            
            File.WriteAllText(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\strona.xhtml", results.ToString());
            MessageBox.Show("Sukces!");
        }

        public void TransformXMLToSVG()
        {

            string inputXml = File.ReadAllText(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\testDokumentPomocniczy.xml");
            string xsltString = File.ReadAllText(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\XSLtoSVG.xsl");
            XslCompiledTransform transform = new XslCompiledTransform();
            using (XmlReader reader = System.Xml.XmlReader.Create(new StringReader(xsltString)))
            {

                transform.Load(reader);
            }
            StringWriter results = new StringWriter();
            using (XmlReader reader = System.Xml.XmlReader.Create(new StringReader(inputXml)))
            {
                transform.Transform(reader, null, results);
            }

            File.WriteAllText(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\animacje.svg", results.ToString());
            MessageBox.Show("Sukces!");
        }

        public void TransformXMLToTXT()
        {

            string inputXml = File.ReadAllText(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\testDokumentPomocniczy.xml");
            string xsltString = File.ReadAllText(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\XSLtoTXT.xsl");
            XslCompiledTransform transform = new XslCompiledTransform();
            using (XmlReader reader = System.Xml.XmlReader.Create(new StringReader(xsltString)))
            {

                transform.Load(reader);
            }
            StringWriter results = new StringWriter();
            using (XmlReader reader = System.Xml.XmlReader.Create(new StringReader(inputXml)))
            {
                transform.Transform(reader, null, results);
            }

            File.WriteAllText(@"D:\Studia\PKCK\git\PKCK\Task 5\SklepRowerowyApp\SklepRowerowyApp\Dokumenty\Tekstowy.txt", results.ToString());
            MessageBox.Show("Sukces!");
        }

        public void StworzIdRowera(string typ)
        {
            var coTo = Dokument.ListaSklepowRowerowych.FirstOrDefault().ListaRodzaj.FirstOrDefault(x => x.IdRodzaj == WybranyRodzaj.ElementAt(0).ToString()).ListaListaRowerow.FirstOrDefault().ListaRower.Count - 1;

            string id = typ.ElementAt(0).ToString();
        }
    }
}
