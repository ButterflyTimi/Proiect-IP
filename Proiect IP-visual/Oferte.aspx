<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Oferte.aspx.cs" Inherits="Oferte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
    <div class="filtre-wrapper">
    <asp:Panel ID="Panel1" CssClass="filtrarePanel" runat="server">
        <h4>Filtreaza in functie de:</h4>
        <div class="filtre">
            <h5>Numarul de stele al hotelului</h5>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="true" EnableViewState="true" 
                onselectedindexchanged="CheckBoxList1_SelectedIndexChanged">
                <asp:ListItem Value="1">O stea</asp:ListItem>
                <asp:ListItem Value="2">Doua stele</asp:ListItem>
                <asp:ListItem Value="3">Trei stele</asp:ListItem>
                <asp:ListItem Value="4">Patru stele</asp:ListItem>
                <asp:ListItem Value="5">Cinci stele</asp:ListItem>

            </asp:CheckBoxList>
        </div>
        <div  class="filtre">
            <h5>Conditiile hotelului</h5>
            <asp:CheckBoxList ID="CheckBoxList2" runat="server" AutoPostBack="true" EnableViewState="true" 
                onselectedindexchanged="CheckBoxList2_SelectedIndexChanged">
                <asp:ListItem Value="restaurant">Restaurant</asp:ListItem>
                <asp:ListItem Value="bar">Bar</asp:ListItem>
                <asp:ListItem Value="piscina">Piscina</asp:ListItem>
                <asp:ListItem Value="loc_joaca">Loc de joaca pentru copii</asp:ListItem>
                <asp:ListItem Value="wifi">Internet wireless</asp:ListItem>
                <asp:ListItem Value="minibar">Minibar camera</asp:ListItem>
                <asp:ListItem Value="televizor">Televizor camera</asp:ListItem>
                <asp:ListItem Value="telefon">Telefon camera</asp:ListItem>
                <asp:ListItem Value="transport">Trasnport aeroport-hotel</asp:ListItem>
                <asp:ListItem Value="ingrijire_medicala">Facilitati ingrijire medicala</asp:ListItem>

            </asp:CheckBoxList>
        </div>

    </asp:Panel>

     <asp:Button ID="AnulareFiltre" CssClass="btn primary-button" runat="server" 
            Text="Anulare filtre" onclick="AnulareFiltre_Click"/>
    
    </div>

    <div class="oferte-wrapper">
    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1"
        RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
        <ItemTemplate>
        <div class="row">
            <div class="col-sm-12 imagine_titlu">
                <div class="imagine" style="background: url('<%# "pozeSejururi/" + Eval("imagine") %>')"></div>
                <h4>
                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Detalii_oferta.aspx?q=" + Eval("id_sejur") %>'>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("nume") %>' />
                    </asp:HyperLink>
                </h4>
            </div>
        </div>
        </ItemTemplate>
    </asp:DataList>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
        
    SelectCommand="SELECT Sejur.id_sejur, Sejur.nume, Sejur.pret, Sejur.id_hotel, Sejur.imagine, Hotel.id_hotel AS idHotel, Hotel.nume AS HotelNume, Hotel.stele, Sejur.id_tipoferta, TipOferta.denumire, Sejur.descriere FROM Sejur INNER JOIN Hotel ON Sejur.id_hotel = Hotel.id_hotel INNER JOIN TipOferta ON Sejur.id_tipoferta = TipOferta.id_tipoferta where 1=1"></asp:SqlDataSource>
</div>
    
    </div>
</asp:Content>

