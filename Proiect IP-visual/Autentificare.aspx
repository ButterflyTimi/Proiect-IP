<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Autentificare.aspx.cs" Inherits="Autentificare" MasterPageFile="~/MasterPage.master"%>


    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="text-align: center">
    
        <asp:Label ID="Label1" runat="server" Text="Autentificare" style="text-align: justify"></asp:Label>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style11" style="text-align: left">UserName:</td>
                <td style="text-align: left" class="auto-style8">
                    <asp:TextBox ID="username" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="usernamevalidator" runat="server" ControlToValidate="username" ErrorMessage="Camp obligatoriu"></asp:RequiredFieldValidator>
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
            <tr>
                <td class="auto-style13">
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inregistrare.aspx">Inregistrare</asp:HyperLink>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="login" runat="server" OnClick="login_Click" Text="Login" />
                </td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </asp:Content>
