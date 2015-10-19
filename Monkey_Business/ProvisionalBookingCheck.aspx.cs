using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.Net.Mail;
using DAL;
using BLL;

namespace Monkey_Business
{
    public partial class ProvisionalBookingCheck : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string action = "";
            try
            {
                action = Request.QueryString["action"].ToString();
            }
            catch (NullReferenceException)
            {
                Response.Redirect("ProvisionalBookings.aspx");
            }
            if (action == "confirm")
            {
                Session["Action"] = "Confirm";
                litHeader.Text = "You are about to confirm this provisional booking, once you click confirm this cannot be undone.<br /><br />Are you sure you want to continue?";
            }
            else if (action == "decline")
            {
                Session["Action"] = "Decline";
                litHeader.Text = "You are about to decline this provisional booking, once you click decline this cannot be undone.<br /><br />Are you sure you want to continue?";
            }
            else
                Response.Redirect("ProvisionalBookings.aspx");

            if (IsPostBack)
            {
                if (action == "confirm")
                    litHeader.Text = "The booking has been confirmed!";
                else
                    litHeader.Text = "The booking has been declined!";
                btnYes.Visible = false;
                btnNo.Visible = false;
                btnBack.Visible = true;
            }
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            int bookingID = 0;
            try
            {
                bookingID = (int)Session["BookingID"];
            }
            catch (NullReferenceException)
            {
                Response.Redirect("ProvisionalBookings.aspx");
            }

            Response.Redirect("ViewProvisionalBooking.aspx?id=" + bookingID.ToString());
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            string action = "";
            try
            {
                action = (string)Session["Action"];
            }
            catch (NullReferenceException)
            {
                Response.Redirect("ProvisionalBookings.aspx");
            }

            int bookingID = 0;
            try
            {
                bookingID = (int)Session["BookingID"];
            }
            catch (NullReferenceException)
            {
                Response.Redirect("ProvisionalBookings.aspx");
            }

            BookingHandler bookingHandler = new BookingHandler();

            if (action == "Confirm")
            {
                //Confirm booking
                /*try
                {
                    SendMail(bookingID, true);*/
                    bookingHandler.ConfirmBooking(bookingID);
                /*}
                catch (Exception)
                {
                }*/
            }
            else if (action == "Decline")
            {
                //Decline booking
                /*try
                {
                    SendMail(bookingID, false);*/
                    bookingHandler.DeclineBooking(bookingID);
                /*}
                catch (Exception ex)
                {

                }*/
                
            }
            else
            {
                Response.Redirect("ProvisionalBookings.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProvisionalBookings.aspx");
        }

        protected void SendMail(int bookingID, bool confirmed)
        {
            //get member who created the booking
            BookingHandler bookingHandler = new BookingHandler();
            int memberID = bookingHandler.GetBookingOwner(bookingID);

            //the get members email
            MemberHandler memberHandler = new MemberHandler();
            Member member = new Member();
            member = memberHandler.GetMemberDetails(memberID);
            
            BusinessHandler businessHandler = null;
            Business business = null;

            //get business email and password
            string businessName, businessEmail, businessPassword, emailServer;
            int port;

            businessHandler = new BusinessHandler();
            business = new Business();
            business = businessHandler.GetBusinessDetails();

            businessName = business.Name;
            businessEmail = business.Email;
            businessPassword = business.EmailPassword;
            emailServer = business.EmailServer;
            port = business.EmailPort;

            //send email
            MailMessage mail = new MailMessage();
            SmtpClient smtpClient = new SmtpClient(emailServer);
            mail.From = new MailAddress(businessEmail);
            mail.To.Add(member.Email);

            if (confirmed)
            {
                mail.Subject = businessName + " Booking Confirmed";
                mail.Body = "We are pleased to inform you, your booking at " + businessName + " has been confirmed. Please supply the following booking referance number when checking in: " + bookingID.ToString();
            }
            else
	        {
                mail.Subject = businessName + " Booking Declined";
                mail.Body = "We are sad to inform you, your booking at " + businessName + " has been declined. If you have any queries please contact us for assistance.";
	        }

            smtpClient.Port = port;
            smtpClient.Credentials = new NetworkCredential(businessEmail, businessPassword);
            smtpClient.EnableSsl = true;

            smtpClient.Send(mail);
            memberHandler.UpdateMemberPassword(member);

                /*
                lblProgress.CssClass = "label label-success";
                lblProgress.Text = "An email was sent, check you email for your new password.";

                //delay redirect to alert user of page change
                lblRedirect.Text = "Redirecting to log in, in 5 seconds.";
                Response.Write("<script type=\"text/javascript\">setTimeout(function () { window.location.href = \"Login.aspx\"; }, 5000);</script>");
            */
        }
    }
}