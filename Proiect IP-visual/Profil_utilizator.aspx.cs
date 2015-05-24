using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

public partial class Profil_utilizator : System.Web.UI.Page
{
    int sum_min ;
    int sum_max ;

    protected void Page_Load(object sender, EventArgs e)
    {
        message.Visible = false;
        if (!Page.IsPostBack)
        {
            string q = Request.Params["q"];
            if (q != null)
            {
                try
                {
                    q = Server.UrlDecode(q);
                    usernamevechibox.Text = q;
                    
                    string temp = string.Empty;
        string cmdText = "select Forma_turism from aspnet_Membership where username='" + usernamevechibox.Text + "'";
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con.Open();
            using (SqlCommand cmd = new SqlCommand(cmdText, con))
            {
                
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        temp = reader.GetValue(0).ToString(); 
                    }
                }
            }
            if (temp.Equals("Sportiv"))
            {
                Sportiv.Checked = true;
            }
            else if (temp.Equals("Recreere"))
            {
                Recreere.Checked = true;
            }
            else if (temp.Equals("Cultural"))
            {
                Cultural.Checked = true;
            }
            else
            {
                Ingrijire_Sanatate.Checked = true;
            }
            
            con.Close();
        }
            string temp2 = string.Empty;
        string cmdText2 = "select Durata_sejur from aspnet_Membership where username='" + usernamevechibox.Text + "'";
        using (SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con2.Open();
            using (SqlCommand cmd = new SqlCommand(cmdText2, con2))
            {
                
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        temp2 = reader.GetValue(0).ToString(); 
                    }
                }
            }
        
                    if (temp2 == "2-3 zile")
                    {
                        scurta.Checked = true;
                    }
                    else if (temp2 == "4-5 zile")
                    {
                        medie.Checked = true;
                    }
                    else
                    {
                        lunga.Checked = true;
                    }
            
            con2.Close();
        }
            string temp3 = string.Empty;
            
        string cmdText3 = "select Suma_sejur from aspnet_Membership where username='" + usernamevechibox.Text + "'";
        using (SqlConnection con3 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con3.Open();
            using (SqlCommand cmd = new SqlCommand(cmdText3, con3))
            {
                
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        temp3 = reader.GetValue(0).ToString(); 
                    }
                }
            }
           
                    if (temp3 == "sub 100 euro")
                    {
                        unu.Checked = true;
                        
                    }
                    else if (temp3 == "100-200 euro")
                    {
                        doi.Checked = true;
                       
                    }
                    else if (temp3 == "200-300 euro")
                    {
                        trei.Checked = true;
                        
                    }
                    else
                    {
                        patru.Checked=true;
                        
                    }
            
            
            con3.Close();
           
            string temp4 = string.Empty;
        string cmdText4 = "select Nivel_hotel from aspnet_Membership where username='" + usernamevechibox.Text + "'";
        using (SqlConnection con4 = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            con4.Open();
            using (SqlCommand cmd = new SqlCommand(cmdText4, con4))
            {
                
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        temp4 = reader.GetValue(0).ToString(); 
                    }
                }
            }
        
           
                    if (temp4=="2 stele")
                    {
                        first.Checked = true;
                    }
                    else if (temp4== "3 stele")
                    {
                        second.Checked = true;
                    }
                    else if (temp4== "4 stele")
                    {
                        third.Checked = true;
                    }
                    else
                    {
                        fourth.Checked = true;
                    }

            
            con4.Close();
        }
        }
                                          
               }
                catch (Exception err)
                {
                    Response.Write(err);
                }
            }
            else
            {
                Response.Redirect("~/Inregistrare.aspx");
            }
        }
    }
    
    
     
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            string rd2 = null, rd3 = null, rd4 = null, rd5 = null;
            int test = 0;
            string nume = usernamevechibox.Text;
            if (Sportiv.Checked)
            {
                rd2 = Sportiv.Text;
            }
            else if (Recreere.Checked)
            {
                rd2 = Recreere.Text;
            }
            else if (Cultural.Checked)
            {
                rd2 = Cultural.Text;
            }
            else if (Ingrijire_Sanatate.Checked)
            {
                rd2 = Ingrijire_Sanatate.Text;
            }
            else
            {

                test += 1;
            }

            if (scurta.Checked)
            {
                rd3 = scurta.Text;
            }
            else if (medie.Checked)
            {
                rd3 = medie.Text;
            }
            else if (lunga.Checked)
            {
                rd3 = lunga.Text;
            }
            else
            {

                test += 1;
            }

            if (unu.Checked)
            {
                rd4 = unu.Text;
                sum_max = 100;
            }
            else if (doi.Checked)
            {
                rd4 = doi.Text;
                sum_min = 101;
                sum_max = 200;
            }
            else if (trei.Checked)
            {
                rd4 = trei.Text;
                sum_min = 201;
                sum_max = 300;
            }
            else if (patru.Checked)
            {
                rd4 = patru.Text;
                sum_min = 301;
                sum_max = 999;
            }
            else
            {

                test += 1;
            }
            if (first.Checked)
            {
                rd5 = first.Text;
            }
            else if (second.Checked)
            {
                rd5 = second.Text;
            }
            else if (third.Checked)
            {
                rd5 = third.Text;
            }
            else if (fourth.Checked)
            {
                rd5 = fourth.Text;
            }
            else
            {

                test += 1;
            }

            if (test == 4)
            {
                message.Visible = true;
                message.InnerHtml = "Completeaza toate campurile";
                //Response.Write("Completeaza toate campurile");
            }
            else if (nume == null)
            {
                //Response.Write("Introdu username-ul folosit");
                message.Visible = true;
                message.InnerHtml = "Introdu username-ul folosit";
            }
            else
            {
                string temp = null;
                string q = Request.Params["q"];
                q = Server.UrlDecode(q);

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();

                string insert = "update aspnet_Membership set Forma_turism=@turism, Durata_sejur=@dsejur, Suma_sejur=@ssejur, Nivel_hotel=@hotel where username='" + usernamevechibox.Text + "'";

                SqlCommand com = new SqlCommand(insert, con);

                com.Parameters.AddWithValue("@turism", rd2);
                com.Parameters.AddWithValue("@dsejur", rd3);
                com.Parameters.AddWithValue("@ssejur", rd4);
                com.Parameters.AddWithValue("@hotel", rd5);

                com.ExecuteNonQuery();

                string getid = "Select UserId from aspnet_Membership where username ='" + usernamevechibox.Text + "'";
                using (SqlCommand com2 = new SqlCommand(getid, con))
                {

                    using (SqlDataReader reader = com2.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            temp = reader.GetValue(0).ToString();
                            Response.Write(temp);
                        }
                    }

                }
                int unit = 1;
                string stele_rec = "insert into Recomandari (id_user,stele,nr_vizite,suma_min,suma_max) values (@q,@stele,@nr,@min,@max)";
                SqlCommand com3 = new SqlCommand(stele_rec, con);
                com3.Parameters.AddWithValue("@q", temp);
                com3.Parameters.AddWithValue("@stele", Convert.ToDouble(rd5));
                com3.Parameters.AddWithValue("@nr", unit);
                com3.Parameters.AddWithValue("@min", sum_min);
                com3.Parameters.AddWithValue("@max", sum_max);

                com3.ExecuteNonQuery();
                con.Close();
                Response.Redirect("Home.aspx");



            }
        }
        catch (Exception err)
        {
            Response.Write(err);
        }
    }
    protected void username_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();

        string verif_user = "select count(*) from aspnet_Membership where username='" + usernamevechibox.Text + "'";
        SqlCommand com = new SqlCommand(verif_user, con);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        con.Close();
        if (temp != 1)
        {
            message.Visible = true;
            message.InnerHtml = "Nu exista acest username";
            //Response.Write("Nu exista acest username");
        }
        else
        {

            con.Open();
            string getuser = "select count(*) from aspnet_Membership where username='" + usernamenoubox.Text + "'";
            SqlCommand com3 = new SqlCommand(getuser, con);
            int temp2 = Convert.ToInt32(com3.ExecuteScalar().ToString());
            con.Close();
            if (temp2 == 1)
            {
                //Response.Write("Exista deja acest username. Alege te rog altul!");
                message.Visible = true;
                message.InnerHtml = "Exista deja acest username. Alege te rog altul!";
            }
            else
            {
                con.Open();
                string updatat = "update aspnet_Membership set username = @unamenou where username = @unamevechi";
                SqlCommand com2 = new SqlCommand(updatat, con);
                com2.Parameters.AddWithValue("@unamevechi", usernamevechibox.Text);
                com2.Parameters.AddWithValue("@unamenou", usernamenoubox.Text);

                com2.ExecuteNonQuery();
                //Response.Write("Actualizare realizata cu succes!");
                message.Visible = true;
                message.InnerHtml = "Actualizare realizata cu succes!";
                con.Close();

            }

        }
    }
    protected void parola_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();

        string verif_user = "select count(*) from aspnet_Membership where username='" + usernamevechibox.Text + "' and Password ='" + parolavechebox.Text + "'";
        SqlCommand com = new SqlCommand(verif_user, con);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        con.Close();
        if (temp != 1)
        {
            //Response.Write("Nu exista acest nume de utilizator");
            message.Visible = true;
            message.InnerHtml = "Nu exista acest nume de utilizator";
        }
        else
        {
            con.Open();
            string updatat = "update aspnet_Membership set Password = @parolanoua where username = @unamevechi";
            SqlCommand com2 = new SqlCommand(updatat, con);
            com2.Parameters.AddWithValue("@parolaveche", parolavechebox.Text);
            com2.Parameters.AddWithValue("@parolanoua", parolanouabox.Text);
            com2.Parameters.AddWithValue("@unamevechi", usernamevechibox.Text);

            com2.ExecuteNonQuery();
            //Response.Write("Actualizare realizata cu succes!");
            message.Visible = true;
            message.InnerHtml = "Actualizare realizata cu succes!";
            con.Close();

        }
    }
}
