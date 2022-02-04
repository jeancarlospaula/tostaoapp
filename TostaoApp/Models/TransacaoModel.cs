using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace TostaoApp.Models
{
    [Table("Transacao")]
    public class TransacaoModel
    {
        [Key]
        public int Id { get; set; }
        public int Tipo { get; set; }
        public int Categoria { get; set; }
        public decimal Valor { get; set; }
        public DateTime Data_transacao { get; set; }
    }
}