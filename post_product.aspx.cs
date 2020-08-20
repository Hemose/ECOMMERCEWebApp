using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace ECOMMERCEWebApp
{
    public partial class post_product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void postproduct(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["database"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("postproduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
            string product_name = TextBox2.Text;
            string category = TextBox3.Text;
            string product_description = TextBox4.Text;
            string price = TextBox5.Text;
            string color = TextBox6.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@vendorUsername", (String)(Session["userr"])));
            cmd.Parameters.Add(new SqlParameter("@product_name", product_name));
            cmd.Parameters.Add(new SqlParameter("@category", category));
            cmd.Parameters.Add(new SqlParameter("@product_description", product_description));
            cmd.Parameters.Add(new SqlParameter("@price", price));
            cmd.Parameters.Add(new SqlParameter("@color", color));

            //Save the output from the procedure
            //   SqlParameter count = cmd.Parameters.Add("@count", SqlDbType.Int);
            // count.Direction = ParameterDirection.Output;

            //Executing the SQLCommand
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("Product Added !!");
            }
            catch
            {
                Response.Write("please enter correct values");
            }
            conn.Close();
        }

        protected void showproducts(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["database"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            using (SqlCommand cmd = new SqlCommand("vendorviewProducts", conn))
            {
                String ven = (String)(Session["userr"]);
                cmd.Parameters.Add(new SqlParameter("@vendorname", ven));
                cmd.CommandType = CommandType.StoredProcedure;
                conn.Open();
                using (SqlDataReader x = cmd.ExecuteReader())
                {
                    GridView1.DataSource = x;
                    GridView1.DataBind();
                }
                conn.Close();

            }       
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("home page vendor.aspx", true);

        }
    }
}