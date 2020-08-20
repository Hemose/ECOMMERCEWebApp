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
    public partial class payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String constr = ConfigurationManager.ConnectionStrings["database"].ToString();
            SqlConnection mydp = new SqlConnection(constr);
            SqlCommand cmd1 = new SqlCommand("getorderNo", mydp);
            cmd1.CommandType = CommandType.StoredProcedure;
            cmd1.Parameters.Add(new SqlParameter("@username", Session["userr"]));
            SqlParameter ord_id = cmd1.Parameters.Add("@order_no", SqlDbType.Int);
            ord_id.Direction = ParameterDirection.Output;
            mydp.Open();
            cmd1.ExecuteNonQuery();
            Label2.Text = (ord_id.Value).ToString();
            mydp.Close();

        }
        protected void specify_amount(object sender, EventArgs e)
        {
            
            String constr = ConfigurationManager.ConnectionStrings["database"].ToString();
            SqlConnection mydp = new SqlConnection(constr);

            SqlCommand cmd = new SqlCommand("showOrder", mydp);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@customername", Session["userr"]));
            SqlParameter COST = cmd.Parameters.Add("@cost", SqlDbType.Decimal);
            SqlParameter Orderid = cmd.Parameters.Add("@Orderid", SqlDbType.Int);
             
            COST.Direction = ParameterDirection.Output;
            Orderid.Direction = ParameterDirection.Output;
                mydp.Open();
                cmd.ExecuteNonQuery();
          
                SqlCommand cmd2 = new SqlCommand("SpecifyAmount", mydp);
                cmd2.CommandType = CommandType.StoredProcedure;
                cmd2.Parameters.Add(new SqlParameter("@customername", Session["userr"]));
                cmd2.Parameters.Add(new SqlParameter("@orderID", Orderid.Value));
                cmd2.Parameters.Add(new SqlParameter("@cash", TextBox1.Text));
                cmd2.Parameters.Add(new SqlParameter("@credit", TextBox2.Text));
                try
               {
                    /* if (((double.Parse(COST.Value.ToString()) > double.Parse(TextBox1.Text)) && ((double.Parse(COST.Value.ToString()) > double.Parse(TextBox2.Text)))))
                     {
                         Response.Write("You Have not enough points");


                     }
                     else
                     {*/
                    try
                    {
                        cmd2.ExecuteNonQuery();
                        SqlCommand cmd3 = new SqlCommand("ChooseCreditCard", mydp);
                        cmd3.CommandType = CommandType.StoredProcedure;
                        cmd3.Parameters.Add(new SqlParameter("@creditcard", TextBox3.Text));
                        cmd3.Parameters.Add(new SqlParameter("@orderID", Orderid.Value));
                        try
                        {
                            cmd3.ExecuteNonQuery();


                            ////
                            SqlCommand cmdd = new SqlCommand("makeOrder", mydp);
                            cmdd.CommandType = CommandType.StoredProcedure;
                            cmdd.Parameters.Add(new SqlParameter("@customername", Session["userr"]));

                            try
                            {
                                cmdd.ExecuteNonQuery();
                            }
                            catch (Exception)
                            {
                                Response.Write("you cannot order now");
                            }
                            Response.Write("ORDER IS SUBMITED");
                            ////
                        }
                        catch (SqlException)
                        {
                            Response.Write("You must enter valid credit card");
                        }

                    }
                    catch (SqlException)
                    {
                        Response.Write("You Have not enough points");
                    }

                    //  }

                }
               catch (Exception)
                {
                    Response.Write("wrong format");
                }
            
            mydp.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/order.aspx");
        }
    }
}