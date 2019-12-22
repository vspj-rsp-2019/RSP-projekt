using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class VypracovaniRecenze : System.Web.UI.Page
{
    // Vytvori pripojeni k databazi 
    SqlCommand cmd = new SqlCommand();

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    User user;
    SqlCommand sqlCmd;
    string sql = null;
    string sql2 = null;


    protected void Page_Load(object sender, EventArgs e)
    {
        //kontrola na přihlášeného uživatele
        user = (User)Session["userObject"];
        if (user == null)
        {
            Response.Redirect("login.aspx");
        }
        // kontrola na roli recenzenta případně admina
        if (user.Role != "recenzent" && user.Role != "admin")
        {
            Response.Redirect("ChybaOpravneni.aspx");
        }

        lbl_aktDatum.Text = DateTime.Now.ToShortDateString();
      //  lbl_recenzentID.Text = Convert.ToString(user.id);

    }



    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        // zobrazí se text recenze v textovém poli
        SqlDataAdapter da = new SqlDataAdapter("select * from Recenze where Id='" + GridView2.SelectedRow.Cells[1].Text + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        
        TB_textRecenze.Text = dt.Rows[0][6].ToString();
        TB_textRecenze.ReadOnly = true;

    }

    protected void btn_odeslatRecenzi_Click(object sender, EventArgs e)
    {
        if ((GridView1.SelectedIndex >= 0) && (tbx_komentarRecenze.Text.Length > 1))
        {

            //sql = "UPDATE Recenze set Recenze.Datum=@Datum, Recenze.TextRecenze=@TextRecenze, Recenze.Aktualnost=@Aktualnost, Recenze.Originalita=@Originalita, Recenze.OdbornaUroven=@OdbornaUroven, Recenze.JazykovaUroven=@JazykovaUroven FROM Recenze INNER JOIN PrideleneClanky ON PrideleneClanky.Id_Clanku = Recenze.Clanek_id WHERE [Clanek_id] = @Clanek_id AND Recenze.Recenzent_id = @Recenzent_id";
            sql = "insert into Recenze (Clanek_id, Recenzent_id, Datum, Zverejneno, TextRecenze, Aktualnost, Originalita, OdbornaUroven, JazykovaUroven, Zaver) values (@Id_Clanku, @Id_Recenzenta, @Datum, @Zverejneno, @TextRecenze, @Aktualnost, @Originalita, @OdbornaUroven, @JazykovaUroven, @Zaver)";
            sql2 = "update PrideleneClanky set Zpracovano = 1 where (Id_Clanku=@Id_clanku AND Id_Recenzenta=@Id_Recenzenta)";
            try
            {
                con.Open();
                sqlCmd = new SqlCommand(sql, con);
                

                string Datum = DateTime.Now.ToString("yyyy-MM-dd");
                
                
                sqlCmd.Parameters.AddWithValue("@Datum", Datum);
                sqlCmd.Parameters.AddWithValue("@TextRecenze", tbx_komentarRecenze.Text);
                sqlCmd.Parameters.AddWithValue(@"Zverejneno", 0);
                sqlCmd.Parameters.AddWithValue("@Aktualnost", ddl_aktualnost.SelectedValue);
                sqlCmd.Parameters.AddWithValue("@Originalita", ddl_originalita.SelectedValue);
                sqlCmd.Parameters.AddWithValue("@OdbornaUroven", ddl_odburoven.SelectedValue);
                sqlCmd.Parameters.AddWithValue("@JazykovaUroven", ddl_jazykuroven.SelectedValue);
                sqlCmd.Parameters.AddWithValue("@Id_Clanku", GridView1.SelectedRow.Cells[1].Text);
                sqlCmd.Parameters.AddWithValue("@Id_Recenzenta", GridView1.SelectedRow.Cells[3].Text);
                sqlCmd.Parameters.AddWithValue("@Zaver", ddl_zaver.SelectedValue);

                
                sqlCmd.ExecuteNonQuery();

               
                sqlCmd.Dispose();
                con.Close();

                lbl_potvrzeni.ForeColor = System.Drawing.ColorTranslator.FromHtml("#33CC33");
                lbl_potvrzeni.Text = "Recenze uložena.";
                //GridView1.DataBind();

                con.Open();
                sqlCmd = new SqlCommand(sql2, con);
                sqlCmd.Parameters.AddWithValue("@Id_Clanku", GridView1.SelectedRow.Cells[1].Text);
                sqlCmd.Parameters.AddWithValue("@Id_Recenzenta", GridView1.SelectedRow.Cells[3].Text);
                sqlCmd.ExecuteNonQuery();

                sqlCmd.Dispose();
                con.Close();


            }
            catch (Exception ex)
            {
                lbl_potvrzeni.Text = "Vyskytla se chyba, obraťte se na administrátora!";
                lbl_potvrzeni.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF3300");
            }

        }

        else
        {
            lbl_potvrzeni.Text = "Některá z hodnot nebyla vybrána!";
            lbl_potvrzeni.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF3300");
        }
    }

    protected void lbl_aktualizovat_DataBinding(object sender, EventArgs e)
    {
       
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}