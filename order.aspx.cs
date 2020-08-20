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
    public partial class order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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


            if (COST.SqlValue.ToString() == "Null")
            Label1.Text = "0";
            else
            Label1.Text = COST.SqlValue.ToString();

            Label2.Text = Orderid.Value.ToString();


            /*  Label l1 = new Label();
              l1.Text = str+" is inserted"+"<br />";
              frontend1.Controls.Add(l1);
              */
            mydp.Close();
        }


        protected void makeorder(object sender, EventArgs e)
        {
            
            Response.Redirect("/payment.aspx");
         //   mydp.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Home.aspx");
        }

    }
}