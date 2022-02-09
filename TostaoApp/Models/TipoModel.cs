using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TostaoApp.Models
{
    [Table("Transacao_tipo")]
    public class TipoModel
    {
        [Key]
        public int Tipo_id { get; set; }
        public string Tipo_nome { get; set; }
    }
}