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
    DBHandler dbHandler = new DBHandler(@"Data Source=(LocalDB)\MSSQLLocalDB;
                                        AttachDbFilename=|DataDirectory|\Database.mdf;
                                        Integrated Security=True;Connect Timeout=30");

    List<KeyValuePair<int, string>> vydaniList;

    protected void Page_Load(object sender, EventArgs e)
    {
        // pokud neni uzivatel prihlasen, dojde k presmerovani na prihlaseni
        user = (User)Session["userObject"];
        if (user == null)
        {
            Response.Redirect("login.aspx");
        }

        //nacteni vsech vydani pro naplneni dropdown listu
        vydaniList = dbHandler.getAllVydani();
        naplnitDDL();
    }

    /**
     * nahrani souboru na server, zkontroluje typ souboru a do databaze ulozi relativni cesta k souboru, dane vydani a id autora a datum nahrani
     */
    protected void Upload(object sender, EventArgs a)
    {
        if(( FileUpload.PostedFile != null ) && (FileUpload.PostedFile.ContentLength > 0))
        {
            string fileType = System.IO.Path.GetExtension(FileUpload.FileName);
            string fileName = System.IO.Path.GetFileName(FileUpload.PostedFile.FileName);
            string saveLocation = "~/Clanky/" + fileName;

            if( !isValidType(fileType) )
            {
                Response.Write("<script>alert('Zvolte soubor typu pdf nebo doc/docx')</script>");
                return;
            }
            if(DDL_vyberVydani.SelectedIndex == 0)
            {
                Response.Write("<script>alert('Zvolte vydani')</script>");
                return;
            }

            try {
                FileUpload.PostedFile.SaveAs(Server.MapPath(saveLocation));
                dbHandler.uploadFile(user.id, Convert.ToInt32(DDL_vyberVydani.SelectedValue), fileName, saveLocation);
                Response.Write("Článek byl nahrán");
                GV_clanky.DataBind();
                
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
    /**
     * naplneni dropdown listu aktivnimi vydani casopisu na 0 index se vlozi prazdny vyber 
     */
    protected void naplnitDDL()
    {
        if (DDL_vyberVydani.Items.Count != 0)
            return;

        DDL_vyberVydani.Items.Insert(0, "-"); //prazdny vyber

        for (int i = 0; i < vydaniList.Count; ++i)
        {
            DDL_vyberVydani.Items.Insert(i + 1, new ListItem(vydaniList[i].Value, vydaniList[i].Key.ToString()));
        }
    }


    protected void DDL_vyberVydani_SelectedIndexChanged(object sender, EventArgs e)
    {
        updateCounter(DDL_vyberVydani.SelectedItem.Value);
    }
    /*
     * update labelu se zobrazenim kolik clanku je k danemu vydani v DB
     */
    protected void updateCounter(string vydani)
    {
        if(DDL_vyberVydani.SelectedIndex == 0)
        {
            LB_counterClanku.Text = "";
            return;
        }
        LB_counterClanku.Text = Convert.ToString(dbHandler.pocetClankuVydani( Convert.ToInt32(DDL_vyberVydani.SelectedValue)));
    }

    //kontrola zda soubor je formatu pdf doc nebo docx
    protected Boolean isValidType(string extension)
    {
        Boolean isValid = false;

        if(extension.ToLower().Equals(".pdf") || extension.ToLower().Equals(".doc") || extension.ToLower().Equals(".docx"))
        {
            isValid = true;
        }

        return isValid;
    }
}