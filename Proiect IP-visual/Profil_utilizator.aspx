<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profil_utilizator.aspx.cs" Inherits="Profil_utilizator" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style11" style="text-align: left">UserName:</td>
                <td style="text-align: left" class="auto-style8">
                    <asp:TextBox ID="username" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="usernamevalidator" runat="server" ControlToValidate="username" ErrorMessage="Camp obligatoriu"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Schimba parola" />
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Parola</td>
                <td class="auto-style6">
                    <asp:TextBox ID="parolabox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:RequiredFieldValidator ID="parolavalidator" runat="server" ControlToValidate="parolabox" ErrorMessage="Camp obligatoriu"></asp:RequiredFieldValidator>
                </td>
            </tr>
    </table >
    <asp:Label ID="Label2" runat="server" Text="Ce tip de destinatii va intereseaza?"></asp:Label>

        <br />
        <asp:RadioButton ID="Munte" runat="server" Text="Munte" GroupName="1"/>
        <asp:RadioButton ID="Mare" runat="server" Text="Mare" GroupName="1"/>

        <br />
        <asp:Label ID="Label3" runat="server" Text="Ce forma de turism va intereseaza?"></asp:Label>

        <br />
        <asp:RadioButton ID="Montan" runat="server" text="Montan"/>
        <asp:RadioButton ID="Sportiv" runat="server" text="Sportiv"/>
        <asp:RadioButton ID="Recreere" runat="server" text="Recreere"/>
        <asp:RadioButton ID="Cultural" runat="server" text="Cultural"/>
        <asp:RadioButton ID="Ingrijire_Sanatate" runat="server" text="Ingrijire Sanatate"/>

        <br />
        <asp:Label ID="Label4" runat="server" Text="Ce durata de sejur preferati?"></asp:Label>

        <br />
        <asp:RadioButton ID="scurta" runat="server" text="scurta"/>
        <asp:RadioButton ID="medie" runat="server" text="medie"/>
        <asp:RadioButton ID="lunga" runat="server" text="lunga"/>

        <br />
        <asp:Label ID="Label5" runat="server" Text="Ce suma aveti de gand sa cheltuiti?"></asp:Label>

        <br />
        <asp:RadioButton ID="unu" runat="server" Text="200-300 euro" />
        <asp:RadioButton ID="doi" runat="server" text="300-500 euro"/>
        <asp:RadioButton ID="trei" runat="server" text="500-1000 euro"/>
        <asp:RadioButton ID="patru" runat="server" text="peste 1000 euro"/>
        
        <br />
        <asp:Label ID="Label6" runat="server" Text="Ce nivel al hotelului va doriti?"></asp:Label>

        <br />
        <asp:RadioButton ID="first" runat="server" Text="2 stele" />
        <asp:RadioButton ID="second" runat="server" Text="3 stele" />
        <asp:RadioButton ID="third" runat="server" text="4 stele"/>
        <asp:RadioButton ID="fourth" runat="server" text="5 stele"/>
        <br />
    <asp:Button ID="Button2" runat="server" Text="Salveaza" onclick="Button2_Click" />

</asp:Content>
