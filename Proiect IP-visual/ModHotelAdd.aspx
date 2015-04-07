<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ModHotelAdd.aspx.cs" Inherits="ModHotelAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table id="Table1" runat="server">
        <tr style="border: 2px black; border-style: solid; height: 30px;">
            <td>
                <asp:Label ID="NumeHotelL" runat="server" Text="Nume Hotel"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NumeHotelTB" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="SteleHotelL" runat="server" Text="Stele Hotel"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="SteleHotelRBL" runat="server" Width="60px">
                    <asp:ListItem Value="1" Text="1*" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="2" Text="2*"></asp:ListItem>
                    <asp:ListItem Value="3" Text="3*"></asp:ListItem>
                    <asp:ListItem Value="4" Text="4*"></asp:ListItem>
                    <asp:ListItem Value="5" Text="5*"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid; height: 30px;">
            <td>
                <asp:Label ID="Label1" runat="server" Text="Lant Hotelier"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="LantHotelierDDL" runat="server" DataSourceID="SqlDataSource1"
                    DataTextField="denumire" DataValueField="id_lant">
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid; height: 30px;">
            <td>
                <asp:Label ID="DenumireLocatieL" runat="server" Text="Denumire Locatie"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="DenumireLocatieTB" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid; height: 30px;">
            <td>
                <asp:Label ID="TaraL" runat="server" Text="Tara"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TaraTB" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid; height: 30px;">
            <td>
                <asp:Label ID="JudetL" runat="server" Text="Judet"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="JudetTB" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid; height: 30px;">
            <td>
                <asp:Label ID="StradaL" runat="server" Text="Strada"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="StradaTB" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid; height: 30px;">
            <td>
                <asp:Label ID="NumarL" runat="server" Text="Numar"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="NumarTB" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="RestaurantFL" runat="server" Text="Restaurant"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="RestaurantFRBL" runat="server">
                    <asp:ListItem Value="false" Selected="True">NU</asp:ListItem>
                    <asp:ListItem Value="true">DA</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="BarFL" runat="server" Text="Bar"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="BarFRBL" runat="server">
                    <asp:ListItem Value="false" Selected="True">NU</asp:ListItem>
                    <asp:ListItem Value="true">DA</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="PiscinaL" runat="server" Text="Piscina"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="PiscinaFRBL" runat="server">
                    <asp:ListItem Value="false" Selected="True">NU</asp:ListItem>
                    <asp:ListItem Value="true">DA</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="LocJoacaFL" runat="server" Text="Loc Joaca"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="LocJoacaFRBL" runat="server">
                    <asp:ListItem Value="false" Selected="True">NU</asp:ListItem>
                    <asp:ListItem Value="true">DA</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="WIFIfL" runat="server" Text="WIFI"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="WIFIfRBL" runat="server">
                    <asp:ListItem Value="false" Selected="True">NU</asp:ListItem>
                    <asp:ListItem Value="true">DA</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="MinibarFL" runat="server" Text="Minibar"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="MinibarFRBL" runat="server">
                    <asp:ListItem Value="false" Selected="True">NU</asp:ListItem>
                    <asp:ListItem Value="true">DA</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="TelevizorFL" runat="server" Text="Televizor"></asp:Label>
            </td>
            <td class="style1">
                <asp:RadioButtonList ID="TelevizorFRBL" runat="server">
                    <asp:ListItem Value="false" Selected="True">NU</asp:ListItem>
                    <asp:ListItem Value="true">DA</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="TelefonFL" runat="server" Text="Telefon"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="TelefonFRBL" runat="server">
                    <asp:ListItem Value="false" Selected="True">NU</asp:ListItem>
                    <asp:ListItem Value="true">DA</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="TransportFL" runat="server" Text="Transport"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="TransportFRBL" runat="server">
                    <asp:ListItem Value="false" Selected="True">NU</asp:ListItem>
                    <asp:ListItem Value="true">DA</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="border: 2px black; border-style: solid;">
            <td>
                <asp:Label ID="IngrMedFL" runat="server" Text="Ingrijire Medicala"></asp:Label>
            </td>
            <td>
                <asp:RadioButtonList ID="IngrMedFRBL" runat="server">
                    <asp:ListItem Value="false" Selected="True">NU</asp:ListItem>
                    <asp:ListItem Value="true">DA</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
        SelectCommand="SELECT [id_lant], [denumire] FROM [LantHotelier]"></asp:SqlDataSource>
    <asp:Button ID="AddHotelB" runat="server" Text="Adauga Hotel" OnClick="AddHotelB_Click" />
    <br />
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
</asp:Content>
