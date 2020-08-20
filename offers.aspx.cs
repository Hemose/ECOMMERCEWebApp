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
    public partial class offers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void create_offer(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["database"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("addOffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string offer_amount = TextBox1.Text;
            string expiry_date = TextBox2.Text;

            cmd.Parameters.Add(new SqlParameter("@offeramount", offer_amount));
            cmd.Parameters.Add(new SqlParameter("@expiry_date", expiry_date));

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("THE OFFER ADDED !!");
            }
            catch
            {
                Response.Write("please enter correct values");
            }
            conn.Close();
        }

        protected void Apply_offer(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["database"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("applyOffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string oﬀerid = TextBox4.Text;
            string serial = TextBox5.Text;

            cmd.Parameters.Add(new SqlParameter("@VENDOR_USERNAME", (String)(Session["userr"])));
            cmd.Parameters.Add(new SqlParameter("@offerid", oﬀerid));
            cmd.Parameters.Add(new SqlParameter("@serial", serial));
            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("OFFER APPLIED SUCCESSFULLY");
            }
            catch
            {
                Response.Write("please enter correct values");
            }
            conn.Close();
        }

        protected void remove(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["database"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);

            /*create a new SQL command which takes as parameters the name of the stored procedure and
             the SQLconnection name*/
            SqlCommand cmd = new SqlCommand("checkandremoveExpiredoffer", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            string offer_id = TextBox6.Text;

            cmd.Parameters.Add(new SqlParameter("@offer_id", offer_id));

            conn.Open();
            
            try
            {
                cmd.ExecuteNonQuery();        
                Response.Write("DONE !!");
            }
            catch
            {
                Response.Write("please enter correct values and enter an Id of exist offer");
            }
            conn.Close();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("home page vendor.aspx", true);
        }

    }
}