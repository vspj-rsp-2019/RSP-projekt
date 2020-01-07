using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class registrAutor : System.Web.UI.Page
{
    User user;
    DBHandler dbHandler = new DBHandler(@"Data Source=SQL5044.site4now.net;Initial Catalog=DB_A50E52_rsp019;User Id=DB_A50E52_rsp019_admin;Password=Voracek2019;");
    List<String> usedEmails;
    protected void Page_Load(object sender, EventArgs e)
    {
        user = new User();
        usedEmails = dbHandler.getAllLogins();
    }

    /**
     * vymazání všech LabelBoxů
     */
    protected void clearAllLabelBox()
    {
        LB_jmeno.Text = "";
        LB_prijmeni.Text = "";
        LB_email.Text = "";
        LB_emailConfirm.Text = "";
        LB_heslo.Text = "";
        LB_hesloConfirm.Text = "";
        LB_emailConfirm.Text = "";
        LB_hesloConfirm.Text = "";
    }

    /**
     *¨vymazání všech Textboxů 
     */
    protected void clearAllTextBox()
    {
        TB_jmeno.Text = "";
        TB_prijmeni.Text = "";
        TB_email.Text = "";
        TB_emailConfirm.Text = "";
        TB_heslo.Text = "";
        TB_hesloConfirm.Text = "";
        TB_emailConfirm.Text = "";
        TB_hesloConfirm.Text = "";
    }
    
    /**
     * tlačítko Zrušit vymaže všechny labely a textboxy
     */
    protected void BTN_cancel_Click(object sender, EventArgs e)
    {
        clearAllLabelBox();
        clearAllTextBox();
    }

    protected void BTN_registrace_Click(object sender, EventArgs e)
    {
        clearAllLabelBox();
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
            if (usedEmails.Contains(user.Email))
            {
                LB_email.Text = "Účet s tímto emailem je už zaregistrován";
            }
            else if (dbHandler.registerUser(user))
            {
                Response.Write("<script>alert('registrace probehla uspesne')</script>");
                clearAllTextBox();
            }
            else
            {
                Response.Write("<script>alert('neco se nepovedlo')</script>");
            }
        }
    }
}