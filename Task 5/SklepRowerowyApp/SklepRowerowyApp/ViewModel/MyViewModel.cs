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
        }

        public ICommand WczytajDane { get; }
        public ICommand DodajDane { get; }
        public ICommand UsunDane { get; }
        public ICommand ZapiszDane { get; }
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
            get { return wybranaJednostkaEdycja; }
            set { this.wybranaJednostkaEdycja = value;
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
                MessageBox.Show("Done");
            }
            ListaRowerowM = RoweryM.getListaRowerowM();
        }

        public void Dodaj()
        {
            Rower rower = new Rower()
            {
                IdRower = ID
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

            Dokument.ListaSklepowRowerowych.FirstOrDefault().ListaRodzaj.SingleOrDefault(x => x.IdRodzaj == WybranyRowerM.IdRodzaj).ListaListaRowerow.FirstOrDefault().ListaRower.RemoveAll(x => x.IdRower == WybranyRowerM.Id);

            Rower rower = new Rower()
            {
                IdRower = IDEdycja
            };
            rower.ListaProducent = new List<Producent>();
            rower.ListaProducent.Add(new Producent() { Idref = WybranyProducentEdycja });

            rower.ListaNazwa = new List<string>();
            rower.ListaNazwa.Add(NazwaEdycja);

            rower.ListaWaga = new List<Waga>();
            rower.ListaWaga.Add(new Waga() { Jednostka = WybranaJednostkaEdycja, WagaWartosc = WagaEdycja });

            rower.ListaCena = new List<Cena>();
            rower.ListaCena.Add(new Cena() { Waluta = WybranaWalutaEdycja, CenaWartosc = CenaEdycja });

            rower.ListaRokZaprojektowania = new List<RokZaprojektowania>();
            rower.ListaRokZaprojektowania.Add(new RokZaprojektowania() { Rok = RokStworzeniaEdycja });

            Dokument.ListaSklepowRowerowych.FirstOrDefault().ListaRodzaj.FirstOrDefault(x => x.IdRodzaj == WybranyRodzajEdycja).ListaListaRowerow.FirstOrDefault().ListaRower.Add(rower);

            try
            {
                XmlReader.ZapiszDane(Dokument);
                RoweryM = new RoweryM(Dokument);
                ListaRowerowM = RoweryM.getListaRowerowM();
            }
            catch (Exception e)
            {
                MessageBox.Show("cos nie bangla");
            }

        }

        public void StworzIdRowera(string typ)
        {
            string id = typ.ElementAt(0).ToString();
        }
    }
}
