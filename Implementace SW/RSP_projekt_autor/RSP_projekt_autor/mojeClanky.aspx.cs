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
        if(( FileUpload.PostedFile != null ) && (FileUpload.PostedFile.ContentLength > 0))
        {
            string fileName = System.IO.Path.GetFileName(FileUpload.PostedFile.FileName);
            string saveLocation = "~/Clanky/" + fileName;

            try {
                FileUpload.PostedFile.SaveAs(Server.MapPath(saveLocation));
                dbHandler.uploadFile(user.id, Convert.ToInt32(DDL_vyberVydani.SelectedValue), fileName, saveLocation);
                Response.Write("Článek byl nahrán");
                
            }catch(Exception ex)
            {
                Response.Write("error: " + ex.Message);
            }
        }
        else
        {
            Response.Write("Prosím zvolte soubor pro nahrání");
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