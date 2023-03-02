using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.ServiceModel.Channels;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    public partial class forgetpassword : System.Web.UI.Page
    {
        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        string emailuser;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').hide();$('.alert-warning').hide();});</script>");
            }
        }

        // send mail for user
        //public void sendmail()
        //{
        //    if (emailuser.Equals(email.Value))
        //    { 
        //        string to = email.Value; //To address    
        //        string from = "rahulpaljobs@gmail.com"; //From address    
        //        MailMessage message = new MailMessage(from, to);

        //        string mailbody = "In this article you will learn how to send a email using Asp.Net & C#";
        //        message.Subject = "Recover your Password";
        //        message.Body = mailbody;
        //        message.BodyEncoding = Encoding.UTF8;
        //        message.IsBodyHtml = true;
        //        SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
        //        System.Net.NetworkCredential basicCredential1 = new
        //        System.Net.NetworkCredential("rahulpaljobs@gmail.com", "kbvhmihftjmnwquc");
        //        client.EnableSsl = true;
        //        client.UseDefaultCredentials = false;
        //        client.Credentials = basicCredential1;
        //        try
        //        {
        //            client.Send(message);
        //            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').show();$('.alert-success').html('successfully sent reset link on  your mail ,please check once! Thank you.');$('.alert-danger').hide();$('.alert-warning').hide();});</script>");
        //            //lblmsg.Text = "successfully sent reset link on  your mail ,please check once! Thank you.";
        //        }

        //        catch (Exception ex)
        //        {
        //            throw ex;
        //        }
        //    }
        //    else
        //    {
        //        Response.Write("Invalid Email Id");
        //    }
        //}
        protected void Submit_Click(object sender, EventArgs e)
        {
            if (email.Value == "" && newpass.Value == "" && confirmpass.Value == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').show();$('.alert-danger').html('Enter all Fields');});</script>");
            }
            else if (email.Value == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').show();$('.alert-danger').html('Enter Valid Email ID');});</script>");
            }

            else if (newpass.Value == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').show();$('.alert-danger').html('Enter New Password');});</script>");
            }
            else if (confirmpass.Value == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').show();$('.alert-danger').html('Please Confirm  your Password ');});</script>");
            }
            else
            {
                DataSet ds = ObjBal.ForgotPass(email.Value);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    emailuser = ds.Tables[0].Rows[0]["emp_email"].ToString();
                    //sendmail();
                    if (newpass.Value.Equals(confirmpass.Value))
                    {
                        ObjBal.ChangePassword(email.Value, newpass.Value);
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').show();$('.alert-success').html('Your Password has been changed successfully .');$('.alert-danger').hide();});</script>");
                    }

                    email.Value = "";
                    newpass.Value = "";
                    confirmpass.Value = "";
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", "<script>$(document).ready(function(){$('.alert-success').hide();$('.alert-danger').show();$('.alert-danger').html('Invalid Email ID');});</script>");
                }
            }

        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}

