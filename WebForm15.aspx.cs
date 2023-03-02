using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    public partial class WebForm15 : System.Web.UI.Page
    {
		string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;
		protected void Page_Load(object sender, EventArgs e)
        {

        }



        public class userDetails
        {
            public string firstName;
            public string lastName;
            public string location;
        }


        
		public string findCourse(string userDetails)
		{
			try
			{
				using (SqlConnection con = new SqlConnection(conn))
				{
					using (SqlCommand cmd = new SqlCommand())
					{
						cmd.CommandText = "insertNewUser";
						cmd.CommandType = CommandType.StoredProcedure;
						cmd.Connection = con;

						cmd.Parameters.AddWithValue("@firstName", userDetails);
						//cmd.Parameters.AddWithValue("@lastName", userDetails.lastName);
						//cmd.Parameters.AddWithValue("@location", userDetails.location);
						con.Open();
						cmd.ExecuteNonQuery();
					}
					con.Close();
				}
				return "success";
			}
			catch (Exception )
			{
				return "Error";         
			}
		}
		[WebMethod]
		public static string find(string a)
        {
		
			return a;
        }

	}
}