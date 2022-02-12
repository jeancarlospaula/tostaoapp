using System;
using TostaoApp.Data;
using TostaoApp.Models;
using System.Linq;
using TostaoApp.Views;
using System.Collections.Generic;

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

        public List<decimal> carregaValoresReceitaGasto()
        {
            using (var context = new TostaoDataContext())
            {
                var lstTransacoes = context.Transacaos.ToList();

                var valorReceita = lstTransacoes.Where((p) => p.Tipo == (int)Enumeration.TransacaoTipo.Receita).Sum((p) => p.Valor);
                var valorGasto = lstTransacoes.Where((p) => p.Tipo == (int)Enumeration.TransacaoTipo.Gasto).Sum((p) => p.Valor);

                List<decimal> lstValoresTipo = new List<decimal>();

                lstValoresTipo.Add(Math.Round(valorReceita,2));
                lstValoresTipo.Add(Math.Round(valorGasto, 2));

                return lstValoresTipo;
            }
        }

        public List<decimal> carregaValoresCategorias()
        {
            using (var context = new TostaoDataContext())
            {
                var lstTransacoes = context.Transacaos.ToList();

                var valorReceita = lstTransacoes.Where((p) => p.Categoria == (int)Enumeration.TransacaoCategoria.Receita).Sum((p) => p.Valor);
                var valorCasa = lstTransacoes.Where((p) => p.Categoria == (int)Enumeration.TransacaoCategoria.Casa).Sum((p) => p.Valor);
                var valorEducacao = lstTransacoes.Where((p) => p.Categoria == (int)Enumeration.TransacaoCategoria.Educacao).Sum((p) => p.Valor);
                var valorLazer = lstTransacoes.Where((p) => p.Categoria == (int)Enumeration.TransacaoCategoria.Lazer).Sum((p) => p.Valor);
                var valorSaude = lstTransacoes.Where((p) => p.Categoria == (int)Enumeration.TransacaoCategoria.Saude).Sum((p) => p.Valor);
                var valorTransporte = lstTransacoes.Where((p) => p.Categoria == (int)Enumeration.TransacaoCategoria.Transporte).Sum((p) => p.Valor);


                List<decimal> lstValoresCategoria = new List<decimal>();

                lstValoresCategoria.Add(Math.Round(valorReceita, 2));
                lstValoresCategoria.Add(Math.Round(valorCasa, 2));
                lstValoresCategoria.Add(Math.Round(valorEducacao, 2));
                lstValoresCategoria.Add(Math.Round(valorLazer, 2));
                lstValoresCategoria.Add(Math.Round(valorSaude, 2));
                lstValoresCategoria.Add(Math.Round(valorTransporte, 2));

                return lstValoresCategoria;
            }
        }
    }
}

