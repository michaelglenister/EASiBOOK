using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class City_Suburb
    {
        //City Table Values
        public int CityID { get; set; }
        public string CityName { get; set; }

        //Suburb Table Values
        public int SuburbID { get; set; }
        public string SuburbName { get; set; }
        public string PostalCode { get; set; }
    }
}
