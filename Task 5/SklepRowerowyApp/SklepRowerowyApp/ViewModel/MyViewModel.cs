using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Input;

namespace SklepRowerowyApp.ViewModel
{
    public class MyViewModel : INotifyPropertyChanged
    {

        public MyViewModel()
        {
            StworzListaProducentow();
            StworzListaJednostek();
            StworzListaWalut();
        }

        private List<string> _listaProducentow, _listaJednostek, _listaWalut;
        private string _wybranyProducent, _wybranaJednostka, _wybranaWaluta;
        public List<string> ListaProducentow
        {
            get { return _listaProducentow;}
            set { this._listaProducentow = value;
                RaisePropertyChanged("ListaProducentow");}
        }
        public string WybranyProducent
        {
            get { return _wybranyProducent; }
            set { this._wybranyProducent = value; }
        }

        public List<string> ListaJednostek
        {
            get { return _listaJednostek; }
            set { this._listaJednostek = value;
                RaisePropertyChanged("ListaJednostek"); }
        }

        public string WybranaJednostka
        {
            get { return _wybranaJednostka; }
            set { this._wybranaJednostka = value; }
        }

        public List<string> ListaWalut
        {
            get { return _listaWalut; }
            set { this._listaWalut = value;
                RaisePropertyChanged("ListaWalut");
            }
        }

        public string WybranaWaluta
        {
            get { return _wybranaWaluta; }
            set { this._wybranaWaluta = value; }
        }

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
    }
}
