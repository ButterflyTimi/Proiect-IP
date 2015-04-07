using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class AdmUserC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Params["UserId"] != null && !IsPostBack)
        {
            Guid Id = Guid.Parse(Request.Params["UserId"]);
            //string Id = Request.Params["UserId"].ToString();
            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ASPNETDB.MDF;Integrated Security=True;User Instance=True");
            con.Open();
            String sql = "SELECT UserId,UserName FROM aspnet_Membership WHERE UserId=@Id";

            SqlCommand command = new SqlCommand(sql, con);
            command.Parameters.AddWithValue("@Id",Id);


            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                UserIdL.Text = reader["UserId"] + "";
                UserNameL.Text = reader["UserName"] + "";
            }
            con.Close();
        
        }

    }
    protected void DeleteB_Click(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Guid Id = Guid.Parse(Request.Params["UserId"]);
            UserNameL.Text = Id.ToString();
        }
        if (Request.Params["UserId"] != null && IsPostBack)
        {

            Guid Id = Guid.Parse(Request.Params["UserId"]);

            SqlConnection con = new SqlConnection("Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\ASPNETDB.MDF;Integrated Security=True;User Instance=True");
            con.Open();

            String sql = "DELETE FROM aspnet_Membership WHERE UserId=@Id";

            SqlCommand command = new SqlCommand(sql, con);
            command.Parameters.AddWithValue("@Id", Id);
            command.ExecuteNonQuery();
            con.Close();
            Response.Redirect("~/AdmUsers.aspx");
        }
    }
}