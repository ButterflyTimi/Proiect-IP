using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ModHotelAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddHotelB_Click(object sender, EventArgs e)
    {
        string numeH = NumeHotelTB.Text.ToString();
        string steleH = SteleHotelRBL.SelectedValue.ToString();
        int idLant = int.Parse(LantHotelierDDL.SelectedValue);
        string denL = DenumireLocatieTB.Text;
        string taraL = TaraTB.Text;
        string judetL = JudetTB.Text;
        string stradaL = StradaL.Text;
        int numarL = 0;
        int h;
        try
        {
            if (int.TryParse(NumarTB.Text, out h))
            {
                numarL = h;
            }
            else
            {
                Response.Redirect("~/ModHotelAdd.aspx");
            }
        }
        catch
        {
        }
        bool restF = false;
        if (RestaurantFRBL.SelectedValue.ToString() == "true")
        {
            restF = true;
        }

        bool barF = false;
        if (BarFRBL.SelectedValue.ToString() == "true")
        {
            barF = true;
        }
        
        bool piscF = false;
        if (PiscinaFRBL.SelectedValue.ToString() == "true")
        {
            piscF = true;
        }
        
        
        bool locJocF = false;
        if (LocJoacaFRBL.SelectedValue.ToString() == "true")
        {
            locJocF = true;
        }
        
        bool wifiF = false;
        if (WIFIfRBL.SelectedValue.ToString() == "true")
        {
            wifiF = true;
        }
        
        bool minibarF = false;
        if (MinibarFRBL.SelectedValue.ToString() == "true")
        {
            minibarF = true;
        }
        
        bool televF = false;
        if (TelevizorFRBL.SelectedValue.ToString() == "true")
        {
            televF = true;
        }
        
        bool telefF = false;
        if (TelefonFRBL.SelectedValue.ToString() == "true")
        {
            telefF = true;
        }
        
        bool transF = false;
        if (TransportFRBL.SelectedValue.ToString() == "true")
        {
            transF = true;
        }
        
        bool ingmedF = false;
        if (IngrMedFRBL.SelectedValue.ToString() == "true")
        {
            ingmedF = true;
        }

        Label2.Text =numeH + " " + steleH + " " + idLant + " " + denL + " " + taraL + " " + judetL + " " + stradaL + " " + numarL + " " + restF + " " + barF + " " + piscF + " " + locJocF + " " + wifiF + " " + minibarF + " " + televF + " " + telefF + " " + transF + " " + ingmedF;

    
    

    }
}