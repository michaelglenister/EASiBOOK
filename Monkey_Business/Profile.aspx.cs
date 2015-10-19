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
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int myRole = 1;
            bool loggedIn = false;
            int memberID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["id"], out memberID);

            if (memberID == 0)
                Response.Redirect("Default.aspx");

            if (Session["MemberID"] != null)
                loggedIn = true;

            if (loggedIn == false)
                Response.Redirect("Login.aspx");

            MemberHandler memberHandler = new MemberHandler();
            Member member = new Member();
            member = memberHandler.GetMemberDetails(memberID);

            //Begin check to see if this is a members own profile or if owner is viewing it
            myRole = memberHandler.GetRole((int)Session["MemberID"]);
            if (myRole != 3 && (int)Session["MemberID"] != memberID)
            {
                Response.Redirect("Default.aspx");
            }
            //End check

            if (loggedIn == true)
            {
                try
                {
                    Page.Title = "EASiBOOK :: Profile for " + member.FirstName + " " + member.Surname;
                }
                catch (NullReferenceException)
                {
                    Response.Redirect("Default.aspx");
                }
                litCustomerName.Text = "Profile for " + member.FirstName + " " + member.Surname;

                lblFirstName.Text = member.FirstName;
                lblSurname.Text = member.Surname;
                lblAddressLine1.Text = member.AddressLine1;
                lblAddressLine2.Text = member.AddressLine2;
                lblSuburb.Text = member.Suburb;
                lblPostalCode.Text = member.PostalCode;
                lblCity.Text = member.City;
                lblPhoneNo.Text = member.PhoneNo;
                lblEmail.Text = member.Email;

                if (member.Role == 1)
                    lblRole.Text = "Customer";
                else if (member.Role == 2)
                    lblRole.Text = "Booking Admin";
                if (member.Role == 3)
                    lblRole.Text = "Owner";
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            int memberID = 0;
            try
            {
                memberID = Convert.ToInt32(Request.QueryString["id"]);
            }
            catch (NullReferenceException)
            {

            }
            Response.Redirect("UpdateProfile.aspx?id=" + memberID.ToString());
        }

        protected void btnViewBookingHistory_Click(object sender, EventArgs e)
        {
            int memberID = 0;
            try
            {
                memberID = Convert.ToInt32(Request.QueryString["id"]);
            }
            catch (Exception)
            {
                Response.Redirect("Default.aspx");
            }
            Response.Redirect("BookingHistory.aspx?id=" + memberID);
        }
    }
}