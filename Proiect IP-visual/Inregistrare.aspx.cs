using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Inregistrare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            string verif_user = "select count(*) from aspnet_Membership where username='" + user_name.Text + "'";
            SqlCommand com = new SqlCommand(verif_user, con);
            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp == 1)
            {
                Response.Write("User name existent");
            }
            string verif_email = "select count(*) from aspnet_Membership where Email='" + email.Text + "'";
            com = new SqlCommand(verif_user, con);
            int temp2 = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp2 == 1)
            {
                Response.Write("Email existent");
            }

            con.Close();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            Guid newGUID = Guid.NewGuid();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            string insert = "insert into aspnet_Membership (UserId,username,Email,Password) values (@uid,@uname, @email, @parola)";
            SqlCommand com = new SqlCommand(insert, con);
            com.Parameters.AddWithValue("uid", newGUID.ToString());
            com.Parameters.AddWithValue("@uname", user_name.Text);
            com.Parameters.AddWithValue("@email", email.Text);
            com.Parameters.AddWithValue("@parola", parola.Text);

            com.ExecuteNonQuery();
           // Response.Redirect("Home.aspx");
            Response.Write("Inregistrare reusita");
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.ToString());
        }

    }
}