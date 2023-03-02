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
    public partial class WebForm13 : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;

        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                ShowDetails();
                GetDepartment();
            }
        }


        public void ShowDetails()
        {
            DataSet ds = ObjBal.GetData(Convert.ToInt32(Session["id3"]));
            if (ds.Tables[0].Rows.Count > 0)
            {
                empidlbl.Text = ds.Tables[0].Rows[0][0].ToString(); 
                name.Text = ds.Tables[0].Rows[0][1].ToString();
                emailbl.Text = ds.Tables[0].Rows[0][2].ToString();
                contactlbl.Text = ds.Tables[0].Rows[0][4].ToString();
                genderlbl.Text = ds.Tables[0].Rows[0][5].ToString();
                deptlbl.Text = ds.Tables[0].Rows[0][12].ToString();
                desig.Text = ds.Tables[0].Rows[0][13].ToString();
                companylbl.Text = ds.Tables[0].Rows[0][15].ToString();
                place.Text = ds.Tables[0].Rows[0][11].ToString();
                profileimg.ImageUrl = ds.Tables[0].Rows[0][18].ToString();
               

            }
        }
        protected void Edit_Click(object sender, EventArgs e)
        {
            Session["emp_id"] = empidlbl.Text;
            Response.Redirect("UpdateEmpDetails.aspx");
        }

       
        public void GetDepartment()
        {
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            string deptid = Session["emp_department"].ToString();
            SqlCommand cmd = new SqlCommand("select * from dpmt_tbl where dpt_id='" + Convert.ToInt32(deptid) + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                deptlbl.Text = ds.Tables[0].Rows[0][1].ToString();
                con.Close();
            }
        }
    }
}