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
    public partial class Invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int invoiceID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["id"], out invoiceID);

            if (invoiceID == 0)
                Response.Redirect("Default.aspx");

            litInvoiceNo.Text = invoiceID.ToString();

            BusinessHandler businessHandler = new BusinessHandler();
            Business business = businessHandler.GetBusinessDetails();

            lblCompanyName.Text = business.Name;
            lblAddressLine1.Text = business.AddressLine1;
            lblAddressLine2.Text = business.AddressLine2;
            lblPhoneNo.Text = business.PhoneNo;
            lblEmail.Text = business.Email;
            lblBankName.Text = business.BankName;
            lblBankAccountNo.Text = business.AccountNo;
            lblBranchCode.Text = business.BranchCode;

            InvoiceHandler invoiceHandler = new InvoiceHandler();
            DAL.Invoice invoice = invoiceHandler.GetInvoiceDetails(invoiceID);
            int bookingID = 0;
            try
            {
                bookingID = invoice.BookingID;
            }
            catch (NullReferenceException)
            {
                Response.Redirect("Default.aspx");
            }

            BookingHandler bookingHandler = new BookingHandler();
            ProvisionalBooking provisionalBooking = bookingHandler.GetProvisionalBookingDetails(bookingID);
            lblArriveDate.Text = provisionalBooking.ArriveDate.Year + "-" + provisionalBooking.ArriveDate.Month + "-" + provisionalBooking.ArriveDate.Day;
            lblDepartDate.Text = provisionalBooking.DepartDate.Year + "-" + provisionalBooking.DepartDate.Month + "-" + provisionalBooking.DepartDate.Day;

            //Get all rooms in booking
            double totalPrice = 0;
            DateTime startDate = new DateTime();
            DateTime endDate = new DateTime();
            startDate = provisionalBooking.ArriveDate;
            endDate = provisionalBooking.DepartDate;
            double noOfDays = (endDate - startDate).TotalDays;
            string htmlOutput = "";
            string[] rooms = invoice.Rooms.Split(',');
            int roomCount = rooms.Count();
            RoomAndType roomAndType = null;
            AvailabilityHandler availabilityHandler = new AvailabilityHandler();
            for (int i = 0; i < roomCount - 1; i++)
            {
                roomAndType = availabilityHandler.GetAvailableRoomDetails(Convert.ToInt32(rooms[i]));
                totalPrice = totalPrice + (roomAndType.Rate * noOfDays);
                htmlOutput += "<tr><td>" + roomAndType.RoomNo + "</td><td>" + roomAndType.Name + "</td><td>R " + roomAndType.Rate + "</td><td>R " + (roomAndType.Rate * noOfDays).ToString() + "</td></tr>";
            }
            //end get all rooms in booking

            litSelectedRooms.Text = htmlOutput;
            double depositAmount = invoiceHandler.GetDepositAmount(bookingID);
            double totalAmount = invoiceHandler.GetTotalAmount(bookingID);
            lblDeposit.Text = depositAmount.ToString();
            lblTotalAmount.Text = totalAmount.ToString();
        }
    }
}