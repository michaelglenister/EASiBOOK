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
    public partial class CancelBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int myRole = 1;
            int bookingID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["id"], out bookingID);
            int returnID = 0;
            intTest = false;
            intTest = int.TryParse(Request.QueryString["return"], out returnID);

            if (bookingID == 0)
                Response.Redirect("Default.aspx");

            if (IsPostBack)
            {
                litHeader.Text = "The booking has been cancelled sucessfully!";
                btnYes.Visible = false;
                btnNo.Visible = false;
                btnBack.Visible = true;
            }
            else
            {
                litHeader.Text = "You are about to cancel booking number " + bookingID.ToString() + "<br /><br />Once this booking has been cancelled, this process can't be undone. Are you sure you want to continue?";
            }

            bool loggedIn = false;
            //Checks for a login
            if (Session["MemberID"] != null)
                loggedIn = true;
            if (loggedIn == false)
            {
                Session["LoginRedirect"] = "CancelBooking.aspx?id=" + bookingID.ToString() + "&return=" + returnID.ToString();
                Response.Redirect("Login.aspx");
            }
            //End of login check

            BookingHandler bookingHandler = new BookingHandler();

            int memberID = bookingHandler.GetBookingOwner(bookingID);

            //Checks if role is high enough
            MemberHandler memberHandler = new MemberHandler();
            myRole = memberHandler.GetRole((int)Session["MemberID"]);
            if (myRole != 3 && (int)Session["MemberID"] != memberID)
            {
                Response.Redirect("Default.aspx");
            }
            //End check for role
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            int myRole = 1;
            int bookingID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["id"], out bookingID);
            int returnID = 0;
            intTest = false;
            intTest = int.TryParse(Request.QueryString["return"], out returnID);

            if (bookingID == 0)
                Response.Redirect("Default.aspx");

            bool loggedIn = false;
            //Checks for a login
            if (Session["MemberID"] != null)
                loggedIn = true;
            if (loggedIn == false)
            {
                Session["LoginRedirect"] = "CancelBooking.aspx?id=" + bookingID.ToString() + "&return=" + returnID.ToString();
                Response.Redirect("Login.aspx");
            }
            //End of login check

            BookingHandler bookingHandler = new BookingHandler();
            bookingHandler.CancelBooking(bookingID);

            int memberID = bookingHandler.GetBookingOwner(bookingID);

            //Checks if role is high enough
            MemberHandler memberHandler = new MemberHandler();
            myRole = memberHandler.GetRole((int)Session["MemberID"]);
            if (myRole != 3 && (int)Session["MemberID"] != memberID)
            {
                Response.Redirect("Default.aspx");
            }
            //End check for role
            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            int returnID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["return"], out returnID);

            Response.Redirect("BookingHistory.aspx?id=" + returnID.ToString());
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            int returnID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["return"], out returnID);

            Response.Redirect("BookingHistory.aspx?id=" + returnID.ToString());
        }
    }
}