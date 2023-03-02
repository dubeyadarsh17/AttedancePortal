using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    public partial class EmpTeamMembers2 : System.Web.UI.Page
    {
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

            Empcards.DataSource = ds;
            Empcards.DataBind();
        }

    }
}