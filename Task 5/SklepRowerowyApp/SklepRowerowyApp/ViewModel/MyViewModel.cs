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

            WczytajDane = new DelegateCommand(Wczytaj);
        }

        public ICommand WczytajDane { get; }
        private RowerM wybranyRowerM;
        private ObservableCollection<RowerM> _listaRowerowM;
        private List<string> _listaProducentow, _listaJednostek, _listaWalut, _listaRodzajow;
        private string _wybranyProducent, _wybranaJednostka, _wybranaWaluta, _wybranyRodzaj, _id, _nazwa, _waga, _cena, _rokStworzenia;

        public RowerM WybranyRowerM
        {
            get { return wybranyRowerM; }
            set { this.wybranyRowerM = value; }
        }
        public RoweryM RoweryM { get; set; }
        public ObservableCollection<RowerM> ListaRowerowM
        {
            get { return _listaRowerowM; }
            set { this._listaRowerowM = value;
                RaisePropertyChanged("ListaRowerowM");
            }
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

        
        public event PropertyChangedEventHandler PropertyChanged;
        private void RaisePropertyChanged(string propertyName_)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName_));
        }

        public void StworzListaProducentow()
        {
            ListaProducentow = new List<string>()
            {
                "Kross",
                "Specialized",
                "Legrand",
                "Trek"
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
    }
}
