using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Autentificare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void login_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
        string verif_user = "select count(*) from aspnet_Membership where username='" + username.Text + "'";
        SqlCommand com = new SqlCommand(verif_user, con);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        con.Close();
        if (temp == 1)
        {
            con.Open();
            string verifpar = "select password from aspnet_Membership where username='" + username.Text + "'";
            SqlCommand parcom = new SqlCommand(verifpar, con);
            string parola = parcom.ExecuteScalar().ToString().Replace(" ", "");
            if (parola == parolabox.Text)
            {
                Session["USER_ID"] = username.Text;
                Response.Write("Parola corecta");
                Response.Redirect("Home.aspx");
            }
            else
            {
                Response.Write("Parola incorecta");
            }
            con.Close();
        }
        else
        {
            Response.Write("Username inexistent");
        }


    }
}