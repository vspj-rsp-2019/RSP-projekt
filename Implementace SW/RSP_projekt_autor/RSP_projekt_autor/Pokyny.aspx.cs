using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pokyny : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void liB_pokynyAutor_Click(object sender, EventArgs e)
    {
       //PDF nacteni
        Response.ContentType = "Application/pdf";
        //cesta
        string FilePath = MapPath("pokynyA.pdf");
        //Write the file directly to the HTTP content output stream.
        Response.WriteFile(FilePath);
        Response.End();
    }

    protected void liB_recenRizeni_Click(object sender, EventArgs e)
    {
        //PDF nacteni
        Response.ContentType = "Application/pdf";
        //cesta
        string FilePath = MapPath("recenzniRizeni.pdf");
        //Write the file directly to the HTTP content output stream.
        Response.WriteFile(FilePath);
        Response.End();
    }

    protected void liB_sablona_Click(object sender, EventArgs e)
    {
     //Word nacteni
        Response.ContentType = "Application/msword";
        //cesta
        string FilePath = MapPath("sablona.docx");
        //Write the file directly to the HTTP content output stream.
        Response.WriteFile(FilePath);
        Response.End();
    }
}