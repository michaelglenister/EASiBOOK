using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class Room
    {
        public int RoomID { get; set; }
        public string RoomNo { get; set; }
        public string Description { get; set; }
        public string Picture { get; set; }
        public int TypeID { get; set; }
        public string Status { get; set; }
        public string WifiStatus { get; set; }
        public string AirconStatus { get; set; }
        public string RoomserviceStatus { get; set; }
        public string TelevisionStatus { get; set; }

        public string Name { get; set; }
        public int MaxCapacity { get; set; }
    }
}
