using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class NoveClanky : System.Web.UI.Page

{
    // Vytvori pripojeni k databazi 
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    SqlCommand sqlCmd;
    string sql = null;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

    }

    protected void HyperLink1_DataBinding(object sender, EventArgs e)
    {
        //GridView1.SelectedValue
            
        //    ([autor_id] = @autor_id)
        //Clanky filePath
    }

    protected void btn_zobraz_pdf_Click(object sender, EventArgs e)
    {
    }
}