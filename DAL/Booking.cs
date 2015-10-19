using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class Booking
    {
        public int BookingID { get; set; }
        public DateTime ArriveDate { get; set; }
        public DateTime DepartDate { get; set; }
        public string ProofOfPayment { get; set; }
        public DateTime DateOfDeposit { get; set; }
        public DateTime DateOfFinalPayment { get; set; }
        public DateTime CheckinDate { get; set; }
        public DateTime CheckoutDate { get; set; }
        public string Status { get; set; }
        public int MemberID { get; set; }
        public int ConfirmedBy { get; set; }

        public string FullName { get; set; }
        public string RoomsBooked { get; set; }
    }
}
