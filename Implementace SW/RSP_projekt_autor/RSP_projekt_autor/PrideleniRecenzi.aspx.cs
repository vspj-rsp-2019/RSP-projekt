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
        Lbl_datum.Text = Calendar1.SelectedDate.ToString();
    }

    /*
     * Priradi vybrany clanek (ze seznamu) vybranemu recenzentovi  
     */
    protected void Btn_priradRecenzenta_Click(object sender, EventArgs e)
    {
        if ((GridView1.SelectedIndex >= 0) && (GridView2.SelectedIndex >= 0) && (Lbl_datum.Text.Length > 1))
        {
            sql = "insert into PrideleneClanky (Id_Clanku, Id_Recenzenta, Datum_vypracovani)values(@idClanku, @idRecenzenta, @datumVypracovani)";
            try
            {
                con.Open();
                sqlCmd = new SqlCommand(sql, con);

                sqlCmd.Parameters.AddWithValue("@idClanku", GridView1.SelectedRow.Cells[0].Text);
                sqlCmd.Parameters.AddWithValue("@idRecenzenta", GridView2.SelectedRow.Cells[0].Text);
                sqlCmd.Parameters.AddWithValue("@datumVypracovani", Calendar1.SelectedDate.ToString("MM/dd/yyyy"));

                sqlCmd.ExecuteNonQuery();

                sqlCmd.Dispose();
                con.Close();
                Lbl_zprava.Text = "Recenze přiřazena.";
            }
            catch (Exception ex)
            {
                // Lbl_zprava.Text = ex.ToString();
                Lbl_zprava.Text = "Recenze je již přiřazena (nelze vícekrát)!";
            }
        }
        else
        {
            Lbl_zprava.Text = "Některá z hodnot nebyla vybrána!";
        }

    }
}