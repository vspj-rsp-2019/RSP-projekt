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

public partial class odpovedTicket : System.Web.UI.Page
{
    User user;

    SqlCommand cmd;
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    List<TicketClass> tickets = new List<TicketClass>();

    int selectedTicket = -1;
    protected void Page_Load(object sender, EventArgs e)
    {
        user = (User)Session["userObject"];
        if (user == null || user.Role.ToLower().Equals("autor"))
        {
            Response.Redirect("Default.aspx");
        }
        if (tickets.Count == 0)
        {
            try
            {
                String query = "SELECT * FROM Tickets WHERE role_cil = @role AND odpovezeno = @odp";
                con.Open();
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@role", user.Role);
                cmd.Parameters.AddWithValue("@odp", 0);

                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        int id = dr.GetInt32(0);
                        int autor_id = dr.GetInt32(1);
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
                        TicketClass tmp = new TicketClass(autor_id, titul, text, reply, cil, odp);
                        tmp.id = id;
                        tickets.Add(tmp);
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }
        if (LB_ticket.Items.Count == 0)
        {
            reloadLB();
        }
    }

    protected void BT_select_Click(object sender, EventArgs e)
    {
        if (LB_ticket.SelectedIndex != -1)
        {
            selectedTicket = LB_ticket.SelectedIndex;
            TB_text.Text = tickets[selectedTicket].text;
            TB_autor.Text = getJmenoAutora(tickets[selectedTicket]);
        } else LB_msg0.Text = "Není vybrán žádný ticket";
    }

    protected void TB_ticketText_TextChanged(object sender, EventArgs e)
    {
    }

    protected String getJmenoAutora(TicketClass t)
    {
        String name = "";

        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        string query = "SELECT jmeno, prijmeni FROM users WHERE id = @id;";
        cmd = new SqlCommand(query, con);
        cmd.Parameters.AddWithValue("@id", t.autor);

        using (SqlDataReader dr = cmd.ExecuteReader())
        {
            while (dr.Read())
            {
                name += dr.GetString(0);
                name += " ";
                name += dr.GetString(1);
            }
        }
        return name;
    }

    protected void LB_ticket_SelectedIndexChanged(object sender, EventArgs e)
    {
    }

    protected void BT_reply_Click(object sender, EventArgs e)
    {
        if (TB_odp.Text == "")
        {
            LB_msg.Text = "Prázdná odpověď";
            return;
        }
        selectedTicket = LB_ticket.SelectedIndex;
        tickets[selectedTicket].odpoved = TB_odp.Text;
        tickets[selectedTicket].odpovezeno = true;

        if (updateTicket(tickets[selectedTicket]))
        {
            LB_msg.Text = "Odpověď odeslána";
            LB_ticket.Items.Clear();
            reloadLB();
            Page.Response.Redirect(Page.Request.Url.ToString(), false);
        }
        else
        {
            LB_msg.Text = "Nastala chyba";
        }
    }

    protected bool updateTicket(TicketClass t)
    {
        try
        {
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            string query = "UPDATE Tickets SET odpoved=@reply, odpovezeno=@odp WHERE id = @id;";
            cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@reply", t.odpoved);
            cmd.Parameters.AddWithValue("@odp", t.odpovezeno);
            cmd.Parameters.AddWithValue("@id", t.id);
            cmd.ExecuteNonQuery();
            return true;
        }
        catch(Exception ex)
        {
            System.Diagnostics.Debug.WriteLine(ex.Message);
            return false;
        }
    }

    protected void reloadLB()
    {
        foreach (var tick in tickets)
        {
            LB_ticket.Items.Add(tick.ToString());
        }
    }
}