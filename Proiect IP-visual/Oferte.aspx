<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Oferte.aspx.cs" Inherits="Oferte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Panel ID="Panel1" CssClass="filtrarePanel" runat="server">
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">

            <asp:ListItem>mare</asp:ListItem>
            <asp:ListItem>munte</asp:ListItem>

        </asp:RadioButtonList>
        <asp:Button ID="Filtrare" CssClass="button" runat="server" Text="Filtrare" />

    </asp:Panel>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource" 
        RepeatColumns="2" RepeatDirection="Horizontal" Width="896px">
        <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
            Font-Strikeout="False" Font-Underline="False" ForeColor="Lime" />
        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
            Font-Strikeout="False" Font-Underline="False" BorderColor="#999999" BorderWidth="2" />
        <ItemTemplate>
            <div class="numeSejur">
                <h3>
                    <asp:Label ID="numeLabel" runat="server" Text='<%# Eval("nume") %>' />
                </h3>
            </div>
            <div class="steleHotel">
                stele:
                <asp:Label ID="steleLabel" runat="server" Text='<%# Eval("stele") %>' />
                <br />
            </div>
            <div class="descriereHotel">
                descriere:
                <asp:Label ID="descriereLabel" runat="server" Text='<%# Eval("descriere") %>' />
                <br />
            </div>
            <div>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "~/Detalii_oferta.aspx?q=" + Eval("id_sejur") %>' Text="Vezi Oferta">
                </asp:HyperLink>
                <br />
            </div>

            
        </ItemTemplate>
        <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
            Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT Sejur.id_sejur, Sejur.nume, Sejur.descriere, Hotel.stele FROM Sejur CROSS JOIN Hotel"></asp:SqlDataSource>
</asp:Content>

