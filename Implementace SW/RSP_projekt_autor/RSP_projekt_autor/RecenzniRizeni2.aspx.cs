using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class RecenzniRizeni2 : System.Web.UI.Page
{
    // Vytvori pripojeni k databazi 
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlCommand sqlCmd;
    string sql = null;
    string sql2 = null;
    string sql3 = null;
    User user;

    protected void Page_Load(object sender, EventArgs e)
    {
        user = (User)Session["userObject"];
        if (user == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    /*
     * Nastavi hodnotu vybranou v kalendari do pole (labelu) pro datum 
     */

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        lbl_zahRR.Text = Calendar1.SelectedDate.ToShortDateString();
    }

    protected void btn_odeslatDoZahajeni_Click(object sender, EventArgs e)
    {
        if ((GridView1.SelectedIndex >= 0) && (lbl_zahRR.Text.Length > 1))
        {
            if (DateTime.Now.Date > Calendar1.SelectedDate.Date)
            {
                lbl_zahRR.Text = "Vybrané datum je menší než aktuální!";
            }
            else
            {
               // aktualizuje tabulku články, přiřadí stav článku na zahájení RR, a vloží datum dle vybraného z kalendáře
               sql = "UPDATE Clanky SET status_clanek = 3, datum_zah_rec_riz = @datumZahajeniRR WHERE Id = @Id";
                try
                {
                    con.Open();
                    sqlCmd = new SqlCommand(sql, con);
                    sqlCmd.Parameters.AddWithValue("@Id", GridView1.SelectedValue);
                    sqlCmd.Parameters.AddWithValue("@datumZahajeniRR", Calendar1.SelectedDate.ToString("MM/dd/yyyy"));
                    sqlCmd.ExecuteNonQuery();
                    sqlCmd.Dispose();
                    con.Close();
                    lbl_potvrzeni.Text = "Status článku změněn";
                }
                catch (Exception)
                {
                    lbl_zahRR.Text = "Nepodařilo se přiřadit!";
                }
            }
        }
        else
        {
            lbl_zahRR.Text = "Některá z hodnot nebyla vybrána!";
        }
    }

    protected void btn_schvalit_Click(object sender, EventArgs e)
    {
        if ((GridView3.SelectedIndex >= 0))
            {

            sql2 = "UPDATE Clanky SET status_clanek = 6, datum_uk_rec_riz = @datumUkonceniRR WHERE Id = @Id";
            string Datum = DateTime.Now.ToString("yyyy-MM-dd");
            try
            {
                con.Open();
                sqlCmd = new SqlCommand(sql2, con);
                sqlCmd.Parameters.AddWithValue("@Id", GridView3.SelectedValue);
                sqlCmd.Parameters.AddWithValue("@datumUkonceniRR", Datum);
                sqlCmd.ExecuteNonQuery();
                sqlCmd.Dispose();
                con.Close();
                lbl_zprava3.Text = "Status článku změněn.";
            }
            catch (Exception)
            {
                lbl_zprava3.Text = "Nepodařilo se uložit!";
            }
        }
        else
        {
            lbl_zprava3.Text = "Některá z hodnot nebyla vybrána!";
        }
    }

    protected void btn_zamitnout_Click(object sender, EventArgs e)
    {
        if ((GridView3.SelectedIndex >= 0))
        {

            sql3 = "UPDATE Clanky SET status_clanek = 7, datum_uk_rec_riz = @datumUkonceniRR WHERE Id = @Id";
            string Datum = DateTime.Now.ToString("yyyy-MM-dd");
            try
            {
                con.Open();
                sqlCmd = new SqlCommand(sql3, con);
                sqlCmd.Parameters.AddWithValue("@Id", GridView3.SelectedValue);
                sqlCmd.Parameters.AddWithValue("@datumUkonceniRR", Datum);
                sqlCmd.ExecuteNonQuery();
                sqlCmd.Dispose();
                con.Close();
                lbl_zprava3.Text = "Status článku změněn.";
            }
            catch (Exception)
            {
                lbl_zprava3.Text = "Nepodařilo se uložit!";
            }
        }
        else
        {
            lbl_zprava3.Text = "Některá z hodnot nebyla vybrána!";
        }
    }
}