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
            LoginL.Text = Session["USER_ID"].ToString();
            LoginL.Visible = true;
            LoginHL.Visible = false;
        }
        else
        {
            LoginL.Visible = false;
            LoginHL.Visible = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
