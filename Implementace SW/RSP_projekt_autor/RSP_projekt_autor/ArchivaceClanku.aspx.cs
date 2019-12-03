using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/*
 * Trida pro zobrazeni verzi clanku v jednotlivych vydanich a pridavani schvalenech verzi clanku do archivu a zpet 
 */
public partial class ArchivaceClanku : System.Web.UI.Page
{
    // Vytvori pripojeni k databazi 
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlCommand sqlCmd;
    string sql = null;
    User user;

    /*
     * Při načtení stránky dojde ke kontrole, jestli je uživatel přihlášen a má oprávnění pro zobrazení stránky.
     * Pokud není příhlášen nebo nemá oprávnění, dojde k přesměrování stránky.
     */
    protected void Page_Load(object sender, EventArgs e)
    {
        user = (User)Session["userObject"];
        if (user == null)
        {
            Response.Redirect("login.aspx");
        }
        if (user.Role != "redaktor" && user.Role != "admin")
        {
            Response.Redirect("ChybaOpravneni.aspx");
        }
    }

    /*
     * Vlozi clanky ve stavu 'schvalene' do archivu
     */
    protected void Btn_archivovatClanky_Click(object sender, EventArgs e)
    {
        sql = "UPDATE Clanky SET status_clanek = 8 WHERE vydani_id = @vydaniId AND status_clanek = @statusId";
        try
        {
            con.Open();
            sqlCmd = new SqlCommand(sql, con);
            sqlCmd.Parameters.AddWithValue("@vydaniId", DDL1_vydani.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@statusId", 6); // 6 = clanek schvalen
            sqlCmd.ExecuteNonQuery();
            sqlCmd.Dispose();
            con.Close();
            Lb_stav.Visible = true;
            GridView1.DataBind();
            Lb_stav.Text = "Upravy provedeny.";
        }
        catch (Exception)
        {
            Lb_stav.Text = "Upravy neprovedeny.";
            Lb_stav.Visible = true;
        }
    }

    /*
     * Vrati clanky ve stavu 'archivovane' zpet do stavu schvalene
     */
    protected void Btn_vyjmoutZarchivu_Click(object sender, EventArgs e)
    {
        sql = "UPDATE Clanky SET status_clanek = @statusId WHERE Id = @clanekId AND status_clanek = 8";
        try
        {
            con.Open();
            sqlCmd = new SqlCommand(sql, con);
            sqlCmd.Parameters.AddWithValue("@clanekId", GridView1.SelectedValue);
            sqlCmd.Parameters.AddWithValue("@statusId", 6); // 6 = clanek schvalen
            sqlCmd.ExecuteNonQuery();
            sqlCmd.Dispose();
            con.Close();
            Lb_stav.Visible = true;
            GridView1.DataBind();
            Lb_stav.Text = "Upravy provedeny.";
        }
        catch (Exception)
        {
            Lb_stav.Text = "Upravy neprovedeny.";
            Lb_stav.Visible = true;
        }
    }

    /*
     * Pri zmene dropdown listu se stavy clanku nastavi hodnotu labelu s hlasenim na prazdnou
     */
    protected void DDL_stavClanku_SelectedIndexChanged(object sender, EventArgs e)
    {
        Lb_stav.Text = "";
    }

    /*
     * Pri zmene dropdown listu s vydanimi clanku nastavi hodnotu labelu s hlasenim na prazdnou
     */
    protected void DDL1_vydani_SelectedIndexChanged1(object sender, EventArgs e)
    {
        Lb_stav.Text = "";
    }
}