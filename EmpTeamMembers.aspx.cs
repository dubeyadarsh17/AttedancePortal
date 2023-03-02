using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    public partial class WebForm2 : System.Web.UI.Page
    {

        string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;

        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindData();
            }
        }
        public void BindData()
        {
            DataSet ds = ObjBal.EmpTeamMember(Session["emp_usertype"].ToString(), Session["emp_department"].ToString());

            Repeater1.DataSource = ds;
            Repeater1.DataBind();
        }
    }
}