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
    public partial class CheckList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int bookingID = 0;
            string htmlOutput = "";
            string arriveDate = null;
            string departDate = null;

            InvoiceHandler invoiceHandler = new InvoiceHandler();

            BookingHandler bookingHandler = new BookingHandler();
            List<ProvisionalBooking> listAllConfirmedBookings = bookingHandler.GetAllConfirmedBookings();
            if (listAllConfirmedBookings == null)
            {
                if (listAllConfirmedBookings == null)
                    litHeader.Text = "<h3 style=\"color:red\">There are currently no confirmed bookings</h3><br />";
            }
            else
            {
                for (int i = 0; i < listAllConfirmedBookings.Count; i++)
                {
                    arriveDate = listAllConfirmedBookings[i].ArriveDate.Day + "-" + listAllConfirmedBookings[i].ArriveDate.Month + "-" + listAllConfirmedBookings[i].ArriveDate.Year;
                    departDate = listAllConfirmedBookings[i].DepartDate.Day + "-" + listAllConfirmedBookings[i].DepartDate.Month + "-" + listAllConfirmedBookings[i].DepartDate.Year;
                    bookingID = listAllConfirmedBookings[i].BookingID;
                    htmlOutput += "<tr><td>" + bookingID.ToString() + "</td><td>" + listAllConfirmedBookings[i].Name + "</td><td>" + arriveDate + "</td><td>" + departDate + "</td><td>" + "<a class=\"btn btn-info viewBooking\" href=\"Checkin.aspx?id=" + bookingID + "\">Check-in</a>" + "</td></tr>\n";
                }
                if (!IsPostBack)
                {
                    litConfirmedBookings.Text = htmlOutput;
                }
            }
        }
    }
}