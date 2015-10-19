using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using DAL;

namespace Monkey_Business
{
    public partial class Availability : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                startDateCalander.SelectedDate = DateTime.Today;
                endDateCalander.SelectedDate = DateTime.Today.AddDays(1);
            }
        }

        protected void btnCheckAvailability_Click(object sender, EventArgs e)
        {
            //Populating room availability table, just testing... This code can be deleted later on - Jason
            //AvailabilityHandler availabilityHandler = new AvailabilityHandler();
            //availabilityHandler.AddAvailabilityRecord(4, 2014);

            Session["StartDate"] = startDateCalander.SelectedDate;
            Session["EndDate"] = endDateCalander.SelectedDate;
            Response.Redirect("ShowAvailability.aspx");
        }

        protected void startDateCalander_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date.CompareTo(DateTime.Today) < 0)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void endDateCalander_DayRender(object sender, DayRenderEventArgs e)
        {
            if (e.Day.Date.CompareTo(startDateCalander.SelectedDate.AddDays(1)) < 0)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void startDateCalander_SelectionChanged(object sender, EventArgs e)
        {
            if (endDateCalander.SelectedDate <= startDateCalander.SelectedDate)
                endDateCalander.SelectedDate = startDateCalander.SelectedDate.AddDays(1);
        }
    }
}