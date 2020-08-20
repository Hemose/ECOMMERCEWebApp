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
    public partial class WebForm1 : System.Web.UI.Page
    {
        static string connStr = ConfigurationManager.ConnectionStrings["database"].ToString();
        static SqlConnection conn = new SqlConnection(connStr);
        protected void Page_Load(object sender, EventArgs e)
        {
            Label6.Text = (string)Session["userr"];
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("/products.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Cart.aspx");
        }


        protected void Button9_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("AddCreditCard", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            String num = TextBox1.Text;
            String dat = TextBox2.Text;
            String cc = TextBox3.Text;
            cmd.Parameters.Add(new SqlParameter("@customername", (String)(Session["userr"])));
            cmd.Parameters.Add(new SqlParameter("@creditcardnumber", num));
            cmd.Parameters.Add(new SqlParameter("@expirydate", dat));
            cmd.Parameters.Add(new SqlParameter("@cvv", cc));

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("The Credit Card Added Correctly");
            }
            catch (Exception)
            {
                Response.Write("This Credit Card is already exist or one of the data is incorrect");
            }
            conn.Close();
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("createWishlist", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            String ser = TextBox4.Text;
            cmd.Parameters.Add(new SqlParameter("@customername", (String)(Session["userr"])));
            cmd.Parameters.Add(new SqlParameter("@name", ser));

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("The WishList Added Correctly");
            }
            catch (Exception)
            {
                Response.Write("This WishList is already exists");
            }
            conn.Close();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("cancelOrder", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            String ser = TextBox5.Text;
            cmd.Parameters.Add(new SqlParameter("@orderid", ser));
            cmd.Parameters.Add(new SqlParameter("@customername",(String) Session["userr"]));              
            conn.Open();


            try
            {
                cmd.ExecuteNonQuery();


                Response.Write("The Order Canceled ");
       
            }
            catch (Exception)
            {
                Response.Write("The order number is incorrect or the order state can't be canceled");
            }
                conn.Close();

        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            Response.Redirect("/login.aspx");
        }
    }
}