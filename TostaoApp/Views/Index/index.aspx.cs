using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TransacaoData;
using Enumeration;
using TostaoApp.Data;

namespace TostaoApp.Views
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            atzValoresTransacao();
            carregaListaTransacao();
        }

        public void lnkSalvar_Click(object sender, EventArgs e){
            var valorTransacao = Decimal.Parse(txtValorTransacao.Text, CultureInfo.InvariantCulture);
            int categoriaTransacao = 0;
            int tipoTransacao = 0;

            if (hdnTransacaoTipo.Value == "receita") {
                tipoTransacao = (int)Enumeration.TransacaoTipo.Receita;

                switch (ddlReceita.SelectedValue)
                {
                    case "r": categoriaTransacao = (int)Enumeration.TransacaoCategoria.Receita; break;
                }
            }
            else {
                tipoTransacao = (int)Enumeration.TransacaoTipo.Gasto;

                switch (ddlGasto.SelectedValue)
                {
                    case "c": categoriaTransacao = (int)Enumeration.TransacaoCategoria.Casa; break;
                    case "e": categoriaTransacao = (int)Enumeration.TransacaoCategoria.Educacao; break;
                    case "l": categoriaTransacao = (int)Enumeration.TransacaoCategoria.Lazer; break;
                    case "s": categoriaTransacao = (int)Enumeration.TransacaoCategoria.Saude; break;
                    case "t": categoriaTransacao = (int)Enumeration.TransacaoCategoria.Transporte; break;
                }
            }



            Program.AdicionarTransacao(valorTransacao, tipoTransacao, categoriaTransacao);
            atzValoresTransacao();
            carregaListaTransacao();

            txtValorTransacao.Text = "";

            uppValorTransacao.Update();

            ScriptManager.RegisterStartupScript(this.Page, GetType(), "hwa", "limpaSelectTipo();", true);
        }

        public void atzValoresTransacao()
        {
             using (var context = new TostaoDataContext())
            {
                var totalReceita = context.Transacaos.Where((x) => x.Tipo == (int)Enumeration.TransacaoTipo.Receita).Sum((x)=>x.Valor);
                var totalGasto = context.Transacaos.Where((x) => x.Tipo == (int)Enumeration.TransacaoTipo.Gasto).Sum((x) => x.Valor);

                var totalGeral = totalReceita - totalGasto;

                totalGeral = Math.Round(totalGeral, 2);
                totalReceita = Math.Round(totalReceita, 2);
                totalGasto = Math.Round(totalGasto, 2);

                txtValorTotal.Text = totalGeral.ToString();
                txtValorReceita.Text = totalReceita.ToString();
                txtValorGasto.Text = totalGasto.ToString();

                //Update boxes com informações das transações
                uppValorTotal.Update();
                uppValorReceita.Update();
                uppValorGasto.Update();
            }
        }

        public void carregaListaTransacao()
        {
            using (var context = new TostaoDataContext())
            {
                var lstTransacoes = context.Transacaos.ToList();

                lsvTrasacao.DataSource = lstTransacoes;
                lsvTrasacao.DataBind();

                uppLsvTransacao.Update();
            }
        }

        public void lnkExcluirTransacao_Click(object sender, EventArgs e)
        {
            using (var context = new TostaoDataContext())
            {
                LinkButton lnkTransacaoExcluir = sender as LinkButton;

                var transacaoID = int.Parse(lnkTransacaoExcluir.CommandArgument);
                var transacaoExcluir = context.Transacaos.Where((x) => x.Id == transacaoID).FirstOrDefault();

                context.Remove(transacaoExcluir);
                context.SaveChanges();
                atzValoresTransacao();
                carregaListaTransacao();
            }
        }
    }
}