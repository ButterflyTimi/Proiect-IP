<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Autentificare" MasterPageFile="~/MasterPage.master"%>


    <asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
    <div class="sign-in-form">
        <h2><i class="fa fa-sign-in"></i> Conecteaza-te</h2>
        <div class="form-horizontal">
         <div class="form-group">
            <label class="col-sm-3 control-label">Nume utilizator:</label>
            <div class="col-sm-8 input-tb">
               <asp:TextBox ID="username" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-sm-1 validators">
                <asp:RequiredFieldValidator ID="usernamevalidator" runat="server" ControlToValidate="username" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
         </div>

         <div class="form-group">
            <label class="col-sm-3 control-label">Parola:</label>
            <div class="col-sm-8 input-tb">
               <asp:TextBox ID="parolabox" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-sm-1 validators">
                <asp:RequiredFieldValidator ID="parolavalidator" runat="server" ControlToValidate="parolabox" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>
         </div>

         <div class="form-group">
            <div class="col-sm-3">
                Nu ai cont? 
                <asp:HyperLink ID="HyperLink2" runat="server" CssClass="inregistreaza-te" NavigateUrl="~/Inregistrare.aspx">Inregistreaza-te</asp:HyperLink>
            </div>
            <div class="col-sm-9">
                <asp:Button ID="login" runat="server" OnClick="login_Click" Text="Login" CssClass="btn primary-button" />
            </div>
          </div>
            <asp:Label ID="ResponseLogin" runat="server" Text="" CssClass="validators small"></asp:Label>
          </div>
        </div>
    </div>
    </asp:Content>
