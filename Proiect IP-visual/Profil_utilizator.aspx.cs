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
        if (!Page.IsPostBack)
        {
            string q = Request.Params["q"];
            if (q != null)
            {
                try
                {
                    q = Server.UrlDecode(q);
                    usernamevechibox.Text = q;

                }
                catch (Exception err)
                {
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
        string rd1=null, rd2=null, rd3=null, rd4=null, rd5=null;
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
        }
        else if (doi.Checked)
        {
            rd4 = doi.Text;
        }
        else if (trei.Checked)
        {
            rd4 = trei.Text;
        }
        else if (patru.Checked)
        {
            rd4 = patru.Text;
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
            Response.Write("Completeaza toate campurile");
        }
        else if (nume == null)
        {
            Response.Write("Introdu username-ul folosit");
        }
        else
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            string insert = "update aspnet_Membership set Forma_turism=@turism, Durata_sejur=@dsejur, Suma_sejur=@ssejur, Nivel_hotel=@hotel where username='"+usernamevechibox.Text+"'";
            SqlCommand com = new SqlCommand(insert,con);

            com.Parameters.AddWithValue("@turism", rd2);
            com.Parameters.AddWithValue("@dsejur", rd3);
            com.Parameters.AddWithValue("@ssejur", rd4);
            com.Parameters.AddWithValue("@hotel", rd5);

            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Home.aspx");
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
            Response.Write("Nu exista acest username");
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
                Response.Write("Exista deja acest username. Alege te rog altul!");
            }
            else
            {
                con.Open();
                string updatat = "update aspnet_Membership set username = @unamenou where username = @unamevechi";
                SqlCommand com2 = new SqlCommand(updatat, con);
                com2.Parameters.AddWithValue("@unamevechi", usernamevechibox.Text);
                com2.Parameters.AddWithValue("@unamenou", usernamenoubox.Text);

                com2.ExecuteNonQuery();
                Response.Write("Update reusit");
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
            Response.Write("Nu exista acest username");
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
            Response.Write("Update reusit");
            con.Close();

        }
    }
}
