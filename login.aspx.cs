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
    public partial class login : System.Web.UI.Page
    {
        static String constr = ConfigurationManager.ConnectionStrings["database"].ToString();
        static SqlConnection mydp = new SqlConnection(constr);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void loginn(object sender, EventArgs e)
        {


            SqlCommand cmd = new SqlCommand("userLogin", mydp);
            cmd.CommandType = CommandType.StoredProcedure;

            string username = txt_username.Text;
            string password = txt_password.Text;

            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));

            SqlParameter success = cmd.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter typ = cmd.Parameters.Add("@type", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            typ.Direction = ParameterDirection.Output;
            //Executing the SQLCommand
            mydp.Open();
            cmd.ExecuteNonQuery();
            mydp.Close();
            Session["userr"] = username;

            if (success.Value.ToString().Equals("1"))
            {
                if (typ.Value.ToString().Equals("0"))
                {
                    Response.Redirect("/Home.aspx");
                }
                if (typ.Value.ToString().Equals("1"))
                {
                    Response.Redirect("/home page vendor.aspx");

                }


                /*ASP.NET session state enables you to store and retrieve values for a user
                as the user navigates ASP.NET pages in a Web application.
                This is how we store a value in the session*/
                //To navigate to another webpage
                //  Response.Redirect("Companies.aspx", true);

            }
            else
            {
                Response.Write("Failed");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerRegister.aspx", true);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/VendorRegister.aspx");
        }

        protected void txt_username_TextChanged(object sender, EventArgs e)
        {

        }
    }
}

