using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    
    public partial class dashboard : System.Web.UI.MasterPage
    {
        string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                ShowData();
                hidebutton();
            }
        }

        public void ShowData()
        {
            profileimg.ImageUrl = Session["emp_profileimg"].ToString();
            username.Text = Session["emp_name"].ToString();
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            //string email = Session["emp_email"].ToString();
            //string pass = Session["emp_password"].ToString();
            //if (email!= null && pass!= null)
            //{
                FormsAuthentication.SignOut();
                Session.Abandon();
                Response.Redirect("Login.aspx");
            //}
            //else
            //{
                //Response.Redirect("Login.aspx");
            //}
           
        }

        protected void Teamembers_Click(object sender, EventArgs e)
        
        {
           if (Session["emp_usertype"].Equals("employee"))
            {
                Response.Redirect("EmpTeamMembers2.aspx");
            }
            else
            {
                Response.Redirect("TeamMembers2.aspx");
            }
        }

        protected void assets_Click(object sender, EventArgs e)
        {
            if (Session["emp_usertype"].Equals("employee"))
            {
                Response.Redirect("EmpAssets.aspx");
            }
            else
            {
                Response.Redirect("Assets.aspx");
            }
        }

        public void hidebutton()
        {
            if (Session["emp_usertype"].Equals("employee"))
            {
                LinkButton1.Visible = false;
                Addemp.Visible = false;
            }
        }
    }
}