using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    public partial class login3 : System.Web.UI.Page
    {
        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').hide();$('.alert-warning').hide();});</script>");
            }
        }

        protected void Loginbtn_Click(object sender, EventArgs e)
        {
            if (email.Value == "" && pass.Value == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').show();$('.alert-danger').html('Enter Email id and Password');});</script>");
            }
            else if (email.Value == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').show();$('.alert-danger').html('Enter  Email ID');});</script>");
            }

            else if (pass.Value == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').show();$('.alert-danger').html('Enter Password');});</script>");
            }
            else
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
                    Session.Timeout = 60;
                    if (Session["emp_usertype"].Equals("employee"))
                    {

                        Response.Redirect("Home.aspx");
                    }
                    else if (Session["emp_usertype"].Equals("Admin"))
                    {
                        
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').show();$('.alert-success').html('Your Password has been changed successfully .');$('.alert-danger').hide();});</script>") ;
                        Response.Redirect("Home.aspx");

                    }

                }

                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').show();$('.alert-danger').html('Login failed. Invalid Login Credentials!');});</script>");
                }
            }
        }
    }
}