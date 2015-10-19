using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class RoomDBAccess
    {
        public List<Room> GetRoomList()
        {
            List<Room> listRooms = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetRoomList", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listRooms = new List<Room>();

                    foreach (DataRow row in table.Rows)
                    {
                        Room room = new Room();
                        room.RoomID = Convert.ToInt32(row["RoomID"]);
                        room.RoomNo = row["RoomNo"].ToString();
                        room.Description = row["Description"].ToString();
                        room.Picture = row["Picture"].ToString();
                        room.TypeID = Convert.ToInt32(row["TypeID"]);
                        room.Name = row["Name"].ToString();
                        room.MaxCapacity = Convert.ToInt32(row["MaxCapacity"]);

                        listRooms.Add(room);
                    }
                }
            }

            return listRooms;
        }

        public List<Room> GetDisabledRoomList()
        {
            List<Room> listRooms = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetDisabledRoomList", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listRooms = new List<Room>();

                    foreach (DataRow row in table.Rows)
                    {
                        Room room = new Room();
                        room.RoomID = Convert.ToInt32(row["RoomID"]);
                        room.RoomNo = row["RoomNo"].ToString();
                        room.Description = row["Description"].ToString();
                        room.Picture = row["Picture"].ToString();
                        room.TypeID = Convert.ToInt32(row["TypeID"]);
                        room.Name = row["Name"].ToString();
                        room.MaxCapacity = Convert.ToInt32(row["MaxCapacity"]);

                        listRooms.Add(room);
                    }
                }
            }

            return listRooms;
        }

        public List<Room> GetTypeList()
        {
            List<Room> listTypes = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetTypeList", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listTypes = new List<Room>();

                    foreach (DataRow row in table.Rows)
                    {
                        Room room = new Room();

                        room.TypeID = Convert.ToInt32(row["TypeID"]);
                        room.Name = row["Name"].ToString();
                        room.MaxCapacity = Convert.ToInt32(row["MaxCapacity"]);

                        listTypes.Add(room);
                    }
                }
            }

            return listTypes;
        }

        public bool AddNewRoom(Room room)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@RoomNo", room.RoomNo),
			    new SqlParameter("@Description", room.Description),
			    new SqlParameter("@Picture", room.Picture),
			    new SqlParameter("@TypeID", room.TypeID),
                new SqlParameter("@WifiStatus", room.WifiStatus),
                new SqlParameter("@AirconStatus", room.AirconStatus),
                new SqlParameter("@RoomserviceStatus", room.RoomserviceStatus),
                new SqlParameter("@TelevisionStatus", room.TelevisionStatus)
		    };

            return DBHelper.ExecuteNonQuery("sp_AddNewRoom", CommandType.StoredProcedure, parameters);
        }

        public bool DisableRoom(Room room)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@RoomID", room.RoomID)
		    };

            return DBHelper.ExecuteNonQuery("sp_DisableRoom", CommandType.StoredProcedure, parameters);
        }

        public int GetLastRoomID()
        {
            int roomID = 0;
            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetLastRoomID", CommandType.StoredProcedure))
            {
                if (table.Rows.Count >= 1)
                {
                    DataRow row = table.Rows[0];
                    roomID = Convert.ToInt32(row["RoomID"]);
                }
            }
            return roomID;
        }

        public Room GetRoomDetails(int roomID)
        {
            Room room = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@RoomID", roomID),
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetRoomDetails", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count >= 1)
                {
                    DataRow row = table.Rows[0];
                    room = new Room();

                    room.RoomNo = row["RoomNo"].ToString();
                    room.Description = row["Description"].ToString();
                    room.Picture = row["Picture"].ToString();
                    room.TypeID = Convert.ToInt32(row["TypeID"]);
                    room.Status = row["Status"].ToString();
                    room.WifiStatus = row["WifiStatus"].ToString();
                    room.AirconStatus = row["AirconStatus"].ToString();
                    room.RoomserviceStatus = row["RoomserviceStatus"].ToString();
                    room.TelevisionStatus = row["TelevisionStatus"].ToString();
                }
            }
            return room;
        }

        public bool UpdateRoom(Room room)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@RoomID", room.RoomID),
                new SqlParameter("@RoomNo", room.RoomNo),
			    new SqlParameter("@Description", room.Description),
			    new SqlParameter("@Picture", room.Picture),
			    new SqlParameter("@TypeID", room.TypeID),
                new SqlParameter("@Status", room.Status),
                new SqlParameter("@WifiStatus", room.WifiStatus),
                new SqlParameter("@AirconStatus", room.AirconStatus),
                new SqlParameter("@RoomserviceStatus", room.RoomserviceStatus),
                new SqlParameter("@TelevisionStatus", room.TelevisionStatus)
		    };

            return DBHelper.ExecuteNonQuery("sp_UpdateRoom", CommandType.StoredProcedure, parameters);
        }

        public Room ValidateRoomNo(string roomNo)
        {
            Room room = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@RoomNo", roomNo)
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_ValidateRoomNo", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];

                    room = new Room();

                    room.RoomNo = row["RoomNo"].ToString();
                }
            }
            return room;
        }
    }
}
