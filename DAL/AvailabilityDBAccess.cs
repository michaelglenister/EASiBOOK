using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class AvailabilityDBAccess
    {
        public bool AddAvailabilityRecord(int roomID, DateTime date)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@RoomID", roomID),
                new SqlParameter("@date", date),
                new SqlParameter("@Available", 1)
		    };

            return DBHelper.ExecuteNonQuery("sp_AddAvailabilityRecord", CommandType.StoredProcedure, parameters);
        }

        public List<RoomAndType> GetListOfAllRooms()
        {
            List<RoomAndType> listOfAllRooms = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetListOfAllRooms", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listOfAllRooms = new List<RoomAndType>();
                    foreach (DataRow row in table.Rows)
                    {
                        RoomAndType roomAndType = new RoomAndType();
                        roomAndType.RoomID = Convert.ToInt32(row["RoomID"]);
                        roomAndType.RoomNo = row["RoomNo"].ToString();
                        roomAndType.Name = row["Name"].ToString();
                        roomAndType.Picture = row["Picture"].ToString();
                        roomAndType.MaxCapacity = Convert.ToInt32(row["MaxCapacity"]);
                        roomAndType.Rate = Convert.ToDouble(row["RatePerNight"]);

                        listOfAllRooms.Add(roomAndType);
                    }
                }
            }
            return listOfAllRooms;

        }

        public List<RoomAndType> GetListOfSpecificRooms(int typeID)
        {
            List<RoomAndType> listOfAllRooms = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@TypeID", typeID)
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetListOfSpecificRooms", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count > 0)
                {
                    listOfAllRooms = new List<RoomAndType>();
                    foreach (DataRow row in table.Rows)
                    {
                        RoomAndType roomAndType = new RoomAndType();
                        roomAndType.RoomID = Convert.ToInt32(row["RoomID"]);
                        roomAndType.RoomNo = row["RoomNo"].ToString();
                        roomAndType.Name = row["Name"].ToString();
                        roomAndType.Picture = row["Picture"].ToString();
                        roomAndType.MaxCapacity = Convert.ToInt32(row["MaxCapacity"]);
                        roomAndType.Rate = Convert.ToDouble(row["RatePerNight"]);

                        listOfAllRooms.Add(roomAndType);
                    }
                }
            }
            return listOfAllRooms;

        }

        public RoomAndType GetAvailableRoomDetails(int roomID)
        {
            RoomAndType roomAndType = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@roomID", roomID)
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetSpecificAvailableRoom", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];
                    roomAndType = new RoomAndType();
                    roomAndType.RoomID = Convert.ToInt32(row["RoomID"]);
                    roomAndType.RoomNo = row["RoomNo"].ToString();
                    roomAndType.Name = row["Name"].ToString();
                    roomAndType.MaxCapacity = Convert.ToInt32(row["MaxCapacity"]);
                    roomAndType.Rate = Convert.ToDouble(row["RatePerNight"]);
                }
            }
            return roomAndType;
        }

        public bool CheckAvailability(int roomID, DateTime startDate, DateTime endDate)
        {
            bool available = false;
            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@RoomID", roomID),
                new SqlParameter("@StartDate", startDate),
                new SqlParameter("@EndDate", endDate)
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_CheckAvailability", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count > 0)
                    available = false;
                else
                    available = true;
            }
            return available;
        }
    }
}
