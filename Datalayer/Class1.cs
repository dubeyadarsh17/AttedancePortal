using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Datalayer
{
    public class DataAccesses
    {
        string conn = ConfigurationManager.ConnectionStrings["abcCon"].ConnectionString;

        // iNSERT User Data
        public int InsertData(string name, string lastname, string password, string position, string referance, string resume, string street_near, int pin_code, string place, string country, string mobile, string email)
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                using (SqlCommand cmd = new SqlCommand("myprocedure", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "Insert");
                    cmd.Parameters.AddWithValue("@First_Name", name);
                    cmd.Parameters.AddWithValue("@Last_Name", lastname);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Position", position);
                    cmd.Parameters.AddWithValue("@Reference", referance);
                    cmd.Parameters.AddWithValue("@Resume", resume);
                    cmd.Parameters.AddWithValue("@Street_Near", street_near);
                    cmd.Parameters.AddWithValue("@Pin_Code", pin_code);
                    cmd.Parameters.AddWithValue("@Place", place);
                    cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Parameters.AddWithValue("@Mobile_No", mobile);
                    cmd.Parameters.AddWithValue("@Email_Id", email);
                    cmd.Parameters.AddWithValue("@UserType", "User");
                    cmd.Parameters.AddWithValue("@Marks", -1);
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    return result;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        // Login Datta
        public DataSet LoginUser(string useremail, string userpass)
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                using (SqlCommand cmd = new SqlCommand("myprocedure", con))
                {
                    con.Open();
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "Login");
                    cmd.Parameters.AddWithValue("@Email_Id", useremail);
                    cmd.Parameters.AddWithValue("@Password", userpass);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    return ds;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // Not duplicate Email && Mobile
        public DataTable usercout(string mobile, string email)
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                using (SqlCommand cmd = new SqlCommand("myprocedure", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "userCo");
                    cmd.Parameters.AddWithValue("@Mobile_No", mobile);
                    cmd.Parameters.AddWithValue("@Email_Id", email);
                    //cmd.Parameters.AddWithValue("@Id",Convert.ToInt32(id));
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // Update Marks
        public void UpdateMarks(int marks, int id)
        {
            try
            {
                SqlConnection con = new SqlConnection(conn);
                con.Open();
                using (SqlCommand cmd = new SqlCommand("myprocedure", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "Updatemarks");
                    cmd.Parameters.AddWithValue("@Marks", marks);
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        // HrPortal
        public DataTable ShowHrData(string status_R1, string status_R2,int marks)
        {
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            using (SqlCommand cmd = new SqlCommand("myprocedure", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "HrPortalstatus");
                cmd.Parameters.AddWithValue("@Status_R1", status_R1);
                cmd.Parameters.AddWithValue("@Status_R2", status_R2); 
                cmd.Parameters.AddWithValue("@Marks", marks);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
        // Show Data
        public DataTable showData()
        {
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            using (SqlCommand cmd = new SqlCommand("myprocedure", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "showAllData");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        // Requiter1 Data Show
        public DataTable ShowRD()
        {

            SqlConnection con = new SqlConnection(conn);
            con.Open();
            using (SqlCommand cmd = new SqlCommand("myprocedure", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "showR1Data");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
        // Requiter2 Data Show
        public DataTable ShowRD2(string status)
        {

            SqlConnection con = new SqlConnection(conn);
            con.Open();
            using (SqlCommand cmd = new SqlCommand("myprocedure", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "showR1Data");
                cmd.Parameters.AddWithValue("@Status_R1", status);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
        // FeedBack  R1
        public int ShowIn1(int id, string feedback, string status)
        {

            SqlConnection con = new SqlConnection(conn);
            con.Open();
            using (SqlCommand cmd = new SqlCommand("myprocedure", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "input_R1");
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Feed_R1", feedback);
                cmd.Parameters.AddWithValue("@Status_R1", status);
                int result = cmd.ExecuteNonQuery();
                return result;
            }
        }
        // FeedBack  R2
        public int ShowIn2(int id, string feedback, string status)
        {

            SqlConnection con = new SqlConnection(conn);
            con.Open();
            using (SqlCommand cmd = new SqlCommand("myprocedure", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "input_R2");
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Feed_R1", feedback);
                cmd.Parameters.AddWithValue("@Status_R1", status);
                int result = cmd.ExecuteNonQuery();
                return result;
            }
        }
        // FeedBack  HR
        public int ShowHr(int id, string feedback, string status)
        {

            SqlConnection con = new SqlConnection(conn);
            con.Open();
            using (SqlCommand cmd = new SqlCommand("myprocedure", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Action", "input_Hr");
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Hr_Feed", feedback);
                cmd.Parameters.AddWithValue("@Status_Hr", status);
                int result = cmd.ExecuteNonQuery();
                return result;
            }
        }
    }
}
