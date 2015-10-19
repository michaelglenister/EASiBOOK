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
    public partial class MakeBooking : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            double totalPrice = 0;
            string selectedRooms = null;
            DateTime startDate = new DateTime();
            DateTime endDate = new DateTime();
            try
            {
                selectedRooms = (string)Session["SelectedRooms"];
                startDate = (DateTime)Session["StartDate"];
                endDate = (DateTime)Session["EndDate"];
            }
            catch (NullReferenceException)
            {
                Response.Redirect("Availability.aspx");
            }

            double noOfDays = (endDate - startDate).TotalDays;
            string htmlOutput = "";
            string[] rooms = null;
            try
            {
                rooms = selectedRooms.Split(',');
            }
            catch (NullReferenceException)
            {
                Response.Redirect("Availability.aspx");
            }

            int roomCount = rooms.Count();
            RoomAndType roomAndType = null;
            AvailabilityHandler availabilityHandler = new AvailabilityHandler();
            for (int i = 0; i < roomCount -1; i++)
            {
                roomAndType = availabilityHandler.GetAvailableRoomDetails(Convert.ToInt32(rooms[i]));
                totalPrice = totalPrice + (roomAndType.Rate * noOfDays);
                htmlOutput += "<tr><td>" + roomAndType.RoomNo + "</td><td>" + roomAndType.Name + "</td><td>" + roomAndType.MaxCapacity + "</td><td>R " + roomAndType.Rate + "</td><td>R " + (roomAndType.Rate * noOfDays).ToString() +"</td></tr>";
            }

            litAvailableRooms.Text = htmlOutput;

            BusinessHandler businessHandler = new BusinessHandler();
            Business business = businessHandler.GetBusinessDetails();

            double depositPercent = business.DepositPercent;
            depositPercent = depositPercent / 100;
            lblDeposit.Text = (totalPrice * depositPercent).ToString();
            lblTotalCost.Text = totalPrice.ToString();

            litDates.Text = startDate.Year + "-" + startDate.Month + "-" + startDate.Day + " to " + endDate.Year + "-" + endDate.Month + "-" + endDate.Day;
        }

        protected void btnReselect_Click(object sender, EventArgs e)
        {
            Response.Redirect("ShowAvailability.aspx");
        }

        protected void btnFinishBooking_Click(object sender, EventArgs e)
        {
            int bookingID = 0;
            string selectedRooms = null;
            DateTime startDate = new DateTime();
            DateTime endDate = new DateTime();
            int memberID = 0;
            try
            {
                selectedRooms = (string)Session["SelectedRooms"];
                startDate = (DateTime)Session["StartDate"];
                endDate = (DateTime)Session["EndDate"];
                memberID = (int)Session["MemberID"];
            }
            catch (NullReferenceException)
            {
                Response.Redirect("Availability.aspx");
            }

            BookingHandler bookingHandler = new BookingHandler();
            bookingHandler.CreateBooking(startDate, endDate, memberID, selectedRooms);

            try
            {
                bookingID = bookingHandler.GetLastBookingID();
            }
            catch (Exception)
            {
            }
            Session["BookingID"] = bookingID;
            Response.Redirect("SuccessfullBooking.aspx");
        }
    }
}