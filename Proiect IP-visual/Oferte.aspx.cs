using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Oferte : System.Web.UI.Page
{
    String defaultSelectCommand = "SELECT Sejur.id_sejur, Sejur.nume, Sejur.pret, Sejur.id_hotel, Sejur.imagine, Hotel.id_hotel AS idHotel, Hotel.nume AS HotelNume, Hotel.stele, Sejur.id_tipoferta, TipOferta.denumire, Sejur.descriere, Sejur.Forma_turism FROM Sejur INNER JOIN Hotel ON Sejur.id_hotel = Hotel.id_hotel INNER JOIN TipOferta ON Sejur.id_tipoferta = TipOferta.id_tipoferta INNER JOIN Facilitati ON Hotel.id_hotel = Facilitati.id_hotel where 1=1 ";

    static String customSql1 = "";
    static String customSql2 = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void AnulareFiltre_Click(object sender, EventArgs e)
    {
        CheckBoxList1.ClearSelection();
        CheckBoxList2.ClearSelection();
        customSql1 = "";
        customSql2 = "";

        runFilter();
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

            customSql1 = " and Hotel.stele in (" + selectedValues + ")";
            //SqlDataSource1.SelectCommand = defaultSelectCommand + " and Hotel.stele in (" + selectedValues + ")";
            //SqlDataSource1.DataBind();
            //DataList2.DataBind();
        }
        else
        {
            customSql1 = "";
            //SqlDataSource1.SelectCommand = defaultSelectCommand;
            //SqlDataSource1.DataBind();
            //DataList2.DataBind();
        }

        runFilter();
    }

    protected void CheckBoxList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        if (CheckBoxList2.SelectedItem != null)
        {
            string selectedValues = "";
            foreach (ListItem item in CheckBoxList2.Items)
            {
                if (item.Selected)
                {
                    if (selectedValues != "")
                    {
                        //selectedValues = selectedValues + " and ";
                    }
                    selectedValues = selectedValues + " and Facilitati." + item.Value + "='true'";
                }
            }

            customSql2 = selectedValues;
            //SqlDataSource1.SelectCommand = defaultSelectCommand + selectedValues;
            //SqlDataSource1.DataBind();
            //DataList2.DataBind();
        }
        else
        {
            customSql2 = "";
            //SqlDataSource1.SelectCommand = defaultSelectCommand;
            //SqlDataSource1.DataBind();
            //DataList2.DataBind();
        }

        runFilter();
    }

    protected void runFilter()
    {
        SqlDataSource1.SelectCommand = defaultSelectCommand + customSql1 + customSql2;
        SqlDataSource1.DataBind();
        DataList2.DataBind();
    }
}