using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DAL;
using BLL;

namespace Monkey_Business
{
    public partial class Checkin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int checkinID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["id"], out checkinID);

            if (checkinID == 0)
                Response.Redirect("CheckinList.aspx");

            if (IsPostBack)
            {
                litHeader.Text = "Booking number " + checkinID.ToString() + " has been checked in";
                btnYes.Visible = false;
                btnNo.Visible = false;
                btnBack.Visible = true;
            }
            else
            {
                litHeader.Text = "You are about to check-in booking number " + checkinID.ToString() + "<br /><br />Once you check this person in this process can't be undone, are you sure you want to continue?";
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            int checkinID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["id"], out checkinID);

            if (checkinID == 0)
                Response.Redirect("CheckinList.aspx");

            BookingHandler bookingHandler = new BookingHandler();
            bookingHandler.Checkin(checkinID);
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckinList.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckinList.aspx");
        }
    }
}