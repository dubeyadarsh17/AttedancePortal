using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;
        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ShowData();
                GetDepartment();
            }
        }
        public void GetDepartment()
        {
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from dpmt_tbl", con);
            SqlDataReader dr = cmd.ExecuteReader();
            department.DataSource = dr;
            department.Items.Clear();
            department.Items.Add("select Department");
            department.DataTextField = "department";
            department.DataValueField = "dpt_id";
            department.DataBind();
            con.Close();
        }
        public void ShowData()
        {
            idtxt.Text = Session["id"].ToString();
            DataSet ds = ObjBal.GetData(Convert.ToInt32(idtxt.Text));
            if (ds.Tables[0].Rows.Count > 0)
            {
                //idlbl.Text = ds.Tables[0].Rows[0][0].ToString(); 
                nametxt.Text = ds.Tables[0].Rows[0][1].ToString();
                emailtxt.Text = ds.Tables[0].Rows[0][2].ToString();
                contacttxt.Text = ds.Tables[0].Rows[0][4].ToString();
                department.Text = ds.Tables[0].Rows[0][12].ToString();
                desigtxt.Text = ds.Tables[0].Rows[0][13].ToString();
                addresstxt.Text = ds.Tables[0].Rows[0][11].ToString();
                empimg.ImageUrl = ds.Tables[0].Rows[0][18].ToString();
                empnamelbl.Text = ds.Tables[0].Rows[0][1].ToString();
                empdesiglbl.Text = ds.Tables[0].Rows[0][13].ToString();

            }
        }

        protected void Upadte_Click(object sender, EventArgs e)
        {
            string imgfile = "~/images/";
            if (FileUpload1.HasFile)
            {
                imgfile += Path.GetFileName(FileUpload1.PostedFile.FileName);
                FileUpload1.SaveAs(Server.MapPath(imgfile));
            }
            else
            {
                // use previous user image if new image is not changed
                Image img=empimg;
                imgfile=img.ImageUrl;
            }
            int result = ObjBal.SelfEData(Convert.ToInt32(idtxt.Text), nametxt.Text,  contacttxt.Text, addresstxt.Text,imgfile);
            if (result == 1)
            {
                Response.Write("<script>alert('Employee details Updated successfully!')</script>");
                ShowData();
            }
            else
            {
                Response.Write("<script>alert('Update Failed!')</script>");
            }
        }
    }
}