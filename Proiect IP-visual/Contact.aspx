<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="row">
    <div class="contact-form">

<asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
    <h2>Pentru orice informatii sau intrebari, ne puteti trimite mesaje aici:</h2>

    <div class="form-horizontal">
             <div class="form-group">
                <label class="col-sm-3 control-label">Nume utilizator:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="YourName" runat="server" CssClass="form-control" />
                </div>
                <div class="col-sm-1 validators">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
                    ControlToValidate="YourName" ValidationGroup="save" />
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-3 control-label">Email:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="YourEmail" runat="server" CssClass="form-control"/>
                </div>
                <div class="col-sm-1 validators">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                    ControlToValidate="YourEmail" ValidationGroup="save" />
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-3 control-label">Subiect:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="YourSubject" runat="server" CssClass="form-control"/>
                </div>
                <div class="col-sm-1 validators">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
                    ControlToValidate="YourSubject" ValidationGroup="save" />
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-3 control-label">Mesaj:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="Comments" runat="server" CssClass="form-control"
                    TextMode="MultiLine" Rows="10" />
                </div>
                <div class="col-sm-1 validators">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
                    ControlToValidate="Comments" ValidationGroup="save" />
                </div>
             </div>

             <div class="form-group">
                <div class="col-sm-12 validators small">
                    <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator23"
                    SetFocusOnError="true" Text="Example: username@gmail.com" ControlToValidate="YourEmail"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
                    ValidationGroup="save" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Trimite" CssClass="btn primary-button"
                    OnClick="Button1_Click" ValidationGroup="save" />
                </div>
            </div>
    </div>

</asp:Panel>
<p>
    <asp:Label ID="DisplayMessage" runat="server" Visible="false" />
</p>  
</div>
</div>
</asp:Content>

