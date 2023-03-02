using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AttedancePortal
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        private DataTable socialEvents;
        protected void Page_Load(object sender, EventArgs e)
        {
            BuildSocialEventTable();
        }

        private void BuildSocialEventTable()
        {
            // to simulate a database query
            socialEvents = new DataTable();
            socialEvents.Columns.Add(new DataColumn("Date", typeof(DateTime)));
            socialEvents.Columns.Add(new DataColumn("Description", typeof(string)));


            DataRow row;
            row = socialEvents.NewRow();
            row["Date"] = DateTime.Now.AddDays(-5);
            row["Description"] = "Bithday party at Rajeev house";

            socialEvents.Rows.Add(row);

            row = socialEvents.NewRow();
            row["Date"] = DateTime.Now.AddDays(3);
            row["Description"] = "farewell party";

            socialEvents.Rows.Add(row);

            row = socialEvents.NewRow();
            row["Date"] = DateTime.Now.AddDays(7);
            row["Description"] = "C# corner meet ";

            socialEvents.Rows.Add(row);

            row = socialEvents.NewRow();
            row["Date"] = DateTime.Now.AddDays(7);
            row["Description"] = "Brazil Vs. France";

            socialEvents.Rows.Add(row);
            row = socialEvents.NewRow();
            row["Date"] = DateTime.Now.AddDays(7);
            row["Description"] = "Indian cricket team in london starts practice match";

            socialEvents.Rows.Add(row);
        }
        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            DataRow[] rows = socialEvents.Select(
                  String.Format(
                     "Date >= #{0}# AND Date < #{1}#",
                     e.Day.Date.ToShortDateString(),
                     e.Day.Date.AddDays(1).ToShortDateString()
                  )
               );

            foreach (DataRow row in rows)
            {
                System.Web.UI.WebControls.Image image;
                image = new System.Web.UI.WebControls.Image();

                image.ToolTip = row["Description"].ToString();

                e.Cell.BackColor = Color.Wheat;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            System.Data.DataView view = socialEvents.DefaultView;
            view.RowFilter = String.Format(
                              "Date >= #{0}# AND Date < #{1}#",
                              calendar1.SelectedDate.ToShortDateString(),
                              calendar1.SelectedDate.AddDays(1).ToShortDateString()
                           );

            if (view.Count > 0)
            {
                GridView1.Visible = true;
                GridView1.DataSource = view;
                GridView1.DataBind();
            }
            else
            {
                GridView1.Visible = false;
            }
        }
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }
        private void InitializeComponent()
        {
            this.calendar1.DayRender += new System.Web.UI.WebControls.DayRenderEventHandler(this.Calendar1_DayRender);
            this.calendar1.SelectionChanged += new System.EventHandler(this.Calendar1_SelectionChanged);
            this.Load += new System.EventHandler(this.Page_Load);

        }

    }
}