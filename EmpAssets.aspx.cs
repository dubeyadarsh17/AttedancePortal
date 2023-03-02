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
    public partial class WebForm5 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;

        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GetDepartment();
                BindData();
            }
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
        }
        public void BindData()
        {
            DataSet ds = ObjBal.TeamMember();
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
        protected void deptdropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterData(deptdropdown.SelectedValue);
        }
        public void FilterData(string dept)
        {
            DataSet ds = ObjBal.FilterMember(dept);
            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
    }
}