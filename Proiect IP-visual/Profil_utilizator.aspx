﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profil_utilizator.aspx.cs" Inherits="Profil_utilizator" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <table>
            <tr>
                <td>UserName Vechi:</td>
                <td>
                    <asp:TextBox ID="usernamevechibox" runat="server"></asp:TextBox>
                </td>
                <td>UserName Nou:</td>
                <td>
                    <asp:TextBox ID="usernamenoubox" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="username" runat="server" Text="Schimba username" 
                        onclick="username_Click" />
                </td>
                
            </tr>
            <tr>
                <td>Parola veche</td>
                <td>
                    <asp:TextBox ID="parolavechebox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>Parola noua</td>
                <td>
                    <asp:TextBox ID="parolanouabox" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:Button ID="parola" runat="server" Text="Schimba parola" 
                        onclick="parola_Click" />
                </td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="parolavechebox" ErrorMessage="Parola necesara"></asp:RequiredFieldValidator>
            </tr>
    </table >

        <br />
        <asp:Label ID="Label3" runat="server" Text="Ce forma de turism va intereseaza?"></asp:Label>

        <br />
        <asp:RadioButton ID="Sportiv" runat="server" text="Sportiv" GroupName="2"/>
        <asp:RadioButton ID="Recreere" runat="server" text="Recreere" GroupName="2"/>
        <asp:RadioButton ID="Cultural" runat="server" text="Cultural" GroupName="2"/>
        <asp:RadioButton ID="Ingrijire_Sanatate" runat="server" text="Ingrijire Sanatate" GroupName="2"/>

        <br />
        <asp:Label ID="Label4" runat="server" Text="Ce durata de sejur preferati?"></asp:Label>

        <br />
        <asp:RadioButton ID="scurta" runat="server" text="2-3 zile" GroupName="3"/>
        <asp:RadioButton ID="medie" runat="server" text="4-5 zile" GroupName="3"/>
        <asp:RadioButton ID="lunga" runat="server" text="6-7 zile" GroupName="3"/>

        <br />
        <asp:Label ID="Label5" runat="server" Text="Ce suma aveti de gand sa cheltuiti?"></asp:Label>

        <br />
        <asp:RadioButton ID="unu" runat="server" text="sub 100 euro" GroupName="4"/>
        <asp:RadioButton ID="doi" runat="server" Text="100-200 euro" GroupName="4"/>
        <asp:RadioButton ID="trei" runat="server" text="200-300 euro" GroupName="4"/>
        <asp:RadioButton ID="patru" runat="server" text="peste 300 euro" GroupName="4"/>
        
        
        <br />
        <asp:Label ID="Label6" runat="server" Text="Ce nivel al hotelului va doriti?"></asp:Label>

        <br />
        <asp:RadioButton ID="first" runat="server" Text="2 stele" GroupName="5"/>
        <asp:RadioButton ID="second" runat="server" Text="3 stele" GroupName="5"/>
        <asp:RadioButton ID="third" runat="server" text="4 stele" GroupName="5"/>
        <asp:RadioButton ID="fourth" runat="server" text="5 stele" GroupName="5"/>
        <br />
    <asp:Button ID="Salveaza" runat="server" Text="Salveaza" onclick="Button2_Click" />

</asp:Content>
