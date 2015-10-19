using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class ProvisionalBooking
    {
        public int BookingID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string PhoneNo { get; set; }
        public DateTime ArriveDate { get; set; }
        public DateTime DepartDate { get; set; }
        public string ProofOfPayment { get; set; }
    }
}
