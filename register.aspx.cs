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
    public partial class register : System.Web.UI.Page
    {
        string conn = ConfigurationManager.ConnectionStrings["hdfc"].ConnectionString;
        Bas_layer.Bal ObjBal = new Bas_layer.Bal();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                GetCountry();
                GetDepartment();
            }
        }


        public void GetCountry()
        { 
            SqlDataReader dr = ObjBal.getCountry();
            country.DataSource = dr;
            country.Items.Clear();
            country.Items.Add("select country");
            country.DataTextField = "country_name";
            country.DataValueField = "Country_id";
            country.DataBind();
        }

        public void GetState()
        {
            SqlDataReader dr = ObjBal.getState(Convert.ToInt32(country.SelectedValue));
            state.DataSource = dr;
            state.Items.Clear();
            state.Items.Add("select state");
            state.DataTextField = "state_name";
            state.DataValueField = "state_id";
            state.DataBind();
        }
        public void GetCity()
        {
            SqlDataReader dr = ObjBal.getCity(Convert.ToInt32(state.SelectedValue));
            city.DataSource = dr;
            city.Items.Clear();
            city.Items.Add("select city");
            city.DataTextField = "city_name";
            city.DataValueField = "city_id";
            city.DataBind();
        }

        public void GetDepartment()
        {
            SqlDataReader dr = ObjBal.getDepartment();
            dept.DataSource = dr;
            dept.Items.Clear();
            dept.Items.Add("select Department");
            dept.DataTextField = "department";
            dept.DataValueField = "dpt_id";
            dept.DataBind();
            dept.Items.Insert(0, new ListItem("Select Department"));
        }

        public void Clear()
        {
            empid.Text = "";
            gender.SelectedValue = "";
            firstname.Value= "";
            lastname.Value= "";
            email.Value= "";
            contact.Value= "";          
            pincode.Value= "";
            address.Value= "";
            designation.Value = "";
            system.Value= "";
            workplace.Value= "";
            vleaves.Value= "";
            sleaves.Value= "";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            DataSet ds = ObjBal.Duplicate(Convert.ToInt32(empid.Text), email.Value);
            if (ds.Tables[0].Rows.Count >0)
            {
                string id = ds.Tables[0].Rows[0]["emp_id"].ToString();
                string emailuser = ds.Tables[0].Rows[0]["emp_email"].ToString();

                if(Convert.ToInt32(id) == Convert.ToInt32(empid.Text) && emailuser == email.Value)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Duplicate record. Employee with same ID and Email exists.');", true);
                }
                else if(Convert.ToInt32(id) == Convert.ToInt32(empid.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Duplicate record. Employee with same ID  exists.');", true);
                }
                else if (emailuser == email.Value)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Duplicate record. Employee with same Email Id exists.');", true);
                }
                
            }
            else
            {
                int result = ObjBal.InsertData(Convert.ToInt32(empid.Text), (gender.SelectedValue), firstname.Value, lastname.Value, email.Value, contact.Value, Convert.ToString(country.SelectedItem), Convert.ToString(state.SelectedItem), Convert.ToString(city.SelectedItem), pincode.Value, address.Value, (dept.SelectedValue), designation.Value, system.Value, workplace.Value, vleaves.Value, sleaves.Value);

                if (result == 1)
                {
                    Response.Write("<script>alert('Data Inserted Successfully')</script>");
                    Clear();
                }
                else
                {
                    Response.Write("<script>alert('Verify your data')</script>");
                }
            }

        }

        

        protected void country_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GetState();
        }

        protected void state_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCity();
        }

        protected void Resetbtn_Click(object sender, EventArgs e)
        {
            Clear(); 
        }

    }
}
