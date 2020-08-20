using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECOMMERCEWebApp
{
    public partial class products : System.Web.UI.Page
    {
        static string connStr = ConfigurationManager.ConnectionStrings["database"].ToString();
        static SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("ShowProductsbyPrice", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();
            //IF the output is a table, then we can read the records one at a time
            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            GridView1.DataSource = rdr;
            GridView1.DataBind();
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlCommand cmd = new SqlCommand("addToCart", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            String ser = TextBox1.Text;
            cmd.Parameters.Add(new SqlParameter("@customername", (String)(Session["userr"])));
            cmd.Parameters.Add(new SqlParameter("@serial", ser));

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("The Product added Correctly");
            }
            catch (Exception)
            {
                Response.Write("This product is already in the cart or the serial number is incorrect");
            }
            conn.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("AddtoWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            String ser = TextBox2.Text;
            String wname = TextBox3.Text;
            cmd.Parameters.Add(new SqlParameter("@customername", (String)(Session["userr"])));
            cmd.Parameters.Add(new SqlParameter("@serial", ser));
            cmd.Parameters.Add(new SqlParameter("@wishlistname", wname));
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("The Product added Correctly");
            }
            catch (Exception)
            {
                Response.Write("This product is already in the WishList or (the serial number / WishLlist Name) is incorrect ");
            }
            conn.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("removefromWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            String ser = TextBox4.Text;
            String wname = TextBox5.Text;
            cmd.Parameters.Add(new SqlParameter("@customername", (String)(Session["userr"])));
            cmd.Parameters.Add(new SqlParameter("@serial", ser));
            cmd.Parameters.Add(new SqlParameter("@wishlistname", wname));
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("The Product Removed Correctly");
            }
            catch (Exception)
            {
            }
            conn.Close();

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Home.aspx");
        }
    }
}