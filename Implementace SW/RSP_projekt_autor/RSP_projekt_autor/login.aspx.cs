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
            if(user.Role == "autor") {
                Response.Redirect("mojeClanky.aspx");
            }

        }
        else
        {
            Response.Write("<font color ='red'>Nesedí heslo nebo email</font>");
        }
    }
}