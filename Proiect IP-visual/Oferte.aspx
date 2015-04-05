<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Oferte.aspx.cs" Inherits="Oferte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h4>Filtreaza in functie de numarul de stele al hotelului</h4>
    <asp:Panel ID="Panel1" CssClass="filtrarePanel" runat="server">
        
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="true" EnableViewState="true" 
            onselectedindexchanged="CheckBoxList1_SelectedIndexChanged">
            <asp:ListItem Value="1">O stea</asp:ListItem>
            <asp:ListItem Value="2">Doua stele</asp:ListItem>
            <asp:ListItem Value="3">Trei stele</asp:ListItem>
            <asp:ListItem Value="4">Patru stele</asp:ListItem>
            <asp:ListItem Value="5">Cinci stele</asp:ListItem>

        </asp:CheckBoxList>

    </asp:Panel>

     <asp:Button ID="AnulareFiltre" CssClass="btn primary-button" runat="server" 
            Text="Anulare filtre" onclick="AnulareFiltre_Click"/>
    
    <div class="oferte-wrapper">
    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1"
        RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
        <ItemTemplate>
        <div class="row">
            <div class="col-sm-12 imagine_titlu">
                <div class="imagine" style="background: url('<%# "pozeSejururi/" + Eval("imagine") %>')"></div>
                <h4>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("nume") %>' />
                </h4>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn primary-button" NavigateUrl='<%# "~/Detalii_oferta.aspx?q=" + Eval("id_sejur") %>' Text="Vezi Oferta">
                </asp:HyperLink>
            </div>
        </div>
        </ItemTemplate>
    </asp:DataList>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
        
    SelectCommand="SELECT Sejur.id_sejur, Sejur.nume, Sejur.pret, Sejur.id_hotel, Sejur.imagine, Hotel.id_hotel AS idHotel, Hotel.nume AS HotelNume, Hotel.stele, Sejur.id_tipoferta, TipOferta.denumire, Sejur.descriere FROM Sejur INNER JOIN Hotel ON Sejur.id_hotel = Hotel.id_hotel INNER JOIN TipOferta ON Sejur.id_tipoferta = TipOferta.id_tipoferta where 1=1"></asp:SqlDataSource>
</div>
</asp:Content>

