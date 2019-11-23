using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VyhledatClanek : System.Web.UI.Page


{

    User user;
    DBHandler dbHandler = new DBHandler(@"Data Source=(LocalDB)\MSSQLLocalDB;
                                        AttachDbFilename=|DataDirectory|\Database.mdf;
                                        Integrated Security=True;Connect Timeout=30");
    protected void Page_Load(object sender, EventArgs e)
    {
        //kontrola na přihlášeného uživatele
        user = (User)Session["userObject"];
        if (user == null)
        {
            Response.Redirect("login.aspx");
        }

    }
    // vyhledani clanku dle id clanku
    protected void btn_vyhledat_Click(object sender, EventArgs e)
    {

        try
        {
            GridView1.Visible = true;
            //  tb_IDclanek.Text = "";
                     
        }

        catch (Exception ex)
        {
            //chybova hlaska kdyz je chyba
            lbl_chyba.Visible = true;
        }
       

    }
}