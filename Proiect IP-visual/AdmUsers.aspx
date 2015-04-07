<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AdmUsers.aspx.cs" Inherits="AdmUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
        SelectCommand="SELECT UserId, username FROM aspnet_Membership"></asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="UserId" DataSourceID="SqlDataSource2">
        <ItemTemplate>
        UserId:
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("UserId","~/AdmUserC.aspx?UserId={0}") %>'>
            <asp:Label ID="UserIdLabel" runat="server" Text='<%# Eval("UserId") %>' />
            </asp:HyperLink><br />username: <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
