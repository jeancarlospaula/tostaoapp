<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TostaoApp.Views.index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Dashboard | Tostão</title>
        <link href="./index.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="favicon.ico">    
    </head>

    <body>
    <form runat="server">
    <asp:ScriptManager ID="scpManager" runat="server"></asp:ScriptManager>
        <header>
            <container class="header-info">
                <div class="header-logo">
                    <h3>TO$TÃO</h3>
                </div>
            </container>
            <div class="header-button">
                <a href="#">Mobile</a>
                <a href="#">Sair</a>
            </div>
        </header>

        <main>
            <article id="arcOne">
                <section id="secMensagemNome">
                    <p>Menasgem</p>
                </section>
            </article>

            <article id="arcTwo">
                <section id="secValorReport">
                    <div class="valoresTotal">
                        <div class="info-valores">
                    <div class="total-value">
                        <div class="total-info">
                            <span>Total</span>
                            <div class="total-input">
                                <h3>R$</h3>
                                <asp:UpdatePanel ID="uppValorTotal" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtValorTotal" runat="server" disabled="true" Text="0,00" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
    
                    <div class="receitas-value">
                        <h1>▲</h1>
                        <div>
                            <span>Receita</span>
                            <div class="receita-input">
                                <h3>R$</h3>
                                <asp:UpdatePanel ID="uppValorReceita" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtValorReceita" runat="server" disabled="true" Text="0,00" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <a class="lnkNovaReceita">+</a>
                    </div>
    
                    <div class="gastos-value">
                        <h1>▼</h1>
                        <div>
                            <span>Gastos</span>
                            <div class="gasto-input">
                                <h3>R$</h3>
                                <asp:UpdatePanel ID="uppValorGasto" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtValorGasto" runat="server" disabled="true" Text="0,00" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                        <a class="lnkNovoGasto">+</a>
                    </div>
                </div>
                    </div>
                    <div class="reportFilter">
                        <p>Relatório</p>
                    </div>
                </section>

                <section id ="secListTransacao">
                    <div class="divListTransacao">
                    <asp:UpdatePanel runat="server" ID="uppLsvTransacao" UpdateMode="Conditional">
                        <ContentTemplate>
                                <asp:ListView runat="server" ID="lsvTrasacao" GroupPlaceholderID="groupPlaceholder" ItemPlaceholderID="itemPlaceholder">
                                    <LayoutTemplate>
                                        <table class="lstTable">
                                            <tr class="lstHeader">
                                                <th class="firstRow">Tipo</th>
                                                <th>Valor</th>
                                                <th>Categoria</th>
                                                <th>Data - hora</th>
                                                <th class="secondRow">Ações</th>
                                            </tr>
                                            <tr id="groupPlaceholder" runat="server"></tr>
                                        </table>
                                    </LayoutTemplate>
                                    <GroupTemplate>
                                        <tr>
                                            <tr id="itemPlaceholder" runat="server"></tr>
                                        </tr>
                                    </GroupTemplate>
                                    <ItemTemplate>
                                        <td class="firstRow td-receita"><%# (int)Eval("Tipo") == 1 ? "Receita" : "Gasto" %></td>
                                        <td class="td-valor"><%# Eval("Valor") %></td>
                                        <td><%# Eval("Categoria") %></td>
                                        <td ><%# Eval("Data_transacao") %></td>
                                        <td class="secondRow">
                                            <asp:UpdatePanel runat="server">
                                                <ContentTemplate>
                                                    <asp:LinkButton CommandArgument='<%# Eval("Id") %>' CommandName="lnkTransacaoExcluir" runat="server" ID="lnkTransacaoExcluir" OnClick="lnkExcluirTransacao_Click">
                                                            <i><img src="trash-icon.svg" alt="trash-icon" class="trash-icon"/></i>
                                                    </asp:LinkButton>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </td>
                                    </ItemTemplate>
                                </asp:ListView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                </section>

                <section id="secGraficos">
                    <div class="chartOne">
                        <p>Gráfico 1</p>
                    </div>
                    <div class="chartTwo">
                        <p>Gráfico 2</p>
                    </div>
                </section>
            </article>
        </main>

        <div class="modal-background">
            <div class="modal-transacao">
                <div class="modal-header">
                    <h3 id="modal-header-text">Adicionar Transação - Gastos</h3>
                    <a id="fecharModal">X</a>
                </div>
                <div class="modal-body">
                    <div class="valor-campo">
                        <label for="txtTransacao">Valor*</label>
                        <asp:UpdatePanel ID="uppValorTransacao" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:TextBox ID="txtValorTransacao" CssClass="txtValorTransacao" runat="server" TextMode="number" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    
                    <div class="select-campo">

                        <label for="ddlCategoria">Categoria*</label>

                        <asp:UpdatePanel runat="server" ID="uppSelectReceita" updateMode="Conditional" ChildrenAsTriggers="false">
                            <ContentTemplate>

                                    <div class="select-receita" id="selectReceita">
                                        <asp:DropDownList ID="ddlReceita" CssClass="ddlReceita" runat="server" >
                                            <asp:ListItem Text="" Value=""/>
                                            <asp:ListItem Text="Receita" Value="r"/>
                                        </asp:DropDownList>
                                    </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>

                        <asp:UpdatePanel runat="server" ID="uppSelectGasto" updateMode="Conditional" ChildrenAsTriggers="false">
                            <ContentTemplate>

                                    <div class="select-gasto" id="selectGasto">
                                        <asp:DropDownList ID="ddlGasto" CssClass="ddlGasto" runat="server">
                                            <asp:ListItem Text="" Value=""/>
                                            <asp:ListItem Text="Casa" Value="c"/>
                                            <asp:ListItem Text="Educação" Value="e"/>
                                            <asp:ListItem Text="Lazer" Value="l"/>
                                            <asp:ListItem Text="Saúde" Value="s"/>
                                            <asp:ListItem Text="Transporte" Value="t"/>
                                        </asp:DropDownList>
                                    </div>

                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                </div>
                <div class="modal-footer">
                    <a class="btnSalvar">Salvar</a>
                    <div style="display: none">
                        <asp:UpdatePanel runat="server" ID="uppLnkSalvar">
                            <ContentTemplate>
                                <asp:LinkButton Text="Salvar" runat="server" ID="lnkSalvar" OnClick="lnkSalvar_Click"/>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
        <div style="display: none">
            <asp:HiddenField Value="" ID="hdnTransacaoTipo" runat="server"/>
        </div>
    </form>

<script>
//FECHAR MODAL TRANSAÇÃO

const lnkFecharModal = document.querySelector('.modal-header #fecharModal')
const modalTransacao = document.querySelector('.modal-background')

lnkFecharModal.addEventListener('click', fecharModal)

function fecharModal(){
    modalTransacao.style.display = "none"
    txtValorTransacao.value = ""
    limpaSelectTipo()
    hdnTransacaoTipo.value = ""
}

//ABRIR MODAL TRANSAÇÃO

const modalHeaderText = document.getElementById('modal-header-text')

const lnkNovaReceita = document.querySelector('.lnkNovaReceita')
const lnkNovoGasto = document.querySelector('.lnkNovoGasto')

const hdnTransacaoTipo = document.getElementById("<%= hdnTransacaoTipo.ClientID %>")

    const divSelectReceita = document.querySelector('.modal-body .select-campo #selectReceita')
    const divSelectGasto   = document.querySelector('.modal-body .select-campo #selectGasto')

    lnkNovaReceita.addEventListener('click', adicionarNovaReceita)
    lnkNovoGasto.addEventListener('click', adicionarNovoGasto)

    function adicionarNovaReceita() {
        modalTransacao.style.display = "block"

        divSelectReceita.style.display = "block"
        divSelectGasto.style.display = "none"

        hdnTransacaoTipo.value = "receita"

        modalHeaderText.textContent = "Adicionar Transação - Receita"
    }

    function adicionarNovoGasto() {
        modalTransacao.style.display = "block"

        divSelectReceita.style.display = "none"
        divSelectGasto.style.display = "block"

        hdnTransacaoTipo.value = "gasto"

        modalHeaderText.textContent = "Adicionar Transação - Gasto"
    }

//BOTAO SALVAR
    const btnSalvar = document.querySelector('.modal-footer .btnSalvar')

    const lnkSalvar = document.getElementById("<%= lnkSalvar.ClientID %>") //botao do cs


    btnSalvar.addEventListener('click', () => {
        const txtValorTransacao = document.querySelector('.valor-campo .txtValorTransacao')
        const ddlReceita = document.querySelector('.select-campo #ddlReceita')
        const ddlGasto = document.querySelector('.select-campo #ddlGasto')

        if ((txtValorTransacao.value != 0 && txtValorTransacao.value != "") && ((hdnTransacaoTipo.value == "receita" && ddlReceita.value != "") || (hdnTransacaoTipo.value == "gasto" && ddlGasto.value != ""))) {
                lnkSalvar.click()
                alert("Transação cadastrada com sucesso")
                return false
        } else {
            alert("Preencha os campos corretamente")
            return false
        }
    })

//LIMPA SELECTS AO SALVAR (chamado pelo C#)
    function limpaSelectTipo(){
        ddlReceita.selectedIndex = 0
        ddlGasto.selectedIndex = 0
    }
</script>

    </body>
</html>