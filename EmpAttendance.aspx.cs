using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                getEmpAttendance();
                GetDepartment();
            }
        }

        // Get All Attendance
        public void getEmpAttendance()
        {
            DataSet ds = ObjBal.getEmpAttendance();
            Repeater1.DataSource = ds;
            Repeater1.DataBind();

            foreach (RepeaterItem item in Repeater1.Items)
            {
                Label Url = item.FindControl("status") as Label;
                if (Url.Text == "p")
                {
                    Url.ForeColor = System.Drawing.Color.ForestGreen;
                }
                else
                {
                    Url.ForeColor =Color.ForestGreen;
                }
               
            }
        }

        protected void datefilter_Click(object sender, EventArgs e)
        {
            var fdate = Convert.ToDateTime(fromdate.Text).ToString("dd-MM-yyyy");
            var tdate = Convert.ToDateTime(todate.Text).ToString("dd-MM-yyyy");
            DataSet ds = ObjBal.Filter_Date(fdate, tdate); /*Convert.ToInt32(deptdropdown.SelectedValue)*/
                Repeater1.DataSource = ds;
                Repeater1.DataBind();
        }

        protected void download_Click(object sender, EventArgs e)
        {
            DateTime todaydate = DateTime.Now.Date;
            var onlydate = todaydate.ToShortDateString();
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=" + onlydate + ".xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Repeater1.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.Flush();
            Response.End();
        }

        public void GetDepartment()
        {
            SqlDataReader dr = ObjBal.getDepartment();
            deptdropdown.DataSource = dr;
            deptdropdown.Items.Clear();
            deptdropdown.Items.Add("select Department");
            deptdropdown.DataTextField = "department";
            deptdropdown.DataValueField = "dpt_id";
            deptdropdown.DataBind();
            deptdropdown.Items.Insert(0, new ListItem("Select Department"));
        }


    }
}