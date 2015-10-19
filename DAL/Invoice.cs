using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class Invoice
    {
        public int InvoiceNo { get; set; }
        public int BookingID { get; set; }
        public string Rooms { get; set; }
        public string Rates { get; set; }
    }
}
