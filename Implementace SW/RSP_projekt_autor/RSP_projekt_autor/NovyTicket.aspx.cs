using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class NovyTicket : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    User user;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        user = (User)Session["userObject"];
        if(user == null)
        {
            Response.Redirect("login.aspx");
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void BTN_odeslat_Click(object sender, EventArgs e)
    {
        if (TB_textTicket.Text.Equals("") || TB_title.Text.Equals(""))
        {
            lb_error.Text = "Prosím vyplňte text a titulek ticketu";
        }
        else
        {
            TicketClass ticket = new TicketClass(user.id, TB_textTicket.Text, "",
                                        DDL_cil.SelectedValue.ToString());

            String query = "INSERT INTO Tickets(id_autor, role_cil, text) VALUES(@id, @cil, @text);";
            try
            {
                con.Open();
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", ticket.autor);
                cmd.Parameters.AddWithValue("@text", ticket.text);
                cmd.Parameters.AddWithValue("@cil", ticket.cil);

                cmd.ExecuteNonQuery();
                lb_error.Text = "Ticket odeslán";
            }
            catch (Exception ex)
            {
                lb_error.Text = ex.Message;
            }
        }
    }
}