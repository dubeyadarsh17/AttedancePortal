using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;

        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        string currentdate=DateTime.Now.Date.ToString("dd/MM/yyyy");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Showdata();
                Check_attendance();
                //timeBreak();
                ShowUserAttendance();
            }
           
        }

        public void Showdata()
        {
            empnamelbl.Text = Session["emp_name"].ToString();
            empdesiglbl.Text = Session["emp_desig"].ToString();
            empimg.ImageUrl = Session["emp_profileimg"].ToString();
        }

        protected void TimeIn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = new SqlCommand("Emp_Attendance_sprocs", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "insert");
            cmd.Parameters.AddWithValue("@emp_id", Convert.ToInt32(Session["id"]));
            int result = cmd.ExecuteNonQuery();
            if (result == 1)
            {
                Timeout.Visible = true;
                TimeIn.Visible = false;

                msgboxlbl.Text = "Your Attedance for " + currentdate + " has beenmarked";
                ShowUserAttendance();
            }
            else
            {
                Timeout.Visible = false;
                TimeIn.Visible = true;
                msgboxlbl.Text = "Mark your Attedance for " + currentdate;
            }
        }


        public void Check_attendance()
        {
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = new SqlCommand("Emp_Attendance_sprocs", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "check");
            cmd.Parameters.AddWithValue("@emp_id", Convert.ToInt32(Session["id"]));
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string count = dr[0].ToString();
                string count1 = dr[1].ToString();

                if (Convert.ToInt32(count) == 1 && Convert.ToInt32(count1)==0)
                {
                    Timeout.Visible = true;
                    TimeIn.Visible = false;
                    msgboxlbl.Text = " Your Attedance for " + currentdate+ " has been marked";
                }

                else if (Convert.ToInt32(count) == 1 && Convert.ToInt32(count1) == 1)
                {
                    Timeout.Visible = false;
                    TimeIn.Visible = false;
                    msgboxlbl.Text = "Your Attedance for " + currentdate + " has been Recorded";
                }
                else
                  {
                    Timeout.Visible = false;
                    TimeIn.Visible = true;
                    msgboxlbl.Text = "Mark your Attedance for " + currentdate;
                }
            }
            con.Close();
            

        }

        protected void Timeout_Click(object sender, EventArgs e)
        {
            DateTime timeout = DateTime.Now;
            string timeonly = timeout.ToString("hh:mm tt");
            DataSet ds = ObjBal.GetAttendanceData(Convert.ToInt32(Session["id"]));
            if (ds.Tables[0].Rows.Count > 0)
            {
                var timein = ds.Tables[0].Rows[0][3].ToString();
                TimeSpan duration = DateTime.Parse(timeonly).Subtract(DateTime.Parse(timein));

                ObjBal.UpdateAttendanceData((Convert.ToInt32(Session["id"])), Convert.ToString(duration));
            }


            Response.Redirect("Attendance.aspx");
        }

       


        public void ShowUserAttendance()
        {
            DataSet ds = ObjBal.UserAttendanceRecord((Convert.ToInt32(Session["id"])));
            User_attendance.DataSource = ds;
            User_attendance.DataBind();
        }

        protected void datefilter_Click(object sender, EventArgs e)
        {
            //if (fromdate.Text == "" && todate.Text == "")
            //{
            //    errorlbl.Text = "Please select FromDate & ToDate";
            //}
            //else if (fromdate.Text == "")
            //{
            //    errorlbl.Text = "Please select FromDate ";
            //}
            //else if(todate.Text == "")
            //{
            //    errorlbl.Text = "Please select  ToDate";
            //}
            //else
            //{
                var fdate = Convert.ToDateTime(fromdate.Text).ToString("dd/MM/yyyy");
                var tdate = Convert.ToDateTime(todate.Text).ToString("dd/MM/yyyy");
                DataSet ds = ObjBal.UserDateFilterAttendance((Convert.ToInt32(Session["id"])), fdate, tdate);
                User_attendance.DataSource = ds;
                User_attendance.DataBind();
            //}
        }

        protected void User_attendance_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            foreach (RepeaterItem item in User_attendance.Items)
            {
                Label value = item.FindControl("status") as Label;

                if (value.Text == "p")
                {

                    value.ForeColor = System.Drawing.Color.Green;
                    value.BackColor = System.Drawing.Color.White;
                }
                else
                {
                    value.ForeColor = System.Drawing.Color.Red;
                    value.BackColor = System.Drawing.Color.White;
                }
            }
        }
    }
}