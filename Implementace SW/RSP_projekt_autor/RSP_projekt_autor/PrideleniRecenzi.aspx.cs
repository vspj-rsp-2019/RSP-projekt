using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class PrideleniRecenzi : System.Web.UI.Page
{

    // Vytvori pripojeni k databazi 
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlCommand sqlCmd;
    string sql = null;
    string sql2 = null;
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
        Lbl_datum.Text = Calendar1.SelectedDate.ToShortDateString();
    }

    /*
     * Priradi vybrany clanek (ze seznamu) vybranemu recenzentovi
     * Nejprve dojde ke kontrole poctu recenzentu prirazenych clanku a vyplneny potrebnych udaju
     */
    protected void Btn_priradRecenzenta_Click(object sender, EventArgs e)
    {
        Lbl_zprava.Text = " ";


        if (Lbl_pocPridRecenzentu.Text != "2") {
            if ((GridView1.SelectedIndex >= 0) && (GridView2.SelectedIndex >= 0) && (Lbl_datum.Text.Length > 1))
            {
                if (DateTime.Now.Date > Calendar1.SelectedDate.Date)
                {
                    Lbl_zprava.Text = "Vybrané datum je menší než aktuální!";
                }
                else
                {
                    sql = "insert into PrideleneClanky (Id_Clanku, Id_Recenzenta, Datum_vypracovani)values(@idClanku, @idRecenzenta, @datumVypracovani)";
                    sql2 = "UPDATE Clanky SET status_clanek = 4 WHERE Id = @Id";
                    //výše umožní, že se článek přesune do statusu č.4 probiha RR
                    try
                    {
                        con.Open();
                        sqlCmd = new SqlCommand(sql, con);
                        sqlCmd = new SqlCommand(sql2, con);

                        sqlCmd.Parameters.AddWithValue("@idClanku", GridView1.SelectedRow.Cells[0].Text);
                        sqlCmd.Parameters.AddWithValue("@status_clanek", 4);
                        sqlCmd.Parameters.AddWithValue("@Id", GridView1.SelectedValue);
                        sqlCmd.Parameters.AddWithValue("@idRecenzenta", GridView2.SelectedRow.Cells[0].Text);
                        sqlCmd.Parameters.AddWithValue("@datumVypracovani", Calendar1.SelectedDate.ToString("MM/dd/yyyy"));

                        sqlCmd.ExecuteNonQuery();

                        sqlCmd.Dispose();
                        con.Close();
                        Lbl_zprava.Text = "Recenze přiřazena.";
                        SqlDataAdapter da = new SqlDataAdapter("select count(*) from PrideleneClanky where Id_Clanku='" + GridView1.SelectedRow.Cells[0].Text + "'", con);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        Lbl_pocPridRecenzentu.Text = dt.Rows[0][0].ToString();
                    }
                    catch (Exception ex)
                    {
                        // Lbl_zprava.Text = ex.ToString();
                        Lbl_zprava.Text = "Tento recenzent je již přiřazen (nelze vícekrát)!";
                    }
                }
            }
            else
            {
                Lbl_zprava.Text = "Některá z hodnot nebyla vybrána!";
            }
        } else
        {
            Lbl_zprava.Text = "Článek má již přiděleny 2 recenzenty!";
        }
     }
    

    /*
     * Po vybrani pozadovaneho clanku spocita a zobrazi pocet jiz pridelenych recenzentu k clanku 
     */
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select count(*) from PrideleneClanky where Id_Clanku='" + GridView1.SelectedRow.Cells[0].Text + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        Lbl_pocPridRecenzentu.Text = "0";
        Lbl_pocPridRecenzentu.Text = dt.Rows[0][0].ToString();
    }
}