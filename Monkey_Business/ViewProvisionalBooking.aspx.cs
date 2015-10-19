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
    public partial class ViewProvisionalBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int bookingID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["id"], out bookingID);
            Session["BookingID"] = bookingID;

            BookingHandler bookingHandler = new BookingHandler();
            InvoiceHandler invoiceHandler = new InvoiceHandler();
            ProvisionalBooking provisionalBooking = bookingHandler.GetProvisionalBookingDetails(bookingID);
            try
            {
                Page.Title = "EASiBOOK :: Booking Number" + bookingID.ToString();
                litBookingNo.Text = bookingID.ToString();
                lblName.Text = provisionalBooking.Name;
                lblEmail.Text = provisionalBooking.Email;
                lblPhoneNo.Text = provisionalBooking.PhoneNo;
                lblDeposit.Text = "R " + invoiceHandler.GetDepositAmount(bookingID).ToString();
                lblArriveDate.Text = provisionalBooking.ArriveDate.Year + "-" + provisionalBooking.ArriveDate.Month + "-" + provisionalBooking.ArriveDate.Day;
                lblDepartDate.Text = provisionalBooking.DepartDate.Year + "-" + provisionalBooking.DepartDate.Month + "-" + provisionalBooking.DepartDate.Day;
                if (provisionalBooking.ProofOfPayment != "")
                    imgProofOfPayment.ImageUrl = "." + provisionalBooking.ProofOfPayment;
                else
                {
                    imgProofOfPayment.Visible = false;
                    lblLargeImage.Visible = false;
                    lblNoPOP.Visible = true;
                }

                if (provisionalBooking.ProofOfPayment.EndsWith(".pdf"))
                {
                    litProofOfPayment.Text = "." + provisionalBooking.ProofOfPayment + "\" target=\"_blank\"";
                    imgProofOfPayment.ImageUrl = "/resources/pdflogo.png";
                }
                else
                    litProofOfPayment.Text = "." + provisionalBooking.ProofOfPayment + "\" data-lightbox=\"image\"";
            }
            catch (NullReferenceException)
            {
                Response.Redirect("ProvisionalBookings.aspx");
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProvisionalBookingCheck.aspx?action=confirm");
        }

        protected void btnDecline_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProvisionalBookingCheck.aspx?action=decline");
        }
    }
}