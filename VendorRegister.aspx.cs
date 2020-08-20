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

    public partial class VendorRegister : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void register(object sender, EventArgs e)
        {
            String constr = ConfigurationManager.ConnectionStrings["database"].ToString();
            SqlConnection mydp = new SqlConnection(constr);
            string user_name = TextBoxv1.Text;
            string first_name = TextBoxv2.Text;
            string last_name = TextBoxv3.Text;
            string password = TextBoxv4.Text;
            string email = TextBoxv5.Text;
            string company_name = TextBoxv6.Text;
            string bank_acc_no = TextBoxv7.Text;

            SqlCommand insertProc = new SqlCommand("vendorRegister", mydp);
            insertProc.CommandType = CommandType.StoredProcedure;
            insertProc.Parameters.Add(new SqlParameter("@username", user_name));
            insertProc.Parameters.Add(new SqlParameter("@ﬁrst_name", first_name));
            insertProc.Parameters.Add(new SqlParameter("@last_name ", last_name));
            insertProc.Parameters.Add(new SqlParameter("@password", password));
            insertProc.Parameters.Add(new SqlParameter("@email", email));
            insertProc.Parameters.Add(new SqlParameter("@company_name", company_name));
            insertProc.Parameters.Add(new SqlParameter("@bank_acc_no", bank_acc_no));


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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/login.aspx");
        }
    }
}