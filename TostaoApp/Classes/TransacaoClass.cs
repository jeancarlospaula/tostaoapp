using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TostaoApp.Classes
{
    public class TransacaoItem
    {
            public int Id { get; set; }
            public string Tipo { get; set; }
            public string Categoria { get; set; }
            public decimal Valor { get; set; }
            public DateTime Data_transacao { get; set; }

    }
}
