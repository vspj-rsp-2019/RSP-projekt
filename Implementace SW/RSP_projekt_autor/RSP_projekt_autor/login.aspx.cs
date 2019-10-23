using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BT_login_Click(object sender, EventArgs e)
    {
        if(TB_email.Text == "")
        {
            LB_email.Text = "Vyplňte email";
        }
        if(TB_heslo.Text == "")
        {
            LB_heslo.Text = "Zadejte heslo";
        }

        User user = new User();
        user.Email = TB_email.Text;
        user.Heslo = TB_heslo.Text;
        if (user.Login())
        {
            Response.Write("<script>alert('login probehl uspesne')</script>");
            Session["role"] = user.Role;
        }
        else
        {
            Response.Write("<font color ='red'>Nesedí heslo nebo email</font>");
        }
    }
}