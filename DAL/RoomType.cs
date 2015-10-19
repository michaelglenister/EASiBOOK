using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class RoomType
    {
        public int TypeID { get; set; }
        public string Name { get; set; }
        public int MaxCapacity { get; set; }
        public string Available { get; set; }
        public double RatePerNight { get; set; }
    }
}
