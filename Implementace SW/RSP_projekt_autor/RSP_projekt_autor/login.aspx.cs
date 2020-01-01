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
        DBHandler dbHandler = new DBHandler(@"Data Source = SQL5044.site4now.net; Initial Catalog = DB_A50E52_rsp019; User Id = DB_A50E52_rsp019_admin; Password=Voracek2019;");
        User user = dbHandler.loginUser(TB_email.Text, TB_heslo.Text);

        if (Session["UserId"] != null)
        {
            //v pripade prihlaseneho uzivatele neni k dispozici nove prihlaseni
            Ibl_User.Text = "Aktuálně jste přihlášen. Pro nové přihlášení se nejprve odhlaště!";
            
            TB_email.Enabled = false;
            TB_heslo.Enabled = false;
            BT_login.Enabled = false;
            

        }

    }

    protected void BT_login_Click(object sender, EventArgs e)
    {
     
        DBHandler dbHandler = new DBHandler(@"Data Source = SQL5044.site4now.net; Initial Catalog = DB_A50E52_rsp019; User Id = DB_A50E52_rsp019_admin; Password=Voracek2019;");
        User user = dbHandler.loginUser(TB_email.Text, TB_heslo.Text);

        if (user != null)
        {
            //Response.Write("<script>alert('login probehl uspesne')</script>");
            Session["userObject"] = user;
            Session["UserId"] = user.id;
            if(user.Role == "autor") {
                Response.Redirect("mojeClanky.aspx");
            }
            else
                //v pripade role redaktora - presmerovani na NoveClanky ke zpracovani.
            if (user.Role == "redaktor")
            {
                Response.Write("<script>alert('test')</script>");
                Response.Redirect("NoveClanky.aspx");
            }
            
            // v pripade recenzenta smerovano do vypracovani recenzi
            if (user.Role == "recenzent")
            {
                Response.Redirect("VypracovaniRecenze.aspx");
            }
            //  v pripade admina smerovano na admin page
            if (user.Role == "admin")
            {
                Response.Redirect("adminPage.aspx");
            }

            // ostatni na default stranku
            else Response.Redirect("Default.aspx");


        }
        else
        {
            LB_error.Text = "Nesedí heslo nebo login";
        }
    }
}