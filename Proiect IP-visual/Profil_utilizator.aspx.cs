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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string userId = Membership.GetUser().ProviderUserKey.ToString();
        string popnume = "select username from aspnet_Membership where UserId = '" + userId + "'";
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand com3 = new SqlCommand(popnume, conn);
        SqlDataReader reader = com3.ExecuteReader();
        while (reader.Read())
        {
            usernamevechibox.Text = reader.GetValue(0).ToString();
        }

        conn.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void username_Click(object sender, EventArgs e)
    {
        string userId = Membership.GetUser().ProviderUserKey.ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        con.Open();
       
        string verif_user = "select count(*) from aspnet_Membership where username='" + usernamevechibox.Text + "'";
        SqlCommand com = new SqlCommand(verif_user, con);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        con.Close();
        if (temp != 1)
        {
            Response.Write("Nu exista acest username");
        }
        else
        {
            

            string updatat = "update aspnet_Membership set username=@unamenou where UserId = '"+userId+"'";
            SqlCommand com2 = new SqlCommand(updatat, con);
            
            com.Parameters.AddWithValue("@unamenou", usernamenoubox.Text);

            com.ExecuteNonQuery();
            Response.Write("Update reusit");
        }
        con.Close();
    }
}