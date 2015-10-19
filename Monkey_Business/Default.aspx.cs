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
    public partial class Default1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int myRole = 0;
            string welcomeMessage = "&nbsp;";

            if ((string)Request.QueryString["logout"] == "1")
            {
                welcomeMessage = "You have been logged out successfully<br /><br />";
                lblWelcome.Visible = true;
                lblWelcome.Text = welcomeMessage;
            }
            if (Session["FirstName"] != null && Session["Surname"] != null)
            {
                welcomeMessage = "Welcome to EASiBOOK,  " + Session["FirstName"] + " " + Session["Surname"] + "!<br /><br />";
                lblWelcome.Visible = true;
                lblWelcome.Text = welcomeMessage;


                MemberHandler memberHandler = new MemberHandler();
                myRole = memberHandler.GetRole((int)Session["MemberID"]);
                if (myRole > 1)
                    btnStaffTools.Visible = true;
            }
        }

        protected void btnProfileDetails_Click(object sender, EventArgs e)
        {
            bool loggedIn = false;
            if (Session["LecturerID"] != null)
                loggedIn = true;

            if (loggedIn == true)
                Response.Redirect("Profile.aspx?id=" + Session["MemberID"].ToString());
            else
                Response.Redirect("Login.aspx");
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            bool loggedIn = false;
            if (Session["MemberID"] != null)
                loggedIn = true;

            if (loggedIn == true)
                Response.Redirect("UpdateProfile.aspx?id=" + Session["MemberID"].ToString());
            else
                Response.Redirect("Login.aspx");
        }

        protected void btnViewRooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("Availability.aspx");
        }

        protected void btnStaffTools_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffTools.aspx");
        }

        protected void btnViewBookingHistory_Click(object sender, EventArgs e)
        {
            bool loggedIn = false;
            if (Session["MemberID"] != null)
                loggedIn = true;

            if (loggedIn == true)
                Response.Redirect("BookingHistory.aspx?id=" + Session["MemberID"].ToString());
            else
                Response.Redirect("Login.aspx");
        }
    }
}