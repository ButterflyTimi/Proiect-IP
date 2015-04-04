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
    <!--
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
                
                <br />
            </div>

            
        </ItemTemplate>
        <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
            Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource" runat="server" 
        ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT Sejur.nume, Sejur.descriere, Hotel.stele FROM Sejur CROSS JOIN Hotel"></asp:SqlDataSource>
        -->
    <div class="oferte-wrapper">
    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1"
        RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
        <ItemTemplate>
        <div class="row">
            <div class="col-sm-12 imagine_titlu">
                <div class="imagine" style="background: url('<%# "pozeSejururi/" + Eval("imagine") %>')"></div>
                <!--<asp:Image CssClass="imagini" ID="Image1" runat="server" ImageUrl='<%# "~/pozeSejururi/" + Eval("imagine") %>' />    -->            
                <h4>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("nume") %>' />
                </h4>
            </div>
        </div>
        <!--
        <div class="row">
            <div class="col-sm-12">
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("descriere") %>' />
            </div>
        </div>-->
        <div class="row">
            <div class="col-sm-12">
                <!--<asp:Button ID="VeziOferta" CssClass="btn primary-button" runat="server" Text="Vezi oferta" />-->
                <asp:HyperLink ID="HyperLink1" runat="server" CssClass="btn primary-button" NavigateUrl='<%# "~/Detalii_oferta.aspx?q=" + Eval("id_sejur") %>' Text="Vezi Oferta">
                </asp:HyperLink>
            </div>
        </div>
        </ItemTemplate>
    </asp:DataList>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
        
    SelectCommand="SELECT Sejur.id_sejur, Sejur.nume, Sejur.pret, Sejur.id_hotel, Sejur.imagine, Hotel.id_hotel AS idHotel, Hotel.nume AS HotelNume, Hotel.stele, Sejur.id_tipoferta, TipOferta.denumire, Sejur.descriere FROM Sejur INNER JOIN Hotel ON Sejur.id_hotel = Hotel.id_hotel INNER JOIN TipOferta ON Sejur.id_tipoferta = TipOferta.id_tipoferta"></asp:SqlDataSource>
</div>
</asp:Content>

