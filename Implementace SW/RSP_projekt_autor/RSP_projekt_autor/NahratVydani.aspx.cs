using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class NahratVydani : System.Web.UI.Page
{
    // Vytvori pripojeni k databazi 
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString);
    SqlDataAdapter adapter = new SqlDataAdapter();
    DataSet ds = new DataSet();

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
     * Vlozeni souboru na server, zkontroluje typ souboru a do databaze vlozi cestu k souboru a nastavi vydani na archivovane 
     */
    protected void Upload(object sender, EventArgs e)
    {
            if ((FileUpload.PostedFile != null) && (FileUpload.PostedFile.ContentLength > 0))
            {
                string fileType = System.IO.Path.GetExtension(FileUpload.FileName);
                string fileName = System.IO.Path.GetFileName(FileUpload.PostedFile.FileName);
                string saveLocation = "~/Vydani/" + fileName;

                if (!isValidType(fileType))
                {
                    Lb_status.Text = "Zvolte soubor typu pdf";
                }
                else
                {
                    SqlDataAdapter da = new SqlDataAdapter("select * from Vydani where Id='" + DDL1_vydani.SelectedValue + "'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows[0][1].ToString() == fileName)
                    {
                        Lb_status.Text = "Nelze nahrát vydání se stejným názvem jako má původní verze.";
                    }
                    else
                    {
                        try
                        {
                            FileUpload.PostedFile.SaveAs(Server.MapPath(saveLocation));                    
                            SqlCommand cmd;
                        // string query = "update Vydani set Archiv='1', filePath=@path where Id=@vydaniId";
                        string query = "update Vydani set filePath=@path where Id=@vydaniId";
                        if (con.State == System.Data.ConnectionState.Closed)
                            {
                                con.Open();
                            }
                            cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@path", saveLocation);
                            cmd.Parameters.AddWithValue("@vydaniId", DDL1_vydani.SelectedValue);
                            cmd.ExecuteNonQuery();
                        }
                        catch (Exception)
                        {
                            Lb_status.Text = "Při nahrávání došlo k chybě.";
                        }
                        Lb_status.Text = "Vydání bylo nahráno";
                        DDL1_vydani.DataBind();
                        DDL_nearchivovane.DataBind();
                        DDL_archivovane.DataBind();
                }
                }
            }
            else if (FileUpload.PostedFile.ContentLength == 0)
            {
                Lb_status.Text = "Zvolený soubor má nulovou velikost.";
            }
            else
            {
                Lb_status.Text = "Prosím zvolte soubor pro nahrání.";
            }
    }


    /*
 * Provede kontrolu jestli je soubor ve formatu pdf
 */
    protected Boolean isValidType(string extension)
    {
        Boolean isValid = false;

        if (extension.ToLower().Equals(".pdf"))
        {
            isValid = true;
        }

        return isValid;
    }

    protected void DDL1_vydani_SelectedIndexChanged(object sender, EventArgs e)
    {
        Lb_upravaVydani.Text = "";
        Lb_status.Text = "";
    }

    /*
     * Provede vlozeni vydani s PDF do archivu 
     */
    protected void Btn_archivujVydani_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd;
            string query = "update Vydani set Archiv='1' where Id=@vydaniId";
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@vydaniId", DDL_nearchivovane.SelectedValue);
            cmd.ExecuteNonQuery();
            DDL1_vydani.DataBind();
            DDL_nearchivovane.DataBind();
            DDL_archivovane.DataBind();
            Lb_upravaVydani.Text = "Úprava proběhla";
        } catch (Exception)
        {
            Lb_upravaVydani.Text = "Úprava neproběhla";
        }
    }

    /*
     * Provede vyjmuti vydani s PDF z archivu 
     */
    protected void Btn_odarchivujVydani_Click(object sender, EventArgs e)
    {
        try
        {
            SqlCommand cmd;
            string query = "update Vydani set Archiv='0' where Id=@vydaniId";
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@vydaniId", DDL_archivovane.SelectedValue);
            cmd.ExecuteNonQuery();
            DDL1_vydani.DataBind();
            DDL_nearchivovane.DataBind();
            DDL_archivovane.DataBind();
            Lb_upravaVydani.Text = "Úprava proběhla";
        } catch (Exception)
        {
            Lb_upravaVydani.Text = "Úprava neproběhla";
        }
    }

    protected void DDL_nearchivovane_SelectedIndexChanged(object sender, EventArgs e)
    {
        Lb_upravaVydani.Text = "";
        Lb_status.Text = "";
    }

    protected void DDL_archivovane_SelectedIndexChanged(object sender, EventArgs e)
    {
        Lb_upravaVydani.Text = "";
        Lb_status.Text = "";
    }
}