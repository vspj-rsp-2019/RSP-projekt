using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BT_login_Click(object sender, EventArgs e)
    {
     
        DBHandler dbHandler = new DBHandler(@"Data Source=(LocalDB)\MSSQLLocalDB;
                                        AttachDbFilename=|DataDirectory|\Database.mdf;
                                        Integrated Security=True;Connect Timeout=30");
        User user = dbHandler.loginUser(TB_email.Text, TB_heslo.Text);

        if (user != null)
        {
            Response.Write("<script>alert('login probehl uspesne')</script>");
            Session["userObject"] = user;
            Session["UserId"] = user.id;
            if(user.Role == "autor") {
                Response.Redirect("mojeClanky.aspx");
            }
            if (user.Role == "redaktor")
            {
                Response.Redirect("PrideleniRecenzi.aspx");
            }

        }
        else
        {
            LB_error.Text = "Nesedí heslo nebo login";
        }
    }
}