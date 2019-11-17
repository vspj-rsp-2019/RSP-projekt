using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage


{
    User user;
    DBHandler dbHandler = new DBHandler(@"Data Source=(LocalDB)\MSSQLLocalDB;
                                        AttachDbFilename=|DataDirectory|\Database.mdf;
                                        Integrated Security=True;Connect Timeout=30");
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
                // v pripade prohlaseni uzivatele s roli vyse, nebudou dostupne a viditelne polozky menu

                // schovani podmenu nove clanky
                Menu1.Items[0].ChildItems[0].Enabled = false;
                Menu1.Items[0].ChildItems[0].Text = ""; 

                // schovani podmenu k doreseni
                Menu1.Items[0].ChildItems[1].Enabled = false;
                Menu1.Items[0].ChildItems[1].Text = "";

                // schvoani v podmenu prideleni recenzi
                Menu1.Items[1].ChildItems[2].Enabled = false;
                Menu1.Items[1].ChildItems[2].Text = ""; // 
               
                // schovani v podmenu zpravy od redaktora
                Menu1.Items[2].ChildItems[0].Enabled = false;
                Menu1.Items[2].ChildItems[0].Text = ""; // 
                               


            }
        }
    }
}
