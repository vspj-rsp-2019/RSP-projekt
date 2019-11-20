using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class NoveClanky : System.Web.UI.Page

{
    // Vytvori pripojeni k databazi 
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlCommand sqlCmd;
    string sql = null;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

   
    //změna statusu na c.1 k formalnimu doplneni
    protected void btn_zmenaStatusu_Click(object sender, EventArgs e)
    {
        sql = "UPDATE Clanky SET status_clanek = 1 WHERE Id = @Id";

           
        try
        {
            con.Open();
            sqlCmd = new SqlCommand(sql, con);

            sqlCmd.Parameters.AddWithValue("@Id", GridView1.SelectedValue);
           
            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            con.Close();

            lbl_stav.ForeColor = System.Drawing.ColorTranslator.FromHtml("#66FF33");
            lbl_stav.Visible = true;
            lbl_stav.Text = "Úspěšně uloženo.";
            Response.Redirect(Request.RawUrl);



        }
        catch (Exception ex)
        {
            lbl_stav.Text = "Změna neproběhla.";
           lbl_stav.Visible = true ;
        }
       
    }

    //predat clanek do recenzniho rizeni
    protected void btn_odeslat_do_RR_Click(object sender, EventArgs e)
    {
        sql = "UPDATE Clanky SET status_clanek = 2 WHERE Id = @Id";


        try
        {
            con.Open();
            sqlCmd = new SqlCommand(sql, con);

            sqlCmd.Parameters.AddWithValue("@Id", GridView1.SelectedValue);

            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            con.Close();
            lbl_stav.ForeColor = System.Drawing.ColorTranslator.FromHtml("#66FF33");
            lbl_stav.Visible = true;
            lbl_stav.Text = "Úspěšně uloženo.";
            Response.Redirect(Request.RawUrl);

        }
        catch (Exception ex)
        {
            lbl_stav.Text = "Změna neproběhla.";
            lbl_stav.Visible = true;
        }
    }
    //Zamitnuti clanku
    protected void btn_zamitnoutcl_Click(object sender, EventArgs e)
    {
        sql = "UPDATE Clanky SET status_clanek = 7 WHERE Id = @Id";


        try
        {
            con.Open();
            sqlCmd = new SqlCommand(sql, con);

            sqlCmd.Parameters.AddWithValue("@Id", GridView1.SelectedValue);

            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            con.Close();
            lbl_stav.ForeColor = System.Drawing.ColorTranslator.FromHtml("#66FF33");
            lbl_stav.Visible = true;
            lbl_stav.Text = "Úspěšně uloženo.";
            Response.Redirect(Request.RawUrl);
                    

        }
        catch (Exception ex)
        {
            lbl_stav.Text = "Změna neproběhla.";
            lbl_stav.Visible = true;
        }
    }
}