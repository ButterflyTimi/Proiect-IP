<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Profil_utilizator.aspx.cs" Inherits="Profil_utilizator" MasterPageFile="~/MasterPage.master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="row">
        <div class="alert alert-info" id="message" runat="server"></div>
    <div class="change-username">
    
        <div class="form-horizontal">
             <div class="form-group">
                <label class="col-sm-4 control-label">Nume utilizator:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="usernamevechibox" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-4 control-label">Nume nou utilizator:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="usernamenoubox" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
             </div>

             <div class="form-group">
                <div class="col-sm-8 col-sm-offset-4">
                <asp:Button ID="username" runat="server" Text="Schimba nume utilizator" CssClass="btn primary-button" 
                onclick="username_Click" />
                </div>
             </div>
        </div>
    </div>

    <div class="change-password">
    
        <div class="form-horizontal">
             <div class="form-group">
                <label class="col-sm-4 control-label">Parola:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="parolavechebox" CssClass="form-control"  runat="server" TextMode="Password"></asp:TextBox>
                </div>
             </div>

             <div class="form-group">
                <label class="col-sm-4 control-label">Parola noua:</label>
                <div class="col-sm-8 input-tb">
                    <asp:TextBox ID="parolanouabox" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                </div>
             </div>

             <div class="form-group">
                <div class="col-sm-8 col-sm-offset-4">
                <asp:Button ID="parola" runat="server" Text="Schimba parola" CssClass="btn primary-button"
                        onclick="parola_Click" />
                </div>
             </div>
        </div>
    </div>

    <div class="col-sm-12 text-center">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="alert alert-danger" runat="server" ControlToValidate="parolavechebox" ErrorMessage="Parola necesara"></asp:RequiredFieldValidator>
    </div>

    <div class="col-sm-12 profile-questions">
        <asp:Label ID="Label3" runat="server" CssClass="question" Text="Ce forma de turism va intereseaza?"></asp:Label>

        <asp:RadioButton ID="Sportiv" runat="server" text="Sportiv" GroupName="2"/>
        <asp:RadioButton ID="Recreere" runat="server" text="Recreere" GroupName="2"/>
        <asp:RadioButton ID="Cultural" runat="server" text="Cultural" GroupName="2"/>
        <asp:RadioButton ID="Ingrijire_Sanatate" runat="server" text="Ingrijire Sanatate" GroupName="2"/>

        <asp:Label ID="Label4" runat="server" CssClass="question" Text="Ce durata de sejur preferati?"></asp:Label>

        <asp:RadioButton ID="scurta" runat="server" text="2-3 zile" GroupName="3"/>
        <asp:RadioButton ID="medie" runat="server" text="4-5 zile" GroupName="3"/>
        <asp:RadioButton ID="lunga" runat="server" text="6-7 zile" GroupName="3"/>

        <asp:Label ID="Label5" runat="server" CssClass="question" Text="Ce suma aveti de gand sa cheltuiti?"></asp:Label>

        <asp:RadioButton ID="unu" runat="server" text="sub 100 euro" GroupName="4"/>
        <asp:RadioButton ID="doi" runat="server" Text="100-200 euro" GroupName="4"/>
        <asp:RadioButton ID="trei" runat="server" text="200-300 euro" GroupName="4"/>
        <asp:RadioButton ID="patru" runat="server" text="peste 300 euro" GroupName="4"/>
        
        <asp:Label ID="Label6" runat="server" CssClass="question" Text="Ce nivel al hotelului va doriti?"></asp:Label>

        <asp:RadioButton ID="first" runat="server" Text="2" GroupName="5"/>
        <asp:RadioButton ID="second" runat="server" Text="3" GroupName="5"/>
        <asp:RadioButton ID="third" runat="server" text="4" GroupName="5"/>
        <asp:RadioButton ID="fourth" runat="server" text="5" GroupName="5"/>

    <asp:Button ID="Salveaza" runat="server" CssClass="btn primary-button" Text="Salveaza" onclick="Button2_Click" />
    </div>
    </div>
    </div>
    </div>
</asp:Content>
