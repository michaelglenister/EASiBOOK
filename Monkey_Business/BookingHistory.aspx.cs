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
    public partial class BookingHistory : System.Web.UI.Page
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
            //Checks for a login
            if (Session["MemberID"] != null)
                loggedIn = true;
            if (loggedIn == false)
            {
                Session["LoginRedirect"] = "BookingHistory.aspx?id=";
                Response.Redirect("Login.aspx");
            }
            //End of login check
            MemberHandler memberHandler = new MemberHandler();
            Member member = memberHandler.GetMemberDetails(memberID);
            try
            {
                litMemberName.Text = member.FirstName + ' ' + member.Surname;
            }
            catch (NullReferenceException)
            {
                Response.Redirect("Default.aspx");
            }
            //Checks if role is high enough
            myRole = memberHandler.GetRole((int)Session["MemberID"]);
            if (myRole != 3 && (int)Session["MemberID"] != memberID)
            {
                Response.Redirect("Default.aspx");
            }
            //End check for role

            BookingHandler bookingHandler = new BookingHandler();
            List<Booking> bookingHistory = bookingHandler.GetBookingHistory(memberID);
            if (bookingHistory == null)
                litError.Text = "<h3 style=\"color:red\">There are no previous or current bookings</h3><br />";
            else
            {
                int bookingID = 0;
                string htmlOutput = "";
                string proofOfPayment = "No";
                string arriveDate = "";
                string departDate = "";
                string uploadProofText = "Upload";
                string colour = "blue";
                string status = "";
                string cancelButton = "";
                for (int i = 0; i < bookingHistory.Count; i++)
                {
                    bookingID = bookingHistory[i].BookingID;
                    arriveDate = bookingHistory[i].ArriveDate.Year.ToString() + '-' + bookingHistory[i].ArriveDate.Month.ToString() + '-' + bookingHistory[i].ArriveDate.Day.ToString();
                    departDate = bookingHistory[i].DepartDate.Year.ToString() + '-' + bookingHistory[i].DepartDate.Month.ToString() + '-' + bookingHistory[i].DepartDate.Day.ToString();
                    if (bookingHistory[i].ProofOfPayment == null || bookingHistory[i].ProofOfPayment == "")
                    {
                        proofOfPayment = "No";
                        uploadProofText = "Upload";
                    }
                    else
                    {
                        proofOfPayment = "Yes";
                        uploadProofText = "Re-Upload";
                    }
                    switch (bookingHistory[i].Status)
                    {
                        case "P": colour = "#FF6600";
                            status = "Provisional";
                            break;
                        case "C": colour = "#00C0FF";
                            status = "Cancelled";
                            break;
                        case "D": colour = "#FF3300";
                            status = "Declined";
                            break;
                        case "A": colour = "#66FF66";
                            status = "Confirmed";
                            break;
                        default: colour = "#66CCFF";
                            break;
                    }
                    if (bookingHistory[i].Status != "C" && bookingHistory[i].Status != "D" && bookingHistory[i].ArriveDate > DateTime.Now.AddDays(-1))
                        cancelButton = "<a class=\"btn btn-danger\" style=\"width:130px;height:30px;\" href=\"CancelBooking.aspx?id=" + bookingID.ToString() + "&return=" + memberID.ToString() + "\">Cancel Booking</a>";
                    else
                        cancelButton = "<strong>Unavailable</strong>";

                    htmlOutput += "<tr style=\"background-color:" + colour + "\"><td>" + bookingID.ToString() + "</td><td>" + arriveDate + "</td><td>" + departDate + "</td><td>" + status + "</td><td>" + proofOfPayment + "</td><td>" + "<a class=\"btn btn-success\" style=\"width:100px;height:30px;\" href=\"UploadProof.aspx?id=" + bookingID.ToString() + "\">" + uploadProofText + "</a>" + "</td><td><a class=\"btn btn-warning\" style=\"width:100px;height:30px;\" href=\"Invoice.aspx?id=" + bookingID.ToString() + "\">Invoice</a></td><td>" + cancelButton + "</td></tr>\n";
                }
                litBookingHistory.Text = htmlOutput;
            }

        }
    }
}