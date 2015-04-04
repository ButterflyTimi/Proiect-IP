using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Detalii_oferta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string q = Request.Params["q"];
            if (q != null)
            {
                try
                {
                    q = Server.UrlDecode(q);
                    SqlDataSource1.SelectCommand = " SELECT Sejur.id_sejur as IdSejur, Sejur.nume, Sejur.descriere, Sejur.pret, Sejur.data_in, Sejur.data_out, Hotel.stele, Facilitatii.restaurant, Facilitatii.bar, Facilitatii.piscina, Facilitatii.loc_joaca, Facilitatii.wifi, Facilitatii.minibar, Facilitatii.televizor, Facilitatii.telefon, Facilitatii.transport, Facilitatii.ingrijire_medicala FROM Sejur, Hotel, Facilitatii WHERE Sejur.id_sejur = @q and Hotel.id_hotel=Sejur.id_hotel and Hotel.id_hotel = Facilitatii.id_hotel";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("q", q);
                    SqlDataSource1.DataBind();

                }
                catch (Exception err)
                {
                }
            }
            else
            {
                Response.Redirect("~/Home.aspx");
            }
        }
    }
}