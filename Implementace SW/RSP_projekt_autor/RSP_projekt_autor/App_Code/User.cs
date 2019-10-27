using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;


/// <summary>
/// Summary description for Autor
/// </summary>
public class User
{
    public String Jmeno { get; set; }
    public String Prijmeni { get; set; }
    public String Email { get; set; }
    public String Heslo { get; set; }
    public String Role { get; set; }
    public int id { get; set; }


    public User(string role = "autor")
    {
        this.Role = role;
    }
    ~User()
    {
    }

}
