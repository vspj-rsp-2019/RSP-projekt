using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
 

public partial class registrAutor : System.Web.UI.Page
{
    User user;
    protected void Page_Load(object sender, EventArgs e)
    {
        user = new User();
    }



    protected void BTN_cancel_Click(object sender, EventArgs e)
    {
    }

    protected void BTN_registrace_Click(object sender, EventArgs e)
    {
        Boolean isOk = true;

        if(TB_jmeno.Text == "") {
            LB_jmeno.Text = "Vyplňte jméno";
            isOk = false;
        }
        if (TB_prijmeni.Text == "")
        {
            LB_prijmeni.Text = "Vyplňte příjmení";
            isOk = false;
        }
        if (TB_email.Text == "")
        {
            LB_email.Text = "Vyplňte email";
            isOk = false;
        }
        if (TB_emailConfirm.Text == "")
        {
            LB_emailConfirm.Text = "Vyplňte email";
            isOk = false;
        }
        if (TB_heslo.Text == "")
        {
            LB_heslo.Text = "Vyplňte heslo";
            isOk = false;
        }
        if (TB_hesloConfirm.Text == "")
        {
            LB_hesloConfirm.Text = "Vyplňte heslo";
            isOk = false;
        }

        if(TB_email.Text != TB_emailConfirm.Text)
        {
            LB_emailConfirm.Text = "Email nesouhlasí";
            isOk = false;
        }
        if(TB_heslo.Text != TB_hesloConfirm.Text)
        {
            LB_hesloConfirm.Text = "Heslo nesouhlasí";
            isOk = false;
        }
        if (isOk)
        {
            user.Jmeno = TB_jmeno.Text;
            user.Prijmeni = TB_prijmeni.Text;
            user.Email = TB_email.Text;
            user.Heslo = TB_heslo.Text;

            DBHandler dbHandler = new DBHandler(@"Data Source=(LocalDB)\MSSQLLocalDB;
                                        AttachDbFilename=|DataDirectory|\Database.mdf;
                                        Integrated Security=True;Connect Timeout=30");

            List<String> usedEmails = dbHandler.getAllLogins();
            if (usedEmails.Contains(user.Email))
            {
                LB_email.Text = "Účet s tímto emailem je už zaregistrován";
            }


            else if (dbHandler.registerUser(user))
            {
                Response.Write("<script>alert('registrace probehla uspesne')</script>");
            }
            else
            {
                Response.Write("<script>alert('neco se nepovedlo')</script>");
            }
        }
    }
}