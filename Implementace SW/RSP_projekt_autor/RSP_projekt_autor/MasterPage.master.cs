using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage


{
    User user;
    DBHandler dbHandler = new DBHandler(@"Data Source = SQL5044.site4now.net; Initial Catalog = DB_A50E52_rsp019; User Id = DB_A50E52_rsp019_admin; Password=Voracek2019;");
    protected void Page_Load(object sender, EventArgs e)
    {
        //kontrola na prihlaseneho uzivatele
        user = (User)Session["userObject"];
        if (user == null)
        {
            // pokud neni prihlasen, menu nebude zobrazeno
            Menu1.Visible = false;
        }
        else
        {
            //lb_userName.Text = "přihlášený uživatel";
            lb_userName.Text = " Login:  " + user.Prijmeni + " " + user.Jmeno;


        if (user.Role != "redaktor")
        {
                // v pripade prihlaseni uzivatele s roli vyse, nebudou dostupne a viditelne polozky menu

                // schovani podmenu nove clanky
                Menu1.Items[0].ChildItems[1].Enabled = false;
                Menu1.Items[0].ChildItems[1].Text = ""; 

                // schovani podmenu k doreseni
                Menu1.Items[0].ChildItems[2].Enabled = false;
                Menu1.Items[0].ChildItems[2].Text = "";

                // schvoani v podmenu prideleni recenzi
                Menu1.Items[1].ChildItems[2].Enabled = false;
                Menu1.Items[1].ChildItems[2].Text = ""; // 

               

                // schovani v podmenu zpravy od redaktora
                Menu1.Items[2].ChildItems[0].Enabled = false;
                Menu1.Items[2].ChildItems[0].Text = ""; // 

            }
            // v pripade prihlaseni uzivatele s roli vyse, nebudou dostupne a viditelne polozky menu

            if (user.Role == "redaktor")
            {

                // schovani podmenu moje články
                Menu1.Items[0].ChildItems[0].Enabled = false;
                Menu1.Items[0].ChildItems[0].Text = "";

                // schovani v podmenu zpravy od redaktora
                Menu1.Items[2].ChildItems[1].Enabled = false;
                Menu1.Items[2].ChildItems[1].Text = ""; // 

                // schovani podmenu vlozeni upraveneho clanku clanku
                Menu1.Items[0].ChildItems[7].Enabled = false;
                Menu1.Items[0].ChildItems[7].Text = "";

                // schovani v podmenu zpravy od redaktora autorovi
                Menu1.Items[2].ChildItems[3].Enabled = false;
                Menu1.Items[2].ChildItems[3].Text = ""; // 

                // schovani v podmenu vypracovani recenzi
                Menu1.Items[1].ChildItems[3].Enabled = false;
                Menu1.Items[1].ChildItems[3].Text = ""; // 

                // presmerovani do prislusneho menu uzivatele
                //Menu1.Items[1].Enabled = true;
                Menu1.Items[1].NavigateUrl = ("PrideleniRecenzi.aspx");


            }



            if (user.Role == "autor")
            {

                // schovani podmenu zamitnute clanky
                Menu1.Items[0].ChildItems[4].Enabled = false;
                Menu1.Items[0].ChildItems[4].Text = "";

                // schovani podmenu archivace clanku
                Menu1.Items[0].ChildItems[6].Enabled = false;
                Menu1.Items[0].ChildItems[6].Text = "";

                // schovani podmenu vlozeni vydani cisla do archivu
                Menu1.Items[0].ChildItems[8].Enabled = false;
                Menu1.Items[0].ChildItems[8].Text = "";

                //schovani v menu sekce terminy

                Menu1.Items[3].Enabled = false;
                Menu1.Items[3].Text = "";
                

                //schovani v menu sekce admin
                Menu1.Items[4].Enabled = false;
                Menu1.Items[4].Text = "";

                // schovani v podmenu zpravy od autora
                Menu1.Items[2].ChildItems[1].Enabled = false;
                Menu1.Items[2].ChildItems[2].Text = ""; // 

                // schovani v podmenu zpravy od redaktora
                Menu1.Items[2].ChildItems[1].Enabled = false;
                Menu1.Items[2].ChildItems[1].Text = ""; // 

                // schovani v podmenu vypracovani recenzi
                Menu1.Items[1].ChildItems[3].Enabled = false;
                Menu1.Items[1].ChildItems[3].Text = ""; // 
                                                       
                // schovani v podmenu recenze recenzni rizeni
                Menu1.Items[1].ChildItems[0].Enabled = false;
                Menu1.Items[1].ChildItems[0].Text = ""; //

            }

            if (user.Role == "admin")
            {
                // schovani podmenu vlozeni upraveneho clanku clanku
                Menu1.Items[0].ChildItems[7].Enabled = false;
                Menu1.Items[0].ChildItems[7].Text = "";
            }

            if (user.Role == "recenzent")
            {
                // schovani v podmenu zpravy od autora
                Menu1.Items[2].ChildItems[2].Enabled = false;
                Menu1.Items[2].ChildItems[2].Text = ""; // 

                // schovani v podmenu zpravy od recenzentů
                Menu1.Items[2].ChildItems[0].Enabled = false;
                Menu1.Items[2].ChildItems[0].Text = ""; // 

                // schovani v podmenu zpravy od redaktora autorovi
                Menu1.Items[2].ChildItems[3].Enabled = false;
                Menu1.Items[2].ChildItems[3].Text = ""; // 

                // schovani podmenu nahrani vydani cisla do archivu
                Menu1.Items[0].ChildItems[8].Enabled = false;
                Menu1.Items[0].ChildItems[8].Text = "";
                // schovani podmenu vlozeni upraveny clanek
                Menu1.Items[0].ChildItems[7].Enabled = false;
                Menu1.Items[0].ChildItems[7].Text = "";

                // schovani podmenu archivace clanku
                Menu1.Items[0].ChildItems[6].Enabled = false;
                Menu1.Items[0].ChildItems[6].Text = "";

                // schovani v podmenu moje clanky
                Menu1.Items[0].ChildItems[0].Enabled = false;
                Menu1.Items[0].ChildItems[0].Text = ""; // 

                // schovani v podmenu recenze recenzni rizeni
                Menu1.Items[1].ChildItems[0].Enabled = false;
                Menu1.Items[1].ChildItems[0].Text = ""; // 

                // presmerovani do prislusneho menu uzivatele
                Menu1.Items[1].NavigateUrl = ("VypracovaniRecenze.aspx");
                // presmerovani do prislusneho menu uzivatele
                Menu1.Items[0].NavigateUrl = ("VyhledatClanek.aspx");

            }

        }
    }
}
