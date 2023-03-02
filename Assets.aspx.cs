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
    public partial class WebForm3 : System.Web.UI.Page
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
            deptdropdown.Items.Insert(0, new ListItem("Select Department"));
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

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName== "edit")
            {
                ((Label)e.Item.FindControl("empsystem")).Visible = false;
                ((Label)e.Item.FindControl("emplocation")).Visible = false;

                ((TextBox)e.Item.FindControl("systemtxt")).Visible = true;
                ((TextBox)e.Item.FindControl("locationtxt")).Visible = true;
                ((LinkButton)e.Item.FindControl("Detailsbtn")).Visible = false;
                ((LinkButton)e.Item.FindControl("updatebtn")).Visible = true;
                ((LinkButton)e.Item.FindControl("cancelbtn")).Visible = true;
            }
            if(e.CommandName== "update")
            {
                Label id = (Label)e.Item.FindControl("empid");
                TextBox system = ((TextBox)e.Item.FindControl("systemtxt"));
                TextBox wlocation = ((TextBox)e.Item.FindControl("locationtxt"));

                int result = ObjBal.UpdateAsset(Convert.ToInt32(id.Text), system.Text, wlocation.Text);
                if (result == 1)
                {
                    Response.Write("<script>alert('Update successfull')</script>");
                    Response.Redirect("Assets.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Update Failed')</script>");
                }
            }
            if(e.CommandName== "cancel")
            {
                ((Label)e.Item.FindControl("empsystem")).Visible = true;
                ((Label)e.Item.FindControl("emplocation")).Visible = true;

                ((TextBox)e.Item.FindControl("systemtxt")).Visible = false;
                ((TextBox)e.Item.FindControl("locationtxt")).Visible = false;
                ((LinkButton)e.Item.FindControl("Detailsbtn")).Visible = true;
                ((LinkButton)e.Item.FindControl("updatebtn")).Visible = false;
                ((LinkButton)e.Item.FindControl("cancelbtn")).Visible = false;
            }

        }
    }
}
