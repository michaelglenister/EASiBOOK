using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DAL;

namespace BLL
{
    public class City_SuburbHandler
    {
        City_SuburbDBAccess city_SuburbDB = null;

        public City_SuburbHandler()
        {
            city_SuburbDB = new City_SuburbDBAccess();
        }

        public List<City_Suburb> GetCityList()
        {
            return city_SuburbDB.GetCityList();
        }

        public List<City_Suburb> GetSuburbList(int cityID)
        {
            return city_SuburbDB.GetSuburbList(cityID);
        }
    }
}
