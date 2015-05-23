using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaginaTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            try
            {
                string nume = Session["USER_ID"].ToString();
                if (nume != null)
                {
                    SqlDataSource1.SelectCommand = "";
                    SqlDataSource1.DataBind();
                }
            }
            catch (Exception err)
            { 
            }
        }
    }
}