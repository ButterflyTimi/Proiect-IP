<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Inregistrare.aspx.cs" Inherits="Inregistrare" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="sign-up-form">
            <h2><i class="fa fa-user-plus"></i> Inregistreaza-te</h2>
        <div class="form-horizontal">
             <div class="form-group">
                <label class="col-sm-2 control-label">Nume utilizator:</label>
                <div class="col-sm-9 input-tb">
                    <asp:TextBox ID="user_name" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1 validators">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="user_name" ErrorMessage="*"></asp:RequiredFieldValidator>
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-2 control-label">Email:</label>
                <div class="col-sm-9 input-tb">
                    <asp:TextBox ID="email" runat="server"  CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1 validators">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="*"></asp:RequiredFieldValidator>
                </div>
             </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">Parola:</label>
                <div class="col-sm-9 input-tb">
                    <asp:TextBox ID="parola" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1 validators">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="parola" ErrorMessage="*"></asp:RequiredFieldValidator>
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-2 control-label">Confirma parola:</label>
                <div class="col-sm-9 input-tb">
                    <asp:TextBox ID="cparola" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-1 validators">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cparola" ErrorMessage="*"></asp:RequiredFieldValidator>
                </div>
             </div>

            <div class="form-group">
                <div class="col-sm-2">
                    <asp:Button ID="Reset_Button" runat="server" Text="Reset" CssClass="btn primary-button" OnClientClick="this.form.reset();return false;" />
                </div>
                <div class="col-sm-10">
                    <asp:Button ID="Button1" runat="server" Text="Inregistrare" CssClass="btn primary-button" OnClick="Button1_Click" />
                </div>
          </div>
          <div class="form-group">
                <div class="col-sm-12 validators small">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Email invalid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="col-sm-12 validators small">
                    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="parola" ControlToValidate="cparola" ErrorMessage="Parolele nu corespund"></asp:CompareValidator>
                </div>
          </div>
        </div>
        
                        
    </div>
</div>
    </asp:Content>
