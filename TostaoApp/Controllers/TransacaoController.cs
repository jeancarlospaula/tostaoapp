using System;
using TostaoApp.Data;
using TostaoApp.Models;
using System.Linq;

namespace TransacaoData
{
    public class TransacaoController
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

        public static void ExcluirTransacao(int transacaoID)
        {
            using (var context = new TostaoDataContext())
            {
                var transacaoExcluir = context.Transacaos.Where((x) => x.Id == transacaoID).FirstOrDefault();

                context.Remove(transacaoExcluir);
                context.SaveChanges();
            }
        }
    }
}

