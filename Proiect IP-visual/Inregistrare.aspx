<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inregistrare.aspx.cs" Inherits="Inregistrare" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div>
    
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">User Name:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="user_name" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="user_name" ErrorMessage="Camp obligatoriu"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">E-mail:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="Camp obligatoriu"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Email invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Parola:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="parola" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="parola" ErrorMessage="Camp obligatoriu"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Confirmare Parola:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="cparola" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cparola" ErrorMessage="Camp obligatoriu"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="parola" ControlToValidate="cparola" ErrorMessage="Parolele nu corespund"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="Button1" runat="server" Text="Inregistrare" OnClick="Button1_Click" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="Reset_Button" runat="server" Text="Reset" 
    OnClientClick="this.form.reset();return false;" /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </asp:Content>
