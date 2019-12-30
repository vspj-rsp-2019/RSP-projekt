using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Collections;

public partial class Ticket : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    List<TicketClass> tickets = new List<TicketClass>();
    User user;

    protected void Page_Load(object sender, EventArgs e)
    {
        user = (User)Session["userObject"];
        if (user == null)
        {
            Response.Redirect("login.aspx");
        }
        
        try
        {
            String query = "SELECT * FROM Tickets WHERE Id_autor = @id";
            con.Open();
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", user.id);

            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    int id = dr.GetInt32(1);
                    String cil = dr.GetString(2);
                    String titul = dr.GetString(3);
                    bool odp = dr.GetBoolean(4);
                    String text = dr.GetString(5);
                    String reply;
                    if (odp)
                    {
                        reply = dr.GetString(6);
                    }
                    else
                    {
                        reply = "";
                    }
                    TicketClass tmp = new TicketClass(id, titul, text, reply, cil, odp);
                    tickets.Add(tmp);
                }
            }
        }catch(Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message);
        }

        if (LB_ticket.Items.Count == 0)
        {
            foreach (var tick in tickets)
            {
                LB_ticket.Items.Add(tick.ToString());
            }
        }
        
    }

    protected void BT_novyTicket_Click(object sender, EventArgs e)
    {
        Response.Redirect("NovyTicket.aspx");
    }

    protected void BT_zobrazit_Click(object sender, EventArgs e)
    {
        int i = LB_ticket.SelectedIndex;
        TB_text.Text = tickets[i].text;
        TB_reply.Text = tickets[i].odpoved;
    }


}