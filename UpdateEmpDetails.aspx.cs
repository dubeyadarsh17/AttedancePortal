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
    public partial class WebForm4 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;
        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GetDepartment();
                ShowData();
              
            }
        }

        // show details

        public void ShowData()
        {
            idtxt.Text = Session["emp_id"].ToString();
            DataSet ds = ObjBal.GetData(Convert.ToInt32(idtxt.Text));
            if (ds.Tables[0].Rows.Count > 0)
            {
                nametxt.Text = ds.Tables[0].Rows[0][1].ToString();
                emailtxt.Text = ds.Tables[0].Rows[0][2].ToString();
                contacttxt.Text = ds.Tables[0].Rows[0][4].ToString();
                department.Text = ds.Tables[0].Rows[0][12].ToString();
                desigtxt.Text = ds.Tables[0].Rows[0][13].ToString();
                vtxt.Text = ds.Tables[0].Rows[0][16].ToString();
                stxt.Text = ds.Tables[0].Rows[0][17].ToString();
                empimg.ImageUrl = ds.Tables[0].Rows[0][18].ToString();
                empnamelbl.Text = ds.Tables[0].Rows[0][1].ToString();
                empdesiglbl.Text = ds.Tables[0].Rows[0][13].ToString();
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

        protected void Upadte_Click(object sender, EventArgs e)
        {
            int result = ObjBal.UpdateMember(Convert.ToInt32(idtxt.Text), nametxt.Text, emailtxt.Text, contacttxt.Text, department.SelectedValue, desigtxt.Text, vtxt.Text, stxt.Text);
            if (result == 1)
            {
                Response.Write("<script>alert('Employee details Updated successfully!')</script>");
              
            }
            else
            {
                Response.Write("<script>alert('Update Failed!')</script>");
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            int result = ObjBal.Delete(Convert.ToInt32(idtxt.Text));
            if (result == 1)
            {
                Response.Write("<script>alert('Data  Deleted successfully!')</script>");
            }
            else
            {
                Response.Write("<script>alert('Delete Failed!')</script>");
            }
        }
    }
}