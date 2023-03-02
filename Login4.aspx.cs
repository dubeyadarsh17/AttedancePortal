using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    public partial class Login : System.Web.UI.Page
    {
        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Loginbtn_Click(object sender, EventArgs e)
        {
            DataSet ds = ObjBal.Login(email.Value, pass.Value);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["id"] = ds.Tables[0].Rows[0][0].ToString();
                Session["emp_name"] = ds.Tables[0].Rows[0][1].ToString();
                Session["emp_email"] = ds.Tables[0].Rows[0][2].ToString();
                Session["emp_profileimg"] = ds.Tables[0].Rows[0][18].ToString();
                Session["emp_usertype"] = ds.Tables[0].Rows[0][6].ToString();
                Session["emp_password"] = ds.Tables[0].Rows[0][4].ToString();
                Session["emp_department"] = ds.Tables[0].Rows[0][12].ToString();
                Session["emp_desig"] = ds.Tables[0].Rows[0][13].ToString();
                Session["contact"] = ds.Tables[0].Rows[0][4].ToString();
                if (Session["emp_usertype"].Equals("employee"))
                {
                    Response.Redirect("register.aspx");
                }
                else if (Session["emp_usertype"].Equals("Admin"))
                {
                    Response.Redirect("Home.aspx");
                }

            }
            else
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Login failed. Invalid Login Credentials!')");
                Response.Write("<script>alert('Login failed. Invalid Login Credentials!')</script>");
            }
        }
    }
}
