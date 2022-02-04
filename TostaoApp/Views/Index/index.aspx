<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="TostaoApp.Views.index" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Dashboard | Tostão</title>
        <link href="./index.css" rel="stylesheet" />
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
                                <asp:TextBox ID="txtValorTransacao" CssClass="txtValorTransacao" runat="server" TextMode="number"/>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    
                    <div class="select-campo">
                        <label for="ddlCategoria">Categoria*</label>
                        <asp:UpdatePanel runat="server" ID="uppDdlSelect" updateMode="Conditional">
                            <ContentTemplate>
                                <div class="select-receita">
                                    <asp:DropDownList ID="ddlReceita" CssClass="ddlReceita" runat="server" >
                                        <asp:ListItem Text="" Value=""/>
                                        <asp:ListItem Text="Receita" Value="r"/>
                                    </asp:DropDownList>
                                </div>
    
                                <div class="select-gasto">
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
}

//ABRIR MODAL TRANSAÇÃO

const modalHeaderText = document.getElementById('modal-header-text')

const lnkNovaReceita = document.querySelector('.lnkNovaReceita')
const lnkNovoGasto = document.querySelector('.lnkNovoGasto')

const divSelectReceita = document.querySelector('.select-receita')
const divSelectGasto = document.querySelector('.select-gasto')
const hdnTransacaoTipo = document.getElementById("<%= hdnTransacaoTipo.ClientID %>")

lnkNovaReceita.addEventListener('click', () => {
    modalTransacao.style.display = "block"
    divSelectReceita.style.display = "block"
    divSelectGasto.style.display = "none"
    modalHeaderText.textContent = "Adicionar Transação - Receita"
    hdnTransacaoTipo.value = "receita"

})

lnkNovoGasto.addEventListener('click', () => {
    modalTransacao.style.display = "block"
    divSelectReceita.style.display = "none"
    divSelectGasto.style.display = "block"
    modalHeaderText.textContent = "Adicionar Transação - Gasto"
    hdnTransacaoTipo.value = "gasto"
})

//BOTAO SALVAR
    const btnSalvar = document.querySelector('.modal-footer .btnSalvar')

    const lnkSalvar = document.getElementById("<%= lnkSalvar.ClientID %>") //botao do cs
    const txtValorTransacao = document.querySelector('.valor-campo .txtValorTransacao')
    const ddlReceita = document.querySelector('.select-campo #ddlReceita')
    const ddlGasto = document.querySelector('.select-campo #ddlGasto')


    btnSalvar.addEventListener('click', () => {
        if (txtValorTransacao.value != 0 && txtValorTransacao.value != "") {
            if ((hdnTransacaoTipo.value == "receita" && ddlReceita.value != "") || (hdnTransacaoTipo.value == "gasto" && ddlGasto.value != "")) {
                lnkSalvar.click()
                ddlReceita.selectedIndex = 0
                ddlGasto.selectedIndex = 0
                alert("Transação cadastrada com sucesso")
                return false
            } else {
                alert("Preencha os campos corretamente")
                return false
            }
        } else {
            alert("Preencha os campos corretamente")
            return false
        }
    })

//BOTAO FECHAR MODAL TRANSACAO
    const lnkFechar = document.querySelector('.modal-background #fecharModal')

    lnkFechar.addEventListener('click', () => {
        txtValorTransacao.value = ""
        ddlReceita.selectedIndex = 0
        ddlGasto.selectedIndex = 0
        hdnTransacaoTipo.value = ""
    })


</script>

    </body>
</html>