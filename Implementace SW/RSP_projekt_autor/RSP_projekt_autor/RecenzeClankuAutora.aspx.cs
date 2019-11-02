using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Default2 : System.Web.UI.Page
{

    // Vytvori pripojeni k databazi 
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;Connect Timeout=30");


    protected void Page_Load(object sender, EventArgs e)
    {
        // po nacteni  stranky zobrazi do tabulky vsechny autorovy clanky
        zobrazVsechnyClanky();
    }

    /*
     * Zobrazi vsechny clanky, ktere prihlaseny autor napsal
     */
    void zobrazVsechnyClanky()
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from Clanky, Vydani where Clanky.vydani_id = Vydani.Id AND autor_id='" + Session["UserId"].ToString() + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        gv_recenze.DataSource = dt;
        gv_recenze.DataBind();
    }


    /*
     * Vyhleda odpovidajici clanky podle zadaneho nazvu clanku a nazvu vydani
     */
    protected void Btn1_hledat_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter("select * from Clanky, Vydani where Clanky.vydani_id = Vydani.Id AND Clanky.nazev like '" + Tb1_nazevClanku.Text + "%' AND autor_id='" + Session["UserId"].ToString() + "' AND Vydani.Name='" + DDL1_vydani.Text + "'", con);
        da.Fill(dt);
        gv_recenze.DataSource = dt;
        gv_recenze.DataBind();
    }

    /*
     * Zobrazi vsechny autorovy clanky a vymaze text z pole pro vyhledavani podle nazvu clanku
     */
    protected void Btn2_resetHledani_Click(object sender, EventArgs e)
    {
        zobrazVsechnyClanky();
        Tb1_nazevClanku.Text = "";
    }


    /*
     * Stahne recenzi ke clanku ve formatu PDF
     * Ocekava cestu k souboru v podobe "~/Recenze/xyz.pdf"
     */
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton linkdownload = sender as LinkButton;
        GridViewRow gridrow = linkdownload.NamingContainer as GridViewRow;
        string downloadfile = GridView1.DataKeys[gridrow.RowIndex].Value.ToString();
        Response.ContentType = "application/pdf";
        Response.AddHeader("Content-Disposition", "attachment;filename=\"" + downloadfile + "\"");
        Response.TransmitFile(Server.MapPath(downloadfile));
        Response.End();
    }
}