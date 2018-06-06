using SklepRowerowyApp.XMLModel;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SklepRowerowyApp.Model
{
    public class RoweryM
    {
        public ObservableCollection<RowerM> ListaRowerowM{ get; set; }

        public ObservableCollection<RowerM> getListaRowerowM() { return ListaRowerowM; }
        public RoweryM(Dokument dokument)
        {
            ListaRowerowM = new ObservableCollection<RowerM>();
            foreach( SklepRowerowy sklepRowerowy in dokument.ListaSklepowRowerowych)
            {
                foreach( Rodzaj rodzaj in sklepRowerowy.ListaRodzaj)
                {
                    foreach(ListaRowerow listaRowerow in rodzaj.ListaListaRowerow)
                    {
                        foreach(Rower rower in listaRowerow.ListaRower)
                        {
                            ListaRowerowM.Add(new RowerM()
                            {
                                Id = rower.IdRower,
                                IdRodzaj = rodzaj.IdRodzaj,
                                Producent = rower.ListaProducent.FirstOrDefault().Idref,
                                Nazwa = rower.ListaNazwa.FirstOrDefault(),
                                Waga = rower.ListaWaga.FirstOrDefault().WagaWartosc + " " + rower.ListaWaga.FirstOrDefault().Jednostka,
                                Cena = rower.ListaCena.FirstOrDefault().CenaWartosc + " " + rower.ListaCena.FirstOrDefault().Waluta,
                                RokZaprojektowania = rower.ListaRokZaprojektowania.FirstOrDefault().Rok
                            });
                        }
                    }

                }

            }
        }
    }
}
