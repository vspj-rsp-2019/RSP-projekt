using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class mojeClanky : System.Web.UI.Page
{
    User user;
    DBHandler dbHandler;


    protected void Page_Load(object sender, EventArgs e)
    {
        user = (User)Session["userObject"];
        dbHandler = new DBHandler(@"Data Source=(LocalDB)\MSSQLLocalDB;
                                        AttachDbFilename=|DataDirectory|\Database.mdf;
                                        Integrated Security=True;Connect Timeout=30");
        if (user == null)
        {
            Response.Redirect("login.aspx");
        }
    }
    protected void Upload(object sender, EventArgs a)
    {
        string fileName = Path.GetFileName(FileUpload.PostedFile.FileName);
        string contentType = FileUpload.PostedFile.ContentType;

        if(!contentType.Equals("pdf") || !contentType.Equals("doc") || !contentType.Equals("docx"))
        {
            Response.Write("<alert>Soubor musí být ve formatu PDF nebo doc/docx</alert>");
        }

        using(Stream fs = FileUpload.PostedFile.InputStream)
        {
            using(BinaryReader br = new BinaryReader(fs))
            {
                byte[] bytes = br.ReadBytes((Int32)fs.Length);
                //dbHandler.uploadFile(user.id, bytes);
            }
        }
    }

    protected void DDL_vyberVydani_SelectedIndexChanged(object sender, EventArgs e)
    {
        updateCounter(DDL_vyberVydani.SelectedItem.Value);
    }

    protected void updateCounter(string vydani)
    {
        LB_counterClanku.Text = Convert.ToString(dbHandler.pocetClankuVydani(Convert.ToInt32(vydani)));
    }
}