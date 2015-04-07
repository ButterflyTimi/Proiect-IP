<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ModHotels.aspx.cs" Inherits="ModHotels" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Button ID="Button1" runat="server" Text="Adauga Hotel" 
        onclick="Button1_Click" />
    <asp:Button ID="Button2" runat="server" Text="Adauga Lant Hotelier" />
<br />
<br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="id_hotel" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="id_hotel" 
                DataNavigateUrlFormatString="~/ModHotelC.aspx?IdHotel={0}" Text="Edit hotel" />
            <asp:BoundField DataField="nume" HeaderText="nume" SortExpression="nume" />
            <asp:BoundField DataField="id_hotel" HeaderText="id_hotel" 
                InsertVisible="False" ReadOnly="True" SortExpression="id_hotel" />
            <asp:BoundField DataField="stele" HeaderText="stele" SortExpression="stele" />
            <asp:BoundField DataField="denumire" HeaderText="denumire" 
                SortExpression="denumire" />
            <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
            <asp:BoundField DataField="tara" HeaderText="tara" SortExpression="tara" />
            <asp:BoundField DataField="judet" HeaderText="judet" SortExpression="judet" />
            <asp:BoundField DataField="strada" HeaderText="strada" 
                SortExpression="strada" />
            <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" />
            <asp:BoundField DataField="restaurant" HeaderText="restaurant" 
                SortExpression="restaurant" />
            <asp:BoundField DataField="bar" HeaderText="bar" SortExpression="bar" />
            <asp:BoundField DataField="piscina" HeaderText="piscina" 
                SortExpression="piscina" />
            <asp:BoundField DataField="loc_joaca" HeaderText="loc_joaca" 
                SortExpression="loc_joaca" />
            <asp:BoundField DataField="wifi" HeaderText="wifi" SortExpression="wifi" />
            <asp:BoundField DataField="minibar" HeaderText="minibar" 
                SortExpression="minibar" />
            <asp:BoundField DataField="televizor" HeaderText="televizor" 
                SortExpression="televizor" />
            <asp:BoundField DataField="telefon" HeaderText="telefon" 
                SortExpression="telefon" />
            <asp:BoundField DataField="transport" HeaderText="transport" 
                SortExpression="transport" />
            <asp:BoundField DataField="ingrijire_medicala" HeaderText="ingrijire_medicala" 
                SortExpression="ingrijire_medicala" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
        SelectCommand="SELECT Hotel.nume, Hotel.id_hotel, Hotel.stele, LantHotelier.denumire, Locatie.denumire AS Expr1, Locatie.tara, Locatie.judet, Locatie.strada, Facilitati.id_hotel AS Expr2, Facilitati.restaurant, Facilitati.bar, Facilitati.piscina, Facilitati.loc_joaca, Facilitati.wifi, Facilitati.minibar, Facilitati.televizor, Facilitati.telefon, Facilitati.transport, Facilitati.ingrijire_medicala FROM Hotel INNER JOIN LantHotelier ON Hotel.id_lant = LantHotelier.id_lant INNER JOIN Facilitati ON Hotel.id_hotel = Facilitati.id_hotel INNER JOIN Locatie ON Hotel.id_locatie = Locatie.id_locatie">
    </asp:SqlDataSource>
</asp:Content>

