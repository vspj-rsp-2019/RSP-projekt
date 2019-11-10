using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage


{
    User user;
    DBHandler dbHandler = new DBHandler(@"Data Source=(LocalDB)\MSSQLLocalDB;
                                        AttachDbFilename=|DataDirectory|\Database.mdf;
                                        Integrated Security=True;Connect Timeout=30");
    protected void Page_Load(object sender, EventArgs e)
    {
        //kontrola na prihlaseneho uzivatele
        user = (User)Session["userObject"];
        if (user == null)
        {
            // pokud neni prihlasen, menu nebude zobrazeno
            Menu1.Visible = false;
        }
        else
            //lb_userName.Text = "přihlášený uživatel";
            lb_userName.Text = " Login:  " + user.Prijmeni + " " + user.Jmeno;


    }
}
