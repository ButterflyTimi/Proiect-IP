<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Detalii_oferta.aspx.cs" Inherits="Detalii_oferta" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True">
        </asp:SqlDataSource>
       
       <asp:DataList ID="DataList1" runat="server" DataKeyField="IdSejur" 
        DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <div class="numeSejur">
                <h3>
                    <asp:Label ID="numeLabel" runat="server" Text='<%# Eval("nume") %>' />
                </h3>
            </div>
            <div class="stele">
            
            <asp:Image ID="imgStatus" runat="server" ImageUrl='<%# Eval("stele", "star{0}.png").ToString() %>' Width="20%" Height="5%"/>
            </div>
            <div class="pret">
            Pret: 
            <asp:Label ID="pretLabel" runat="server" Text='<%# Eval("pret","{0} euro") %>'/>
            </div>
            
            <div class="descriere">
                   <asp:Label ID="descriereLabel" runat="server" Text='<%# Eval("descriere") %>'/>
            </div>
             <div class="disponibilitate">
                   <asp:Label ID="disponibilitate1Label" runat="server" Text='<%# Eval("data_in","Disponibilitate:{0}")%>'/>
                   <asp:Label ID="disponibilitate2Label" runat="server" Text='<%#Eval("data_out","-{0}") %>' />
            </div>
            <div class="checkbox">
            <table width="400px">
            <thead>
            <tr><p>Conditii:</p>
            </tr>
            </thead>
            <tbody>
            <tr>
            <td>Restaurant</td>
            <td><asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#Convert.ToBoolean(Eval("restaurant")) %>' /></td>
            </tr>
            <tr>
            <td>Bar</td>
            <td><asp:CheckBox ID="CheckBox2" runat="server" Checked='<%#Convert.ToBoolean(Eval("bar")) %>' /></td>
            </tr>
            <tr>
            <td>Piscina</td>
            <td><asp:CheckBox ID="CheckBox3" runat="server" Checked='<%#Convert.ToBoolean(Eval("piscina")) %>' /></td>
            </tr>
            <tr>
            <td>Loc de joaca pentru copii</td>
            <td><asp:CheckBox ID="CheckBox4" runat="server" Checked='<%#Convert.ToBoolean(Eval("loc_joaca")) %>' /></td>
            </tr>
            <tr>
            <td>Internet wireless</td>
            <td><asp:CheckBox ID="CheckBox5" runat="server" Checked='<%#Convert.ToBoolean(Eval("wifi")) %>' /></td>
            </tr>
            <tr>
            <td>Minibar camera</td>
            <td><asp:CheckBox ID="CheckBox6" runat="server" Checked='<%#Convert.ToBoolean(Eval("minibar")) %>' /></td>
            </tr>
            <tr>
            <td>Televizor camera</td>
            <td><asp:CheckBox ID="CheckBox7" runat="server" Checked='<%#Convert.ToBoolean(Eval("televizor")) %>' /></td>
            </tr>
            <tr>
            <td>Telefon camera</td>
            <td><asp:CheckBox ID="CheckBox8" runat="server" Checked='<%#Convert.ToBoolean(Eval("telefon")) %>' /></td>
            </tr>
            <tr>
            <td>Trasnport aeroport-hotel</td>
            <td><asp:CheckBox ID="CheckBox9" runat="server" Checked='<%#Convert.ToBoolean(Eval("transport")) %>' /></td>
            </tr>
            <tr>
            <td>Facilitati ingrijire medicala</td>
            <td><asp:CheckBox ID="CheckBox10" runat="server" Checked='<%#Convert.ToBoolean(Eval("ingrijire_medicala")) %>' /></td>
            </tr>
            </tbody>
            </table>
            
            
            </div>
            
            </ItemTemplate>
        </asp:DataList>
       
       
</asp:Content>

