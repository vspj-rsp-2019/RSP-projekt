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

/*
 * Trida pro vkladani upravenych clanku autora
 * Je mozne vlozit upraveny clanek ke clanku, ktery je ve stavu k formalni uprave
 */
public partial class UpraveneClanky : System.Web.UI.Page
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
        if (user.Role != "autor")
        {
            Response.Redirect("ChybaOpravneni.aspx");
        }
    }

    /*
     * Vlozeni souboru na server, zkontroluje typ souboru a do databaze vlozi cestu k souboru a dalsi udaje 
     */
    protected void Upload(object sender, EventArgs a)
    {
        if (GV_clanky.Rows.Count > 0)
        {
            if ((FileUpload.PostedFile != null) && (FileUpload.PostedFile.ContentLength > 0))
            {
                string fileType = System.IO.Path.GetExtension(FileUpload.FileName);
                string fileName = System.IO.Path.GetFileName(FileUpload.PostedFile.FileName);
                string saveLocation = "~/Clanky/" + fileName;

                if (!isValidType(fileType))
                {
                    Lb_status.Text = "Zvolte soubor typu pdf nebo doc/docx";
                } else
                {
                    SqlDataAdapter da = new SqlDataAdapter("select count(*) from ClankyArchiv where Nazev='" + fileName + "'", con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (Convert.ToInt32(dt.Rows[0][0]) >= 1 || fileName == GV_clanky.SelectedRow.Cells[3].Text)
                    {
                        Lb_status.Text = "Nelze nahrát článek se stejným názvem jako má původní verze. Přidejte do názvu článku například slovo _upravene_";
                    }
                    else
                    {
                        try
                        {
                            da = new SqlDataAdapter("select count(*) from ClankyArchiv where ClanekId='" + GV_clanky.SelectedRow.Cells[1].Text + "'", con);
                            dt = new DataTable();
                            da.Fill(dt);
                            int versions = Convert.ToInt32(dt.Rows[0][0]);
                            if (versions == 0)
                            {
                                string nquery = "INSERT INTO ClankyArchiv(ClanekId, VerzeId, Stav, filePath, Nazev, Datum) VALUES (@clanekId, @verzeId, @stav, @path, @nazev, @date)";
                                if (con.State == System.Data.ConnectionState.Closed)
                                {
                                    con.Open();
                                }
                                SqlCommand ncmd = new SqlCommand(nquery, con);
                                ncmd.Parameters.AddWithValue("@clanekId", GV_clanky.SelectedRow.Cells[1].Text);
                                ncmd.Parameters.AddWithValue("@verzeId", (Convert.ToInt32(dt.Rows[0][0]) + 1)).ToString();
                                ncmd.Parameters.AddWithValue("@stav", 0);
                                ncmd.Parameters.AddWithValue("@nazev", GV_clanky.SelectedRow.Cells[3].Text);
                                ncmd.Parameters.AddWithValue("@path", "~/Clanky/" + GV_clanky.SelectedRow.Cells[3].Text);
                                ncmd.Parameters.AddWithValue("@date", Lb_datum.Text);
                                ncmd.ExecuteNonQuery();
                            }
                            FileUpload.PostedFile.SaveAs(Server.MapPath(saveLocation));
                            string query = "INSERT INTO ClankyArchiv(ClanekId, VerzeId, Stav, filePath, Nazev, Datum) VALUES (@clanekId, @verzeId, @stav, @path, @nazev, @date)";
                                    if (con.State == System.Data.ConnectionState.Closed)
                                    {
                                        con.Open();
                                    }
                                    SqlCommand cmd = new SqlCommand(query, con);
                                    cmd.Parameters.AddWithValue("@clanekId", GV_clanky.SelectedRow.Cells[1].Text);
                                    cmd.Parameters.AddWithValue("@verzeId", Lb_verze.Text);
                                    cmd.Parameters.AddWithValue("@stav", 5);
                                    cmd.Parameters.AddWithValue("@nazev", fileName);
                                    cmd.Parameters.AddWithValue("@path", saveLocation);
                                    cmd.Parameters.AddWithValue("@date", DateTime.Today);
                                    cmd.ExecuteNonQuery();
                            
                            query = "update Clanky set status_clanek=@stav, Datum=@date, filePath=@path, nazev=@nazev where Id=@clanekId";
                            if (con.State == System.Data.ConnectionState.Closed)
                            {
                                con.Open();
                            }
                            cmd = new SqlCommand(query, con);
                            cmd.Parameters.AddWithValue("@clanekId", GV_clanky.SelectedRow.Cells[1].Text);
                            cmd.Parameters.AddWithValue("@stav", 5);
                            cmd.Parameters.AddWithValue("@nazev", fileName);
                            cmd.Parameters.AddWithValue("@path", saveLocation);
                            cmd.Parameters.AddWithValue("@date", DateTime.Today);
                            cmd.ExecuteNonQuery();
                        }
                            catch (Exception)
                            {
                            Lb_status.Text = "Při nahrávání došlo k chybě.";
                        }
                        Lb_status.Text ="Článek byl nahrán";
                        Lb_nazevClanku.Text = "";
                        Lb_verze.Text = "";
                        GV_clanky.DataBind();
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
        } else
        {
            Lb_status.Text = "Vyberte článek, ke kterému chcete nahrát upravenou verzi.";
        }
    }

    /*
     * Provede kontrolu jestli je soubor ve formatu pdf, doc nebo docx
     */
    protected Boolean isValidType(string extension)
    {
        Boolean isValid = false;

        if (extension.ToLower().Equals(".pdf") || extension.ToLower().Equals(".doc") || extension.ToLower().Equals(".docx"))
        {
            isValid = true;
        }
        return isValid;
    }

    /*
     * Pri vyberu clanku ze seznamu clanku k upraveni urci verzi momentalne vkladaneho clanku
     *  a upravi datum z tabulky pro dalsi vlozeni do databaze ve spravnem formatu
     */
    protected void GV_clanky_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlDataAdapter da = new SqlDataAdapter("select count(*) from ClankyArchiv where ClanekId='" + GV_clanky.SelectedRow.Cells[1].Text + "'", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (Convert.ToInt32(dt.Rows[0][0]) == 0)
        {
            Lb_verze.Text = (Convert.ToInt32(dt.Rows[0][0]) + 2).ToString();
        } else
        {
            Lb_verze.Text = (Convert.ToInt32(dt.Rows[0][0]) + 1).ToString();
        }
        Lb_nazevClanku.Text = GV_clanky.SelectedRow.Cells[3].Text;
        string celeDatum = GV_clanky.SelectedRow.Cells[4].Text;
        string zkracene = celeDatum.Split(' ')[0];
        Lb_datum.Text = zkracene.Split('.')[1]+ "/"+ zkracene.Split('.')[0]+"/"+ zkracene.Split('.')[2];
    }
}