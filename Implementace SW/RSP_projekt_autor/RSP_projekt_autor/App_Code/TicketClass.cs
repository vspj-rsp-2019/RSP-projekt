using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Ticket
/// </summary>
public class TicketClass
{
    public int autor { get; set;}
    public String text { get; set; }
    public String odpoved { get; set; }
    public String cil { get; set; }
    public bool odpovezeno { get; set; }
    public TicketClass(int id, String t, String o, String c, bool r = false)
    {
        autor = id;
        text = t;
        odpoved = o;
        cil = c;
        odpovezeno = r;
    }
}