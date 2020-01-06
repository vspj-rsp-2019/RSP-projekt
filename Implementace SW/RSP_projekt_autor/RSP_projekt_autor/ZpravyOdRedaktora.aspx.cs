using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class ZpravyOdRedaktora : System.Web.UI.Page
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
        if (user.Role != "recenzent")
        {
            Response.Redirect("ChybaOpravneni.aspx");
        }
    }

    /*
     * Pokud dojde k výběru některého z řádků tabulky pro zobrazení zpráv zaslaných recenzentovi redaktorem,
     * upraví se odpovídajícím způsobem formulářová okna obsahující text redaktora a případnou recenzentovu odpověď.
     */
    protected void GV_zpravyRedaktora_SelectedIndexChanged(object sender, EventArgs e)
    {
        Lbl_status.Text = " ";

        SqlDataAdapter da = new SqlDataAdapter("select * from ZpravyRecenzentum where Id='" + GV_zpravyRedaktora.SelectedRow.Cells[0].Text + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        TB_textRedaktora.Text = dt.Rows[0][1].ToString();
        TB_textRecenzenta.Text = dt.Rows[0][2].ToString();
        Lbl_zpravaOdpovezena.Text = dt.Rows[0][6].ToString();

        if (Lbl_zpravaOdpovezena.Text == "True")
        {
            TB_textRecenzenta.ReadOnly = true;
        }
        else
        {
            TB_textRecenzenta.ReadOnly = false;
        }
    }

    /*
     * Zkontroluje vyplnění a výběr potřebných  údajů a pošle odpověď redaktorovi na jeho zprávu.
     */
    protected void Btn_poslatOdpoved_Click(object sender, EventArgs e)
    {
        if (Lbl_zpravaOdpovezena.Text == "True")
        {
            Lbl_status.Text = "Na zprávu redaktora jste již odpověděli!";
        }
        else
        {
            if ((GV_zpravyRedaktora.SelectedIndex >= 0) && (TB_textRecenzenta.Text.Length > 1))
            {
                sql = "update ZpravyRecenzentum set ZpravaRecenzenta=@zpravaRecenzenta, ZpravaRecenzentaDatum=@zpravaRecenzentaDatum, Odpovezeno='true' where Id=@Id";
                try
                {
                    con.Open();
                    sqlCmd = new SqlCommand(sql, con);
                    string aktualniDatum = DateTime.Now.ToString("yyyy-MM-dd");

                    sqlCmd.Parameters.AddWithValue("@zpravaRecenzenta", TB_textRecenzenta.Text);
                    sqlCmd.Parameters.AddWithValue("@zpravaRecenzentaDatum", aktualniDatum);
                    sqlCmd.Parameters.AddWithValue("@Id", GV_zpravyRedaktora.SelectedRow.Cells[0].Text);
                    sqlCmd.ExecuteNonQuery();
                    sqlCmd.Dispose();
                    con.Close();
                    Lbl_status.Text = "Zpráva poslána.";
                    TB_textRecenzenta.ReadOnly = true;
                    GV_zpravyRedaktora.DataBind();
                }
                catch (Exception ex)
                {
                    Lbl_status.Text = ex.ToString();
                }
            }
            else
            {
                Lbl_status.Text = "Některá z hodnot nebyla vybrána!";
            }
        }
    }
}