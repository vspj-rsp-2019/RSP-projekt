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
    public String Role { get; }
    private Boolean loggedIn;
    private String connString;

    public User()
    {
        Role = "autor"; //todo zmenit
        loggedIn = false;
        connString = @"Data Source=(LocalDB)\MSSQLLocalDB;
                                        AttachDbFilename=|DataDirectory|\Database.mdf;
                                        Integrated Security=True;Connect Timeout=30";
    }
    ~User()
    {
    }
    public Boolean Register()
    {
        //String hesloHashString = System.Text.Encoding.UTF8.GetString(getHash(this.Heslo));
        String hesloHashString = Convert.ToBase64String(getHash(this.Heslo));
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
    public Boolean Login()
    {
        // String hesloHashString = System.Text.Encoding.UTF8.GetString(getHash(this.Heslo));
        String hesloHashString = Convert.ToBase64String(getHash(this.Heslo));
        String originalHash = "";
        String query = @"SELECT * FROM Autori WHERE email =@email";

        using (SqlConnection conn = new SqlConnection(connString))
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmnd = new SqlCommand(query, conn);
                cmnd.Parameters.AddWithValue("@email", this.Email);
                

                using(SqlDataReader dr = cmnd.ExecuteReader()){

                    while (dr.Read())
                    {
                        this.Jmeno = dr.GetString(2);
                        this.Prijmeni = dr.GetString(3);
                        originalHash = dr.GetString(4);
                    }
                    
                }

                if (hesloHashString.Equals(originalHash))
                {
                    loggedIn = true;
                }
            }
            catch(Exception ex)
            {
                return false;
            }
        }
        
        return loggedIn;
    }
    private static byte[] getHash(string input)
    {
        HashAlgorithm algo = SHA256.Create();
        return algo.ComputeHash(Encoding.UTF8.GetBytes(input));
    }
}
