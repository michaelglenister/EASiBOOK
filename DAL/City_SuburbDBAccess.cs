using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class City_SuburbDBAccess
    {
        public List<City_Suburb> GetCityList()
        {
            List<City_Suburb> listCities = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetCities", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listCities = new List<City_Suburb>();
                    foreach (DataRow row in table.Rows)
                    {
                        City_Suburb city_Suburb = new City_Suburb();
                        city_Suburb.CityID = Convert.ToInt32(row["CityID"]);
                        city_Suburb.CityName = row["CityName"].ToString();

                        listCities.Add(city_Suburb);
                    }
                }
            }
            return listCities;
        }

        public List<City_Suburb> GetSuburbList(int cityID)
        {
            List<City_Suburb> listSuburbs = null;

            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@CityID", cityID)
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetSuburbs", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count > 0)
                {
                    listSuburbs = new List<City_Suburb>();
                    foreach (DataRow row in table.Rows)
                    {
                        City_Suburb city_Suburb = new City_Suburb();
                        city_Suburb.SuburbName = row["SuburbName"].ToString();
                        city_Suburb.PostalCode = row["PostalCode"].ToString();

                        listSuburbs.Add(city_Suburb);
                    }
                }
            }
            return listSuburbs;
        }
    }
}
