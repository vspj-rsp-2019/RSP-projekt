using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Odhlaseni : System.Web.UI.Page


{

    User user;
    DBHandler dbHandler = new DBHandler(@"Data Source=(LocalDB)\MSSQLLocalDB;
                                        AttachDbFilename=|DataDirectory|\Database.mdf;
                                        Integrated Security=True;Connect Timeout=30");

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_odhlaseni_Click(object sender, EventArgs e)
    {
        //odhlaseni uzivatele a presmerovani na login page
        Session.Abandon();
        Response.Redirect("login.aspx");
    }
}