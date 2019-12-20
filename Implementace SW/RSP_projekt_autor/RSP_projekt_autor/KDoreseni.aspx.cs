using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class KDoreseni : System.Web.UI.Page
{

    // Vytvori pripojeni k databazi 
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlCommand sqlCmd;
    string sql = null;

    User user;
    DBHandler dbHandler = new DBHandler(@"Data Source = SQL5044.site4now.net; Initial Catalog = DB_A50E52_rsp019; User Id = DB_A50E52_rsp019_admin; Password=Voracek2019;");

    protected void Page_Load(object sender, EventArgs e)
    {

        //kontrola na přihlášeného uživatele
        user = (User)Session["userObject"];
        if (user == null)
        {
            Response.Redirect("login.aspx");
        }

        //změna statusu na c.1 k formalnimu doplneni
    }

    protected void btn_VratitKformDopl_Click(object sender, EventArgs e)
    {
        sql = "UPDATE Clanky SET status_clanek = 1 WHERE Id = @Id";


        try
        {
            con.Open();
            sqlCmd = new SqlCommand(sql, con);

            sqlCmd.Parameters.AddWithValue("@Id", GridView2.SelectedValue);

            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            con.Close();

            lb_stav.ForeColor = System.Drawing.ColorTranslator.FromHtml("#66FF33");
            lb_stav.Visible = true;
            lb_stav.Text = "Úspěšně uloženo.";
            Response.Redirect(Request.RawUrl);



        }
        catch (Exception ex)
        {
            lb_stav.Text = "Změna neproběhla.";
            lb_stav.Visible = true;
        }

        
    }
    //predat clanek do zahajeni recenzniho rizeni

    protected void btn_OdeslatRR_Click(object sender, EventArgs e)
    {
        sql = "UPDATE Clanky SET status_clanek = 2 WHERE Id = @Id";


        try
        {
            con.Open();
            sqlCmd = new SqlCommand(sql, con);

            sqlCmd.Parameters.AddWithValue("@Id", GridView2.SelectedValue);

            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            con.Close();
            lb_stav.ForeColor = System.Drawing.ColorTranslator.FromHtml("#66FF33");
            lb_stav.Visible = true;
            lb_stav.Text = "Úspěšně uloženo.";
            Response.Redirect(Request.RawUrl);

        }
        catch (Exception ex)
        {
            lb_stav.Text = "Změna neproběhla.";
            lb_stav.Visible = true;
        }
    }
    //Zamitnuti clanku - status 7
    protected void btn_zamitnout_Click(object sender, EventArgs e)
    {

        sql = "UPDATE Clanky SET status_clanek = 7 WHERE Id = @Id";


        try
        {
            con.Open();
            sqlCmd = new SqlCommand(sql, con);

            sqlCmd.Parameters.AddWithValue("@Id", GridView2.SelectedValue);

            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            con.Close();
            lb_stav.ForeColor = System.Drawing.ColorTranslator.FromHtml("#66FF33");
            lb_stav.Visible = true;
            lb_stav.Text = "Úspěšně uloženo.";
            Response.Redirect(Request.RawUrl);


        }
        catch (Exception ex)
        {
            lb_stav.Text = "Změna neproběhla.";
            lb_stav.Visible = true;
        }
    }
    //clanek vratit do probiha RR - status č.4
    protected void btn_VratitDoRR_Click(object sender, EventArgs e)
    {
        sql = "UPDATE Clanky SET status_clanek = 4 WHERE Id = @Id";


        try
        {
            con.Open();
            sqlCmd = new SqlCommand(sql, con);

            sqlCmd.Parameters.AddWithValue("@Id", GridView2.SelectedValue);

            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            con.Close();
            lb_stav.ForeColor = System.Drawing.ColorTranslator.FromHtml("#66FF33");
            lb_stav.Visible = true;
            lb_stav.Text = "Úspěšně uloženo.";
            Response.Redirect(Request.RawUrl);


        }
        catch (Exception ex)
        {
            lb_stav.Text = "Změna neproběhla.";
            lb_stav.Visible = true;
        }
    }

    protected void btn_kUpraveTextu_Click(object sender, EventArgs e)
    {
        // presun clanku do stavu 9
        sql = "UPDATE Clanky SET status_clanek = 9 WHERE Id = @Clanek_id";

        try
        {
            con.Open();
            sqlCmd = new SqlCommand(sql, con);

            sqlCmd.Parameters.AddWithValue("@Clanek_id", GridView3.SelectedValue);

            sqlCmd.ExecuteNonQuery();

            sqlCmd.Dispose();
            con.Close();
         lbl_zprava2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#66FF33");
            lbl_zprava2.Visible = true;
            lbl_zprava2.Text = "Úspěšně uloženo.";
            Response.Redirect(Request.RawUrl);


        }
        catch (Exception ex)
        {
            lbl_zprava2.Text = "Změna neproběhla.";
            lbl_zprava2.Visible = true;
        }
    }
}