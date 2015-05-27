using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class PaginaTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {

                string nume = Session["USER_ID"].ToString();
                if (nume != null)
                {
                    Titlu.Text = "Recomandate pentru tine";
                    SqlDataSource1.SelectCommand = "SELECT distinct TOP 4 Sejur.id_sejur, Sejur.nume, Sejur.pret, Sejur.id_hotel, Sejur.imagine, Hotel.id_hotel AS idHotel, Hotel.nume AS HotelNume, Hotel.stele, Sejur.id_tipoferta, TipOferta.denumire, Sejur.descriere, Sejur.Forma_turism FROM Sejur INNER JOIN Hotel ON Sejur.id_hotel = Hotel.id_hotel INNER JOIN TipOferta ON Sejur.id_tipoferta = TipOferta.id_tipoferta INNER JOIN Facilitati ON Hotel.id_hotel = Facilitati.id_hotel INNER JOIN aspnet_Membership ON Sejur.Forma_turism = aspnet_Membership.Forma_turism WHERE aspnet_Membership.username = @username";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("username", nume);
                    SqlDataSource1.DataBind();
                }
               
            }
            catch (Exception err)
            {
               
            }
        }
    }
}