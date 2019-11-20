using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Recenze_ZpravyRecenzentum : System.Web.UI.Page
{
    // Vytvori pripojeni k databazi 
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
    SqlCommand sqlCmd;
    SqlDataAdapter adapter = new SqlDataAdapter();
    DataSet ds = new DataSet();
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
        if (user.Role != "redaktor")
        {
            Response.Redirect("ChybaOpravneni.aspx");
        }
    }

    /*
     * Pokud dojde k výběru některého z řádků tabulky pro zobrazení recenzentů,
     * upraví se odpovídajícím způsobem vstupní formulář pro komunikaci s recenzentem.
     */
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Lbl_recenzent.Text = GridView2.SelectedRow.Cells[0].Text;
        Lbl_status.Text = "";
        Lbl_prijmeni.Text = GridView2.SelectedRow.Cells[1].Text;
        Lbl_jmeno.Text = GridView2.SelectedRow.Cells[2].Text;
        TB_textRecenzenta.Text = "";
        TB_textRedaktora.Text = "";
    }

    /*
     * Zkontroluje vyplnění a výběr potřebných  údajů a pošle zprávu vybranému recenzentovi.
     */
    protected void Btn_posliZpravu_Click(object sender, EventArgs e)
    {
        if ((GridView2.SelectedIndex >= 0) && (Tb_zpravaRedaktora.Text.Length > 1))
        {
            sql = "insert into ZpravyRecenzentum (ZpravaRedaktora, ZpravaRedaktoraDatum, Recenzent_id)values(@zpravaRedaktora, @zpravaRedaktoraDatum, @recenzentId)";
            try
            {
                con.Open();
                sqlCmd = new SqlCommand(sql, con);
                string aktualniDatum = DateTime.Now.ToString("yyyy-MM-dd");

                sqlCmd.Parameters.AddWithValue("@zpravaRedaktora", Tb_zpravaRedaktora.Text);
                sqlCmd.Parameters.AddWithValue("@zpravaRedaktoraDatum", aktualniDatum);
                sqlCmd.Parameters.AddWithValue("@recenzentId", GridView2.SelectedRow.Cells[0].Text);

                sqlCmd.ExecuteNonQuery();

                sqlCmd.Dispose();
                con.Close();
                Lbl_status.Text = "Zpráva poslána.";
                Tb_zpravaRedaktora.Text = "";

            }
            catch (Exception)
            {
                Lbl_status.Text = "Něco se pokazilo!";
            }
        }
        else
        {
            Lbl_status.Text = "Některá z hodnot nebyla vybrána!";
        }
    }

    /*
     * Pokud dojde k výběru některého z řádků tabulky pro zobrazení zpráv pro recenzenty,
     * upraví se obsah formulářových oken pro zobrazení zprývy pro recenzenta a jeho odpovědi na zprávu.
     */
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select * from ZpravyRecenzentum where Id='" + GridView1.SelectedRow.Cells[0].Text + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        TB_textRedaktora.Text = dt.Rows[0][1].ToString();
        TB_textRecenzenta.Text = dt.Rows[0][2].ToString();
        Lbl_status.Text = "";
    }
}