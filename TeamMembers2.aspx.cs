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
    public partial class TeamMembers2 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;

        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindData();
                GetDepartment();
            }
        }

        public void BindData()
        {
            DataTable ds = ObjBal.EmpDetailsCard();
            Empcards.DataSource = ds; 
            Empcards.DataBind();
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

        protected void Empcards_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if(e.CommandName == "edit")
            {
                //Session["id3"];
                Session["id3"] = ((Label) e.Item.FindControl ("empidlbl")).Text;
                Response.Redirect("UserProfileCard.aspx");
            }
        }

        protected void deptdropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            FilterData(deptdropdown.SelectedValue);
        }
        public void FilterData(string dept)
        {
            DataSet ds = ObjBal.FilterbyDepartment(dept);
            Empcards.DataSource = ds;
            Empcards.DataBind();
        }

        

    }
}