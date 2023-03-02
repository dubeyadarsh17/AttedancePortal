using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace AttedancePortal
{
    public partial class graph : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;
        int jan, feb, march, april, may, june, july, august, sep, oct, nov, dec;

        protected void Page_Load(object sender, EventArgs e)
        
        {
            if (!this.IsPostBack)
            {
                YearChartAttendanceData();
                janhdn1.Value = Convert.ToString(jan);
                febhdn.Value = Convert.ToString(feb);
                marchhdn.Value = Convert.ToString(march);
                aprilhdn.Value = Convert.ToString(april);
                mayhdn.Value = Convert.ToString(may);
                junehdn.Value = Convert.ToString(june);
                julyhdn.Value = Convert.ToString(july);
                aughdn.Value = Convert.ToString(august);
                septhdn.Value = Convert.ToString(sep);
                octhdn.Value = Convert.ToString(oct);
                novhdn.Value = Convert.ToString(nov);
                deschdn.Value = Convert.ToString(dec);
            }
        }

       

        public void YearChartAttendanceData()
        {
            for (int i = 1; i <= 12; i++)
            {
                SqlConnection con = new SqlConnection(conn);
                con.Open();
                SqlCommand cmd = new SqlCommand("select count(Status) from Emp_attendance where emp_id = @emp_id and Month = @Month and Year = @Year and Status= @Status", con);
                cmd.Parameters.AddWithValue("@emp_id", Convert.ToInt32(Session["id"]));
                cmd.Parameters.AddWithValue("@Month", i);
                cmd.Parameters.AddWithValue("@Year", "2023");
                cmd.Parameters.AddWithValue("@Status", "p");
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (i == 1)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        jan = Convert.ToInt32(v);
                    }
                }
                else if (i == 2)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        feb = Convert.ToInt32(v);
                    }
                }
                else if (i == 3)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        march = Convert.ToInt32(v);
                    }
                }
                else if (i == 4)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        april = Convert.ToInt32(v);
                    }
                }
                else if (i == 5)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        may = Convert.ToInt32(v);
                    }
                }
                else if (i == 6)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        june = Convert.ToInt32(v);
                    }
                }
                else if (i == 7)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        july = Convert.ToInt32(v);
                    }
                }
                else if (i == 8)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        august = Convert.ToInt32(v);
                    }
                }
                else if (i == 9)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        sep = Convert.ToInt32(v);
                    }
                }
                else if (i == 10)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        oct = Convert.ToInt32(v);
                    }
                }
                else if (i == 11)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        nov = Convert.ToInt32(v);
                    }
                }
                else if (i == 12)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        string v = ds.Tables[0].Rows[0][0].ToString();
                        dec = Convert.ToInt32(v);
                    }
                }

            }

            

        }

    }
}