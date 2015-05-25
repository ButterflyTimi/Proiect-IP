﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="PaginaTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
SelectCommand="SELECT TOP 4 Sejur.id_sejur, Sejur.nume, Sejur.pret, Sejur.id_hotel, Sejur.imagine, Hotel.id_hotel AS idHotel, Hotel.nume AS HotelNume, Hotel.stele, Sejur.id_tipoferta, TipOferta.denumire, Sejur.descriere FROM Sejur INNER JOIN Hotel ON Sejur.id_hotel = Hotel.id_hotel INNER JOIN TipOferta ON Sejur.id_tipoferta = TipOferta.id_tipoferta INNER JOIN Facilitati ON Hotel.id_hotel = Facilitati.id_hotel LEFT JOIN Oferta_vizite ON Sejur.id_sejur = Oferta_vizite.id_oferta ORDER BY Oferta_vizite.nr_vizite DESC ">
</asp:SqlDataSource>

<div class="row">
    <div class="home-wrapper">

    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <HeaderTemplate>
            <h2>Topul celor mai vizualizate oferte</h2>
        </HeaderTemplate>
        <ItemTemplate>

                <div class="col-sm-3 imagine_titlu">
                    <div class="imagine" style="background: url('<%# "pozeSejururi/" + Eval("imagine") %>')"></div>
                    <h4>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Detalii_oferta.aspx?q=" + Eval("id_sejur") %>' >
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("nume") %>' />
                        </asp:HyperLink>
                    </h4>
                </div>
        
        </ItemTemplate>
        </asp:Repeater>
    </div>
    </div>
</div>


</asp:Content>

