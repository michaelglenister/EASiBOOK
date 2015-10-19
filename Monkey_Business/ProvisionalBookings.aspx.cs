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
    public partial class ProvisionalBookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int bookingID = 0;
            string htmlOutput = "";
            string arriveDate = null;
            string departDate = null;

            InvoiceHandler invoiceHandler = new InvoiceHandler();

            BookingHandler bookingHandler = new BookingHandler();
            List<ProvisionalBooking> listProvisionalBookings = bookingHandler.GetAllProvisionalBookings();
            if (listProvisionalBookings == null)
            {
                if (listProvisionalBookings == null)
                    litHeader.Text = "<h3 style=\"color:red\">There are currently no provisional bookings</h3><br />";
            }
            else
            {
                for (int i = 0; i < listProvisionalBookings.Count; i++)
                {
                    arriveDate = listProvisionalBookings[i].ArriveDate.Day + "-" + listProvisionalBookings[i].ArriveDate.Month + "-" + listProvisionalBookings[i].ArriveDate.Year;
                    departDate = listProvisionalBookings[i].DepartDate.Day + "-" + listProvisionalBookings[i].DepartDate.Month + "-" + listProvisionalBookings[i].DepartDate.Year;
                    bookingID = listProvisionalBookings[i].BookingID;
                    htmlOutput += "<tr><td>" + bookingID.ToString() + "</td><td>" + listProvisionalBookings[i].Name + "</td><td>R " + invoiceHandler.GetDepositAmount(bookingID) + "</td><td>" + arriveDate + "</td><td>" + departDate + "</td><td>" + "<a class=\"btn btn-info viewBooking\" href=\"ViewProvisionalBooking.aspx?id=" + bookingID + "\">View Booking</a>" + "</td></tr>\n";
                }
                if (!IsPostBack)
                {
                    litProvisionalBookings.Text = htmlOutput;
                }
            }

        }

        protected void rdoPaid_CheckedChanged(object sender, EventArgs e)
        {
            int bookingID = 0;
            string htmlOutput = "";
            string arriveDate = null;
            string departDate = null;

            InvoiceHandler invoiceHandler = new InvoiceHandler();

            BookingHandler bookingHandler = new BookingHandler();
            List<ProvisionalBooking> listProvisionalBookings = bookingHandler.GetProvisionalBookingsPOP();
            if (listProvisionalBookings == null)
            {
                if (listProvisionalBookings == null)
                    litProvisionalBookings.Text = "<tr><td colspan=\"6\" style=\"color:red;text-align:center;\">There are currently no provisional bookings with proof of payment</td></tr>";
            }
            else
            {
                for (int i = 0; i < listProvisionalBookings.Count; i++)
                {
                    arriveDate = listProvisionalBookings[i].ArriveDate.Day + "-" + listProvisionalBookings[i].ArriveDate.Month + "-" + listProvisionalBookings[i].ArriveDate.Year;
                    departDate = listProvisionalBookings[i].DepartDate.Day + "-" + listProvisionalBookings[i].DepartDate.Month + "-" + listProvisionalBookings[i].DepartDate.Year;
                    bookingID = listProvisionalBookings[i].BookingID;
                    htmlOutput += "<tr><td>" + bookingID.ToString() + "</td><td>" + listProvisionalBookings[i].Name + "</td><td>R " + invoiceHandler.GetDepositAmount(bookingID) + "</td><td>" + arriveDate + "</td><td>" + departDate + "</td><td>" + "<a class=\"btn btn-info viewBooking\" href=\"ViewProvisionalBooking.aspx?id=" + bookingID + "\">View Booking</a>" + "</td></tr>\n";
                }
                litProvisionalBookings.Text = htmlOutput;
            }
        }

        protected void rdoUnpaid_CheckedChanged(object sender, EventArgs e)
        {
            int bookingID = 0;
            string htmlOutput = "";
            string arriveDate = null;
            string departDate = null;

            InvoiceHandler invoiceHandler = new InvoiceHandler();

            BookingHandler bookingHandler = new BookingHandler();
            List<ProvisionalBooking> listProvisionalBookings = bookingHandler.GetProvisionalBookingsWithoutPOP();
            if (listProvisionalBookings == null)
            {
                if (listProvisionalBookings == null)
                    litProvisionalBookings.Text = "<tr><td colspan=\"6\" style=\"color:red;text-align:center;\">There are currently no provisional bookings without proof of payment</td></tr>";
            }
            else
            {
                for (int i = 0; i < listProvisionalBookings.Count; i++)
                {
                    arriveDate = listProvisionalBookings[i].ArriveDate.Day + "-" + listProvisionalBookings[i].ArriveDate.Month + "-" + listProvisionalBookings[i].ArriveDate.Year;
                    departDate = listProvisionalBookings[i].DepartDate.Day + "-" + listProvisionalBookings[i].DepartDate.Month + "-" + listProvisionalBookings[i].DepartDate.Year;
                    bookingID = listProvisionalBookings[i].BookingID;
                    htmlOutput += "<tr><td>" + bookingID.ToString() + "</td><td>" + listProvisionalBookings[i].Name + "</td><td>R " + invoiceHandler.GetDepositAmount(bookingID) + "</td><td>" + arriveDate + "</td><td>" + departDate + "</td><td>" + "<a class=\"btn btn-info viewBooking\" href=\"ViewProvisionalBooking.aspx?id=" + bookingID + "\">View Booking</a>" + "</td></tr>\n";
                }
                litProvisionalBookings.Text = htmlOutput;
            }
        }

        protected void rdoAll_CheckedChanged(object sender, EventArgs e)
        {
            int bookingID = 0;
            string htmlOutput = "";
            string arriveDate = null;
            string departDate = null;

            InvoiceHandler invoiceHandler = new InvoiceHandler();

            BookingHandler bookingHandler = new BookingHandler();
            List<ProvisionalBooking> listProvisionalBookings = bookingHandler.GetAllProvisionalBookings();
            if (listProvisionalBookings == null)
            {
                if (listProvisionalBookings == null)
                    litProvisionalBookings.Text = "<tr><td colspan=\"6\" style=\"color:red;text-align:center;\">There are currently no provisional bookings</td></tr>";
            }
            else
            {
                for (int i = 0; i < listProvisionalBookings.Count; i++)
                {
                    arriveDate = listProvisionalBookings[i].ArriveDate.Day + "-" + listProvisionalBookings[i].ArriveDate.Month + "-" + listProvisionalBookings[i].ArriveDate.Year;
                    departDate = listProvisionalBookings[i].DepartDate.Day + "-" + listProvisionalBookings[i].DepartDate.Month + "-" + listProvisionalBookings[i].DepartDate.Year;
                    bookingID = listProvisionalBookings[i].BookingID;
                    htmlOutput += "<tr><td>" + bookingID.ToString() + "</td><td>" + listProvisionalBookings[i].Name + "</td><td>R " + invoiceHandler.GetDepositAmount(bookingID) + "</td><td>" + arriveDate + "</td><td>" + departDate + "</td><td>" + "<a class=\"btn btn-info viewBooking\" href=\"ViewProvisionalBooking.aspx?id=" + bookingID + "\">View Booking</a>" + "</td></tr>\n";
                }
                litProvisionalBookings.Text = htmlOutput;
            }
        }
    }
}