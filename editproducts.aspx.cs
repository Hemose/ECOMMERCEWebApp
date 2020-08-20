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
    public partial class editproducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void editproduct(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["database"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("EditProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            //To read the input from the user
      
            string serialno = TextBox2.Text;
            string product_name = TextBox3.Text;
            string category = TextBox4.Text;
            string product_description = TextBox5.Text;
            string price = TextBox6.Text;
            string color = TextBox7.Text;


            //pass parameters to the stored procedure
            cmd.Parameters.Add(new SqlParameter("@vendorname", (String)(Session["userr"])));
            cmd.Parameters.Add(new SqlParameter("@serialnumber", serialno));
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
            }
            catch
            {
                Response.Write("please enter correct values");
            }
            conn.Close();
        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("home page vendor.aspx", true);
        }
    }
}
