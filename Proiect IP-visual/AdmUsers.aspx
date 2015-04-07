<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdmUsers.aspx.cs" Inherits="AdmUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="UserId" 
                DataNavigateUrlFormatString='~/AdmUserC.aspx?UserId={0}' 
                Text="Change Him" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>" 
        SelectCommand="SELECT UserId, username FROM aspnet_Membership">
    </asp:SqlDataSource>
    
</asp:Content>

