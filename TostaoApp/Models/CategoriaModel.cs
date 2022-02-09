using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TostaoApp.Models
{
    [Table("Categoria")]
    public class CategoriaModel
    {
            [Key]
            public int Categoria_id { get; set; }
            public string Categoria_nome { get; set; }
            public int Tipo { get; set; }

    }
}
