using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Odhlaseni : System.Web.UI.Page


{

    User user;
    DBHandler dbHandler = new DBHandler(@"Data Source = SQL5044.site4now.net; Initial Catalog = DB_A50E52_rsp019; User Id = DB_A50E52_rsp019_admin; Password=Voracek2019;");

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