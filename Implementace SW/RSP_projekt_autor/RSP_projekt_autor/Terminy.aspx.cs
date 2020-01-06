using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Terminy : System.Web.UI.Page
{
    User user;
    DBHandler dbHandler = new DBHandler(@"Data Source = SQL5044.site4now.net; Initial Catalog = DB_A50E52_rsp019; User Id = DB_A50E52_rsp019_admin; Password=Voracek2019;");
    protected void Page_Load(object sender, EventArgs e)
    {
        //kontrola na prihlaseneho uzivatele
        user = (User)Session["userObject"];
        if (user == null)
        {
            Response.Redirect("login.aspx");
        }
        // zobrazeni aktualniho data na strance
        lbl_AktualDate.Text = DateTime.Now.ToShortDateString();
    }

    protected void Button2_Click(object sender, EventArgs e)
        // zobrazi tabulku vsech posudku, skryje tlacitko, zobrazi tlacitko pro skryti
    {
        GridView3.Visible = true;
        btn_zobrazVsechnyPosudky.Visible = false;
        btn_skryAllPosudky.Visible = true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //zobrazi tabulku vsech uzaverek casopisu, skryje tlacitko zobrazeni a zobrazi tlacitko pro skryti
        GridView4.Visible = true;
        btn_zobrazVsechnyUzaverky.Visible = false;
        btn_skrytAllUzaverky.Visible = true;
    }

    protected void btn_skryAllPosudky_Click(object sender, EventArgs e)
    {
        // skryje tabulku vsech posudku, skryje tlacitko a zobrazi zobrazujici tlacitko
        GridView3.Visible = false;
        btn_skryAllPosudky.Visible = false;
        btn_zobrazVsechnyPosudky.Visible = true;
    }

    protected void btn_skrytAllUzaverky_Click(object sender, EventArgs e)
    {
        // skryje tabulku vsech uzaverek, skryje tlacitko a zobrazi zobrazujici tlacitko
        GridView4.Visible = false;
        btn_skrytAllUzaverky.Visible = false;
        btn_zobrazVsechnyUzaverky.Visible = true;
    }
}