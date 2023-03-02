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
    public partial class WebForm14 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        public class userDetails
        {
            public string start;
            public string end;
            public string title;
            public string description;
        }



        [WebMethod]
        public static string addNewUser(userDetails objuserDetails)
        {
            try
            {
                // parse the start and end dates from the JSON data
                DateTime startDate = DateTime.Parse(objuserDetails.start);
                //DateTime endDate = DateTime.Parse(end);

                string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;

                SqlConnection con = new SqlConnection(conn);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Calender_tbl values (@Date,@EmpId,@Event,@Description,@Status)", con);
                cmd.Parameters.AddWithValue("@Date", startDate);
                //cmd.Parameters.AddWithValue("@EmpId", Convert.ToInt32(Session["id"]));
                cmd.Parameters.AddWithValue("@Event", objuserDetails.title);
                cmd.Parameters.AddWithValue("@Description", objuserDetails.description);
                cmd.Parameters.AddWithValue("@Status", null);
                int result = cmd.ExecuteNonQuery();
                con.Close();
                return "success";
            }
            catch (Exception)
            {
                return "Error";
            }


        }



       
    }
}