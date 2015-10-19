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
    public partial class CheckoutList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int bookingID = 0;
            string htmlOutput = "";
            string arriveDate = null;

            InvoiceHandler invoiceHandler = new InvoiceHandler();

            BookingHandler bookingHandler = new BookingHandler();
            List<ProvisionalBooking> listAllCheckedinBookings = bookingHandler.GetCheckedInBookings();
            if (listAllCheckedinBookings == null)
            {
                if (listAllCheckedinBookings == null)
                    litHeader.Text = "<h3 style=\"color:red\">There are currently no checked in bookings</h3><br />";
            }
            else
            {
                for (int i = 0; i < listAllCheckedinBookings.Count; i++)
                {
                    arriveDate = listAllCheckedinBookings[i].ArriveDate.Day + "-" + listAllCheckedinBookings[i].ArriveDate.Month + "-" + listAllCheckedinBookings[i].ArriveDate.Year;
                    bookingID = listAllCheckedinBookings[i].BookingID;
                    htmlOutput += "<tr><td>" + bookingID.ToString() + "</td><td>" + listAllCheckedinBookings[i].Name + "</td><td>" + arriveDate + "</td><td>" + "<a class=\"btn btn-info viewBooking\" href=\"Checkout.aspx?id=" + bookingID + "\">Check-out</a>" + "</td></tr>\n";
                }
                if (!IsPostBack)
                {
                    litConfirmedBookings.Text = htmlOutput;
                }
            }
        }
    }
}