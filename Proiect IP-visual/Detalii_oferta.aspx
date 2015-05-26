<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="Detalii_oferta.aspx.cs" Inherits="Detalii_oferta" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True">
        </asp:SqlDataSource>
       
       <asp:DataList ID="DataList1" runat="server" DataKeyField="IdSejur" 
        DataSourceID="SqlDataSource1">
        <ItemTemplate>

        <div class="row">
            <div class="imagine_sejur">
                <div class="imagine" style="background: url('<%# "pozeSejururi/" + Eval("imagine") %>')">
            
                </div>            
                                   
            </div>
           
            <div class="detalii_sejur">
                <h3>
                    <asp:Label ID="numeLabel" runat="server" Text='<%# Eval("nume") %>' />
                </h3>
                <div class="stele">
            
            <asp:Image ID="imgStatus" runat="server" ImageUrl='<%# Eval("stele", "star{0}.png").ToString() %>' Width="20%" Height="5%"/>
            </div>
            <div class="pret">
                <h4>Pret/Persoana:</h4> 
                <asp:Label ID="pretLabel" runat="server" Text='<%# Eval("pret","{0} euro") %>'/>
            </div>
            
            <div class="descriere">
                <h4>Descriere:</h4> 
                   <asp:Label ID="descriereLabel" runat="server" Text='<%# Eval("descriere") %>'/>
            </div>
            <div class="locuri_disp">
                <h4>Locuri disponibile:</h4> 
                   <asp:Label ID="locuriLabel" runat="server" Text='<%# Eval("locuri_disp") %>'/>
            </div>
             <div class="disponibilitate">
                <h4>Disponibilitate:</h4> 
                   <asp:Label ID="disponibilitate1Label" runat="server" Text='<%# Eval("data_in")%>'/>
                    - 
                   <asp:Label ID="disponibilitate2Label" runat="server" Text='<%#Eval("data_out") %>' />
            </div>

            <div class="checkbox">
                <h4>Conditii:</h4> 


            <table>
            <tbody>
            <tr>
            <td><asp:CheckBox ID="CheckBox1" Enabled="False" runat="server" Checked='<%#Convert.ToBoolean(Eval("restaurant")) %>' /></td>
            
            <td>Restaurant</td>
            </tr>
            <tr>
            <td><asp:CheckBox ID="CheckBox2" Enabled="False" runat="server" Checked='<%#Convert.ToBoolean(Eval("bar")) %>' /></td>
            
            <td>Bar</td>
            </tr>
            <tr>
            <td><asp:CheckBox ID="CheckBox3" Enabled="False" runat="server" Checked='<%#Convert.ToBoolean(Eval("piscina")) %>' /></td>
            
            <td>Piscina</td>
            </tr>
            <tr>
            <td><asp:CheckBox ID="CheckBox4" Enabled="False" runat="server" Checked='<%#Convert.ToBoolean(Eval("loc_joaca")) %>' /></td>
            
            <td>Loc de joaca pentru copii</td>
            </tr>
            <tr>
            <td><asp:CheckBox ID="CheckBox5" Enabled="False" runat="server" Checked='<%#Convert.ToBoolean(Eval("wifi")) %>' /></td>
            
            <td>Internet wireless</td>
            </tr>
            <tr>
            <td><asp:CheckBox ID="CheckBox6" Enabled="False" runat="server" Checked='<%#Convert.ToBoolean(Eval("minibar")) %>' /></td>
            
            <td>Minibar camera</td>
            </tr>
            <tr>
            <td><asp:CheckBox ID="CheckBox7" Enabled="False" runat="server" Checked='<%#Convert.ToBoolean(Eval("televizor")) %>' /></td>
            
            <td>Televizor camera</td>
            </tr>
            <tr>
            <td><asp:CheckBox ID="CheckBox8" Enabled="False" runat="server" Checked='<%#Convert.ToBoolean(Eval("telefon")) %>' /></td>
            
            <td>Telefon camera</td>
            </tr>
            <tr>
            <td><asp:CheckBox ID="CheckBox9" Enabled="False" runat="server" Checked='<%#Convert.ToBoolean(Eval("transport")) %>' /></td>
            
            <td>Transport aeroport-hotel</td>
            </tr>
            <tr>
            <td><asp:CheckBox ID="CheckBox10" Enabled="False" runat="server" Checked='<%#Convert.ToBoolean(Eval("ingrijire_medicala")) %>' /></td>
            
            <td>Facilitati ingrijire medicala</td>
            </tr>
            </tbody>
            </table>
            
            
            </div>

            </div>
        </div>
                            
            </ItemTemplate>
        </asp:DataList>
        <div id="rez" class="rezervare" runat="server" >
            <asp:Label ID="text_locuri" visible="false" runat="server">Numar locuri rezervare</asp:Label>  
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="nr_loc"></asp:RequiredFieldValidator>
                
            <asp:TextBox ID="nr_loc" visible="false" runat="server">
            </asp:TextBox>
             <asp:Button ID="rezerva" visible="false" class="btn primary-button" runat="server" Text="Rezerva" OnClick="rezerva_buton"/>
                    
                
        </div>
 
 <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
ConnectionString="<%$ ConnectionStrings:ConnectionString1 %>"
SelectCommand="SELECT TOP 4 Sejur.id_sejur, Sejur.nume, Sejur.pret, Sejur.id_hotel, Sejur.imagine, Hotel.id_hotel AS idHotel, Hotel.nume AS HotelNume, Hotel.stele, Sejur.id_tipoferta, TipOferta.denumire, Sejur.descriere, Sejur.Forma_turism FROM Sejur INNER JOIN Hotel ON Sejur.id_hotel = Hotel.id_hotel INNER JOIN TipOferta ON Sejur.id_tipoferta = TipOferta.id_tipoferta INNER JOIN Facilitati ON Hotel.id_hotel = Facilitati.id_hotel">
</asp:SqlDataSource> 

<div class="row recomandari-wrapper">

    <h2>Din aceeasi categorie</h2>

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
            <ItemTemplate>

            <div class="recomandari">
                <div class="imagine_titlu">
                    <div class="imagine" style="background: url('<%# "pozeSejururi/" + Eval("imagine") %>')"></div>
                    <h4>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "~/Detalii_oferta.aspx?q=" + Eval("id_sejur") %>' >
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("nume") %>' />
                        </asp:HyperLink>
                    </h4>
                    <div class="detalii">
                        <div class="stele">
                            <asp:Image ID="imgStatus" runat="server" ImageUrl='<%# Eval("stele", "star{0}.png").ToString() %>'/>
                        </div>
                        <div class="pret">
                            Pret: 
                            <asp:Label ID="pretLabel" runat="server" Text='<%# Eval("pret","{0} euro") %>'/>
                        </div>
                        <div class="categorie">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Forma_turism") %>' />
                        </div>
                    </div>
                </div>
            </div>

            </ItemTemplate>
    </asp:Repeater>
</div>       
</asp:Content>
