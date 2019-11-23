using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Posudky : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // zobrazeni aktualniho data na strance
        lbl_akt_date.Text = DateTime.Now.ToShortDateString();
    }

    // zobrazi tabulku vsech posudku, skryje tlacitko, zobrazi tlacitko pro skryti


    protected void btn_zobrPos_Click(object sender, EventArgs e)
    {
        GridView2_VsechnyPos.Visible = true;
        btn_zobrPos.Visible = false;
        btn_skryt.Visible = true;

    }

    // skryje tabulku vsech posudku, skryje tlacitko a zobrazi zobrazujici tlacitko
    
    protected void btn_skryt_Click(object sender, EventArgs e)
    {
        GridView2_VsechnyPos.Visible = false;
        btn_skryt.Visible = false;
        btn_zobrPos.Visible = true;
    }
}