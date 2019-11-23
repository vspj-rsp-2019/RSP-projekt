using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Uzaverky : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_aktDatum.Text = DateTime.Now.ToShortDateString();
    }

    //zobrazi tabulku vsech uzaverek casopisu, skryje tlacitko zobrazeni a zobrazi tlacitko pro skryti
    protected void btn_zobrUzaverky_Click(object sender, EventArgs e)
    {
       GridView2.Visible = true;
        btn_zobrUzaverky.Visible = false;
        brn_skrytUz.Visible = true;
    }

    // skryje tabulku vsech uzaverek, skryje tlacitko a zobrazi zobrazujici tlacitko


    protected void brn_skrytUz_Click(object sender, EventArgs e)
    {
       GridView2.Visible = false;
        brn_skrytUz.Visible = false;
        btn_zobrUzaverky.Visible = true;
    }
}