using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class Availability
    {
        public int RoomID { get; set; }
        public DateTime Date { get; set; }
        public int Available { get; set; }
        public int BookingID { get; set; }
    }
}
