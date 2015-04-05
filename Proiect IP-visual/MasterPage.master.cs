using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USER_ID"] != null)
        {
            LoginL.Text = "Bine ai venit, " + Session["USER_ID"].ToString() +"!";
            LoginL.Visible = true;
            LoginHL.Visible = false;
            SignUp.Visible = false;
            LogoutHL.Visible = true;
            LinkProfil.NavigateUrl = "~/Profil_utilizator.aspx?q=" + Session["USER_ID"].ToString();
        }
        else
        {
            LoginL.Visible = false;
            LogoutHL.Visible = false;
            LoginHL.Visible = true;
            SignUp.Visible = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
