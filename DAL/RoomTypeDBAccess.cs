using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class RoomTypeDBAccess
    {
        public List<RoomType> GetRoomTypeList()
        {
            List<RoomType> listRoomTypes = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetRoomTypeList", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listRoomTypes = new List<RoomType>();
                    foreach (DataRow row in table.Rows)
                    {
                        RoomType roomType = new RoomType();
                        roomType.TypeID = Convert.ToInt32(row["TypeID"]);
                        roomType.Name = row["Name"].ToString();

                        listRoomTypes.Add(roomType);
                    }
                }
            }
            return listRoomTypes;
        }

        public List<RoomType> GetRoomTypeList(string selectedRadioButton)
        {
            string sqlCommand = "";
            if (selectedRadioButton == "Yes")
            {
                sqlCommand = "sp_GetAvailableRoomTypes";
            }

            else
            {
                sqlCommand = "sp_GetDeletedRoomTypes";
            }
            List<RoomType> roomTypeList = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand(sqlCommand, CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    roomTypeList = new List<RoomType>();
                    foreach (DataRow row in table.Rows)
                    {
                        RoomType roomType = new RoomType();
                        roomType.TypeID = Convert.ToInt32(row["TypeID"]);
                        roomType.Name = row["Name"].ToString();
                        roomType.MaxCapacity = Convert.ToInt32(row["MaxCapacity"]);
                        roomType.Available = row["Available"].ToString();
                        roomType.RatePerNight = Convert.ToDouble(row["RatePerNight"]);
                        roomTypeList.Add(roomType);
                    }
                }
            }
            return roomTypeList;
        }

        public bool AddNewRoomType(RoomType roomType)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("Name", roomType.Name),
                new SqlParameter("MaxCapacity", roomType.MaxCapacity)
            };
            return DBHelper.ExecuteNonQuery("sp_AddNewRoomType", CommandType.StoredProcedure, parameters);
        }

        public bool AddNewRate(double RatePerNight, int id)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("RatePerNight", RatePerNight),
                new SqlParameter("TypeID", id)
                
            };
            return DBHelper.ExecuteNonQuery("sp_AddNewRate", CommandType.StoredProcedure, parameters);
        }

        public bool UpdateRoomType(RoomType roomType)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@TypeID", roomType.TypeID),
                new SqlParameter("@Name", roomType.Name),
                new SqlParameter("@MaxCapacity", roomType.MaxCapacity),
                new SqlParameter("@RatePerNight", roomType.RatePerNight)
            };

            return DBHelper.ExecuteNonQuery("sp_UpdateRoomType", CommandType.StoredProcedure, parameters);
        }

        public bool DeleteRoomType(RoomType roomType)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@TypeID", roomType.TypeID)
            };

            return DBHelper.ExecuteNonQuery("sp_DeleteRoomType", CommandType.StoredProcedure, parameters);
        }

        public RoomType GetRoomTypeDetails(int typeID)
        {
            RoomType roomType = null;
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@TypeID", typeID)
            };
            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetRoomTypeDetails", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];
                    roomType = new RoomType();
                    roomType.TypeID = Convert.ToInt32(row["TypeID"]);
                    roomType.Name = row["Name"].ToString();
                    roomType.MaxCapacity = Convert.ToInt32(row["MaxCapacity"]);
                    roomType.RatePerNight = Convert.ToDouble(row["RatePerNight"]);

                }
            }
            return roomType;
        }

        public int GetLastRoomTypeID()
        {
            int roomTypeID = 0;
            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetLastRoomTypeID", CommandType.StoredProcedure))
            {
                DataRow row = table.Rows[0];
                roomTypeID = Convert.ToInt32(row["TypeID"]);
            }
            return roomTypeID;
        }

        public DateTime GetDate()
        {
            DateTime date;
            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_DateTest", CommandType.StoredProcedure))
            {
                DataRow row = table.Rows[0];
                string x = row["ArriveDate"].ToString();
                date = DateTime.Parse(x);
            }
            return date;

        }

        public List<Booking> GetOccupants(string userInput, DateTime todaysDate)
        {
            List<Booking> listCurrentOccupants = null;

            //RoomType roomType = null;
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@UserInput", userInput),
                new SqlParameter("@TodaysDate", todaysDate)
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetCurrentOccupants", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count > 0)
                {
                    listCurrentOccupants = new List<Booking>();
                    foreach (DataRow row in table.Rows)
                    {
                        Booking booking = new Booking();
                        booking.BookingID = Convert.ToInt32(row["BookingID"]);
                        booking.ArriveDate = Convert.ToDateTime(row["ArriveDate"]);
                        booking.DepartDate = Convert.ToDateTime(row["DepartDate"]);
                        booking.FullName = Convert.ToString(row["FullName"]);
                        booking.RoomsBooked = Convert.ToString(row["RoomsBooked"]);
                        booking.MemberID = Convert.ToInt32(row["MemberID"]);

                        listCurrentOccupants.Add(booking);
                    }
                }
            }
            return listCurrentOccupants;
        }

        public RoomType ValidateRoomTypeName(string name)
        {
            RoomType roomType = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@Name", name)
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_CheckForDuplicateRoomTypeNames", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];

                    roomType = new RoomType();

                    roomType.Name = row["Name"].ToString();
                }
            }
            return roomType;
        }

        public string GetRoomNames(string roomNo)
        {
            string roomName = "";
            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@RoomNo", roomNo)
            };
            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetRoomName", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];
                    roomName = row["RoomNo"].ToString();
                }
            }
            return roomName;
        }
    }
}
