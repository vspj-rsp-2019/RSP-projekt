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
public class Autor
{
    public String Jmeno { get; set; }
    public String Prijmeni { get; set; }
    public String Email { get; set; }
    public String Heslo { get; set; }
    private String connString;

    public Autor()
    {
        connString = @"Data Source=(LocalDB)\MSSQLLocalDB;
                                        AttachDbFilename=|DataDirectory|\Database.mdf;
                                        Integrated Security=True;Connect Timeout=30";
    }
    ~Autor()
    {
    }
    public Boolean register()
    {
        String hesloHashString = System.Text.Encoding.UTF8.GetString(getHash(this.Heslo));
        String query = @"INSERT INTO Autori(email, jmeno, prijmeni, hesloHash) VALUES
                        (@email,@jmeno,@prijmeni,@hesloHash)";

        using (SqlConnection conn = new SqlConnection(connString))
        {
            try
            {
                if(conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand insert = new SqlCommand(query, conn);

                insert.Parameters.AddWithValue("@email", this.Email);
                insert.Parameters.AddWithValue("@jmeno", this.Jmeno);
                insert.Parameters.AddWithValue("@prijmeni", this.Prijmeni);
                insert.Parameters.AddWithValue("@hesloHash", hesloHashString);
                insert.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                return false;
            }
        }
        return true;
    }
    private static byte[] getHash(string input)
    {
        HashAlgorithm algo = SHA256.Create();
        return algo.ComputeHash(Encoding.UTF8.GetBytes(input));
    }
}
