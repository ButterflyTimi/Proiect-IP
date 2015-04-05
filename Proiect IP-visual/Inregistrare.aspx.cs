using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;


public partial class Inregistrare : System.Web.UI.Page
{
    int temp1;
    int temp2;
    string verif_email;
    string verif_user;
    protected void Page_Load(object sender, EventArgs e)
    {
        ResponseLogin.Visible = false;
        if (Session["USER_ID"] != null)
        {
            Response.Redirect("Home.aspx");
        }
        if (IsPostBack)
        {

           /* SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            verif_user = "select count(*) from aspnet_Membership where username='" + user_name.Text + "'";
            SqlCommand com = new SqlCommand(verif_user, con);
            temp1 = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp1 == 1)
            {
                Response.Write("User name existent");
            }
            verif_email = "select count(*) from aspnet_Membership where Email='" + email.Text + "'";
            com = new SqlCommand(verif_user, con);
            temp2 = Convert.ToInt32(com.ExecuteScalar().ToString());
            if (temp2 == 1)
            {
                Response.Write("Email existent");
            }

            con.Close(); */
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {

            Guid newGUID = Guid.NewGuid();
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            verif_user = "select count(*) from aspnet_Membership where username='" + user_name.Text + "'";
            SqlCommand com2 = new SqlCommand(verif_user, con);
            temp1 = Convert.ToInt32(com2.ExecuteScalar().ToString());
            verif_email = "select count(*) from aspnet_Membership where Email='" + email.Text + "'";
            com2 = new SqlCommand(verif_user, con);
            temp2 = Convert.ToInt32(com2.ExecuteScalar().ToString());
            if ((temp1 != 1) || (temp2 != 1))
            {
                string insert = "insert into aspnet_Membership (UserId,username,Email,Password) values (@uid,@uname, @email, @parola)";
                SqlCommand com = new SqlCommand(insert, con);
                com.Parameters.AddWithValue("@uid", newGUID.ToString());
                com.Parameters.AddWithValue("@uname", user_name.Text);
                com.Parameters.AddWithValue("@email", email.Text);
                com.Parameters.AddWithValue("@parola", parola.Text);

                com.ExecuteNonQuery();
                Session["USER_ID"] = user_name.Text;
                string URL ="Profil_utilizator.aspx?q="+user_name.Text;
                Response.Redirect(URL);
                Response.Write("Inregistrare reusita");

                
            }
            else if (temp1 == 1)
            {
                ResponseLogin.Visible = true;
                ResponseLogin.Text = "Username folosit!";
                //Response.Write("Username folosit"); 
            }
            else
            {
                ResponseLogin.Visible = true;
                ResponseLogin.Text = "Exista deja un cont pe acest email!";
                //Response.Write("Exista deja un cont pe acest email");
            }
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.ToString());
        }

    }
}