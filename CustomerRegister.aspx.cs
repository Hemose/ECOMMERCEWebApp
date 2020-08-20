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
    public partial class CustomerRegister : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void register(object sender, EventArgs e)
        {
            String constr = ConfigurationManager.ConnectionStrings["database"].ToString();
            SqlConnection mydp = new SqlConnection(constr);
            string user_name = TextBox1.Text;
            string first_name = TextBox2.Text;
            string last_name = TextBox3.Text;
            string password = TextBox4.Text;
            string email = TextBox5.Text;


            SqlCommand insertProc = new SqlCommand("customerRegister", mydp);
            insertProc.CommandType = CommandType.StoredProcedure;
            insertProc.Parameters.Add(new SqlParameter("@username", user_name));
            insertProc.Parameters.Add(new SqlParameter("@ﬁrst_name", first_name));
            insertProc.Parameters.Add(new SqlParameter("@last_name ", last_name));
            insertProc.Parameters.Add(new SqlParameter("@password", password));
            insertProc.Parameters.Add(new SqlParameter("@email", email));

            mydp.Open();
            try
            {
                insertProc.ExecuteNonQuery();
                Response.Write("Registeration Completed");

            }
            catch (SqlException)
            {
                Response.Write("this username is already taken");
            }

            /*  Label l1 = new Label();
              l1.Text = str+" is inserted"+"<br />";
              frontend1.Controls.Add(l1);
              */
            mydp.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("/login.aspx");
        }
    }
}