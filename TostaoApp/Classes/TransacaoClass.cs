using System;
using TostaoApp.Data;
using TostaoApp.Models;

namespace TransacaoData
{
    public class Program
    {
        public static void AdicionarTransacao(decimal valor, int tipo, int categoria)
        {
            using (var context = new TostaoDataContext())
            {
                var transacao = new TransacaoModel();

                transacao.Tipo = tipo;
                transacao.Categoria = categoria;
                transacao.Valor = valor;
                transacao.Data_transacao = DateTime.Now;

                context.Add(transacao);
                context.SaveChanges();
            }
        }
    }
}