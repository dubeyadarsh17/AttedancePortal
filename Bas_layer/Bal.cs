using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bas_layer
{
    public class Bal
    {
        Dal_layer.Dal objDal = new Dal_layer.Dal();

        // InsertData
        public int InsertData(int id, string gender, string fname, string lname, string email, string contact, string country, string state, string city, string pincode, string address, string department, string designation, string system, string workplace, string vleaves, string sleaves)
        {
            return objDal.InsertData(id, gender, fname, lname, email, contact, country, state, city, pincode, address, department, designation, system, workplace, vleaves, sleaves);
        }

        // Duplicate Email And ID
        public DataSet Duplicate(int id, string email)
        {
            return objDal.Duplicate(id, email);
        }

        public DataSet GetData(int id)
        {
            return objDal.GetData(id);
        }

        // Login 
        public DataSet Login(string email, string pass)
        {
            return objDal.Login(email, pass);
        }

        //team member
        public DataSet TeamMember()
        {
            return objDal.TeamMember();
        }

        //Filter Data
        public DataSet FilterMember(string department)
        {
            return objDal.FilterMember(department);
        }

        //  Update Team Member
        public int UpdateMember(int id, string name, string email, string contact, string department, string designation, string vleaves, string sleaves)
        {
            return objDal.UpdateMember(id, name, email, contact, department, designation, vleaves, sleaves);
        }

        // Delete 
        public int Delete(int id)
        {
            return objDal.Delete(id);
        }

        //update asset

        public int UpdateAsset(int id, string system, string workplace)
        {
            return objDal.UpdateAsset(id, system, workplace);
        }

        // emp team members data
        public DataSet EmpTeamMember(string Usertype, string department)
        {
            return objDal.EmpTeamMember(Usertype, department);
        }

        // Self Edid Data
        public int SelfEData(int id, string name, string contact, string address, string img)
        {
            return objDal.SelfEData(id, name, contact, address, img);
        }

        //Get Countary Data
        public SqlDataReader getCountry()
        {
            return objDal.getCountry();
        }

        //Get State Data
        public SqlDataReader getState(int id)
        {
            return objDal.getState(id);
        }

        //Get City Data
        public SqlDataReader getCity(int id)
        {
            return objDal.getCity(id);
        }

        //Get Department Data
        public SqlDataReader getDepartment()
        {
            return objDal.getDepartment();
        }

        // Get All Employee Attendance Data
        public DataSet getEmpAttendance()
        {
            return objDal.getEmpAttendance();
        }


        //date filter  emp attendance
        public DataSet Filter_Date(string fromdate, string todate)
        {
            return objDal.Filter_Date(fromdate, todate);
        }


        //get employee id attendance data
        public DataSet GetAttendanceData(int id)
        {
            return objDal.GetAttendanceData(id);
        }

        //update timeout and workhours

        public void UpdateAttendanceData(int id, string duration)
        {
            objDal.UpdateAttendanceData(id, duration);
        }

        // Duplicate Email 
        public DataSet ForgotPass(string email)
        {
            return objDal.ForgotPass(email);
        }



        //change password
        public void ChangePassword(string email, string pass)
        {
            objDal.ChangePassword(email, pass);
        }

        // Show User Attendance
        public DataSet UserAttendanceRecord(int id)
        {
            return objDal.UserAttendanceRecord(id);
        }

        // user date filter attendance

        public DataSet UserDateFilterAttendance(int id, string fromdate, string todate)
        {
            return objDal.UserDateFilterAttendance(id, fromdate, todate);
        }


        //Month present  attendance
        public DataTable MonthlyPresent(int id)
        {
            return objDal.MonthlyPresent(id);
        }

        //Month absent  attendance
        public DataTable MonthlyAbsent(int id)
        {
            return objDal.MonthlyAbsent(id);
        }


        //team member
        public DataTable EmpDetailsCard()
        {
            return objDal.EmpDetailsCard();
        }

        //team member Data Filter Department

        public DataSet FilterbyDepartment(string department)
        {
            return objDal.FilterbyDepartment(department);
        }

    }
}
