using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;



public partial class Detalii_oferta : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            string q = Request.Params["q"];
            string nume2 = null;
            string sqlVerif = null;
            if (q != null)
            {
                try
                {
                   
                    q = Server.UrlDecode(q);
                    SqlDataSource1.SelectCommand = " SELECT Sejur.id_sejur as IdSejur, Sejur.nume, Sejur.descriere, Sejur.pret, Sejur.imagine, Sejur.data_in, Sejur.data_out, Sejur.locuri_disp, Hotel.stele, Facilitati.restaurant, Facilitati.bar, Facilitati.piscina, Facilitati.loc_joaca, Facilitati.wifi, Facilitati.minibar, Facilitati.televizor, Facilitati.telefon, Facilitati.transport, Facilitati.ingrijire_medicala FROM Sejur, Hotel, Facilitati WHERE Sejur.id_sejur = @q and Hotel.id_hotel=Sejur.id_hotel and Hotel.id_hotel = Facilitati.id_hotel";
                    SqlDataSource1.SelectParameters.Clear();
                    SqlDataSource1.SelectParameters.Add("q", q);
                    SqlDataSource1.DataBind();

                    
                    sqlVerif = "Select count(*) from Oferta_vizite where id_oferta=@q";
                    SqlConnection con6 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con6.Open();
                    SqlCommand com6 = new SqlCommand(sqlVerif, con6);
                    com6.Parameters.AddWithValue("q", q);
                    int userCount = (int)com6.ExecuteScalar();
                    con6.Close();
                    Response.Write(userCount);
                    if (userCount > 0)
                    {
                        string sql1 = "update Oferta_vizite set nr_vizite=nr_vizite+1";
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        con.Open();
                       SqlCommand com7 = new SqlCommand(sql1, con);
                        com7.Parameters.AddWithValue("q", q);
                        com7.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {
                        int vizit = 1;
                        string sql2 = "Insert INTO Oferta_vizite (id_oferta, nr_vizite) VALUES (@q, @vizit)";
                        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                        con.Open();
                        SqlCommand com8 = new SqlCommand(sql2, con);
                        com8.Parameters.AddWithValue("q", q);
                        com8.ExecuteNonQuery();
                        con.Close();
                    }

                    nume2 = Session["USER_ID"].ToString();
                    if (nume2 != null)
                    {

                        rezerva.Visible = true;
                        text_locuri.Visible = true;
                        nr_loc.Visible = true;
                    }
    
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

    protected void rezerva_buton(object sender, EventArgs e)
    {
        string q = Request.Params["q"];
        q = Server.UrlDecode(q);
        string nume = Session["USER_ID"].ToString();
        
        int temp = 0;
        int loc_rez = 0;

        /*
        Button img = (Button)sender;
        DataListItem item = (DataListItem)img.NamingContainer;    

        if (item != null)
        {
            
            int itemIndex = item.ItemIndex;
            var replyText = ((TextBox)this.DataList1.Items[item.ItemIndex].FindControl("nr_loc")).Text;
            loc_rez = Convert.ToInt32(replyText);
        }
        */
        loc_rez = Convert.ToInt32(nr_loc.Text);
        string cmdText4 = "select locuri_disp from Sejur where id_sejur=@q";
        using (SqlConnection con4 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            
            con4.Open();
            using (SqlCommand cmd = new SqlCommand(cmdText4, con4))
            {
                cmd.Parameters.AddWithValue("@q", q);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        temp = Convert.ToInt32(reader.GetValue(0));
                    }
                } 
            }
         
           
            temp = temp - loc_rez;
        }
        if (temp > 0)
        {


            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            string update = "update Sejur set locuri_disp=@loc where id_sejur=@q";
            SqlCommand com = new SqlCommand(update, con);
            com.Parameters.AddWithValue("@loc", temp);
            com.Parameters.AddWithValue("@q", q);
            com.ExecuteNonQuery();
            con.Close();
            nume = Session["USER_ID"].ToString();
            Guid userId = Guid.NewGuid();

            string cmdText5 = "select UserId from aspnet_Membership where username='"+nume+"'";
            using (SqlConnection con5 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {

                con5.Open();
                using (SqlCommand cmd2 = new SqlCommand(cmdText5, con5))
                {

                    using (SqlDataReader reader = cmd2.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            userId= (Guid)reader.GetValue(0);
                        }
                    }
                }
            }

            SqlConnection con3 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con3.Open();
            string insert = "insert into SejururiUseri (id_sejur,id_Client,locuri_rezervate) values (@id_s,@id_cl,@loc_r)";
            SqlCommand com3 = new SqlCommand(insert, con3);
            com3.Parameters.AddWithValue("@id_s", q);
            com3.Parameters.AddWithValue("@id_cl",userId);
            com3.Parameters.AddWithValue("@loc_r", loc_rez);
            com3.ExecuteNonQuery();
            con3.Close();

           Response.Redirect(Request.RawUrl);
        }
        else
        {
            Response.Write("Numar insuficient de locuri");
        }
    }
}