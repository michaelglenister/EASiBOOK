using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class RoomAndType
    {
        public int RoomID { get; set; }
        public string RoomNo { get; set; }
        public string Name { get; set; }
        public string Picture { get; set; }
        public int MaxCapacity { get; set; }
        public double Rate { get; set; }
    }
}
