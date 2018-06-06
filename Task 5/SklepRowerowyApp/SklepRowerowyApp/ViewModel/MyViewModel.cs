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
            ListaProducentow = new List<string>()
            {

                "Kross",
                "Specialized",
                "Legrand",
                "Trek"
            };
        }

        private List<string> _listaProducentow;
        private string _wybranyProducent;
        public List<string> ListaProducentow
        {
            get {
                return _listaProducentow;
            }
            set { this._listaProducentow = value;
                RaisePropertyChanged("ListaProducentow");
            }
        }

        public string WybranyProducent
        {
            get { return _wybranyProducent; }
            set { this._wybranyProducent = value; }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        private void RaisePropertyChanged(string propertyName_)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName_));
        }
    }
}
