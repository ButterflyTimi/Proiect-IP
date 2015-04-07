<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdmUserC.aspx.cs" Inherits="AdmUserC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="UserIdL" runat="server"></asp:Label>
    <br />
    <asp:Label ID="UserNameL" runat="server"></asp:Label>
    <br />
    <asp:Label ID="UserRoleL" runat="server"></asp:Label>
    <asp:DropDownList ID="DropDownList1" runat="server" 
        DataSourceID="SqlDataSource2" DataTextField="RoleName" DataValueField="RoleId">
    </asp:DropDownList>
    <asp:Button ID="ChangeRoleB" runat="server" Text="Change User Role" />
    <br />
    <br />
    <asp:Button ID="DeleteB" runat="server" Text="Delete User" 
        onclick="DeleteB_Click" />
    <br />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
        SelectCommand="SELECT RoleId, RoleName FROM aspnet_Roles">
    </asp:SqlDataSource>
</asp:Content>

