using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Oferte : System.Web.UI.Page
{
    static String defaultSelectCommand = "SELECT Sejur.id_sejur, Sejur.nume, Sejur.pret, Sejur.id_hotel, Sejur.imagine, Hotel.id_hotel AS idHotel, Hotel.nume AS HotelNume, Hotel.stele, Sejur.id_tipoferta, TipOferta.denumire, Sejur.descriere FROM Sejur INNER JOIN Hotel ON Sejur.id_hotel = Hotel.id_hotel INNER JOIN TipOferta ON Sejur.id_tipoferta = TipOferta.id_tipoferta";
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void AnulareFiltre_Click(object sender, EventArgs e)
    {
        CheckBoxList1.ClearSelection();
        SqlDataSource1.SelectCommand = defaultSelectCommand;
        SqlDataSource1.DataBind();
        DataList2.DataBind();
    }
   
    protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (CheckBoxList1.SelectedItem != null)
        {
            string selectedValues = "";
            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                {
                    if (selectedValues != "")
                    {
                        selectedValues = selectedValues + ", ";
                    }
                    selectedValues = selectedValues + item.Value;
                }
            }
            
            SqlDataSource1.SelectCommand = defaultSelectCommand + " and Hotel.stele in (" + selectedValues + ")";
            SqlDataSource1.DataBind();
            DataList2.DataBind();
        }
        else
        {
            SqlDataSource1.SelectCommand = defaultSelectCommand;
            SqlDataSource1.DataBind();
            DataList2.DataBind();
        }
    }
}