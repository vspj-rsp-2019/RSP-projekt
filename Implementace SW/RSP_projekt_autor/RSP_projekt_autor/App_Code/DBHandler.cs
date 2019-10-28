using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Trida pro spravu pristupu k databazi
/// </summary>
public class DBHandler
{
    public string connectionString { get; set; }
    public DBHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DBHandler(string s)
    {
        connectionString = s;
    }

    public Boolean registerUser(User user)
    {
        String hesloHashString = Convert.ToBase64String(getHash(user.Heslo));
        String query = @"INSERT INTO Users(role, email, jmeno, prijmeni, hesloHash) VALUES
                        (@role, @email,@jmeno,@prijmeni,@hesloHash)";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand insert = new SqlCommand(query, conn);

                insert.Parameters.AddWithValue("@role", user.Role);
                insert.Parameters.AddWithValue("@email", user.Email);
                insert.Parameters.AddWithValue("@jmeno", user.Jmeno);
                insert.Parameters.AddWithValue("@prijmeni", user.Prijmeni);
                insert.Parameters.AddWithValue("@hesloHash", hesloHashString);
                insert.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                return false;
            }
        }
        return true;
    }
    public User loginUser(string login, string password)
    {
        User user = new User();
        String hesloHashString = Convert.ToBase64String(getHash(password));
        String originalHash = "";
        String query = @"SELECT * FROM Users WHERE email =@email";

        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmnd = new SqlCommand(query, conn);
                cmnd.Parameters.AddWithValue("@email", login);


                using (SqlDataReader dr = cmnd.ExecuteReader())
                {

                    while (dr.Read())
                    {
                        user.id = dr.GetInt32(0);
                        user.Role = dr.GetString(1);
                        user.Jmeno = dr.GetString(3);
                        user.Prijmeni = dr.GetString(4);
                        originalHash = dr.GetString(5);
                    }

                }

                if (!hesloHashString.Equals(originalHash))
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                return null;
            }
        }
        return user;
    }
    public List<String> getAllLogins()
    {
        List<String> logins = new List<string>();
        String query = "SELECT email FROM Users";

        using(SqlConnection conn = new SqlConnection(connectionString))
        {
            try
            {
                if(conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmnd = new SqlCommand(query, conn);

                using (SqlDataReader dr = cmnd.ExecuteReader())
                {
                    while (dr.Read())
                    {
                        logins.Add(dr.GetString(0));
                    }
                }

            }catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                return logins;
            }
        }
        return logins;
    }
    public void uploadFile(int userId, int vydaniId, string fileName, string filePath)
    {
        string query = "INSERT INTO Clanky(autor_id, vydani_id, nazev, filePath, Datum) VALUES (@id, @vydani, @name, @path, @date)";
        
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            try
            {
                if(conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", userId);
                cmd.Parameters.AddWithValue("@vydani", vydaniId);
                cmd.Parameters.AddWithValue("@name", fileName);
                cmd.Parameters.AddWithValue("@path", filePath);
                cmd.Parameters.AddWithValue("@date", DateTime.Today);

                cmd.ExecuteNonQuery();
            }catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }
    }
    public int pocetClankuVydani(int idVydani)
    {
        int count = 0;
        String query = "SELECT COUNT(Id) FROM Clanky WHERE vydani_id=@idVydani";
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            try
            {
                if(conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
            
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@idVydani", idVydani);

                using (SqlDataReader dr = cmd.ExecuteReader()) {
                    while (dr.Read())
                    {
                        count = dr.GetInt32(0);
                    }
                }
            }catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }
        return count;
    }
    private static byte[] getHash(string input)
    {
        HashAlgorithm algo = SHA256.Create();
        return algo.ComputeHash(Encoding.UTF8.GetBytes(input));
    }
}