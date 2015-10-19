using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DAL;

namespace BLL
{
    public class RoomHandler
    {
        RoomDBAccess roomDB = null;

        public RoomHandler()
        {
            roomDB = new RoomDBAccess();
        }

        public List<Room> GetRoomList()
        {
            return roomDB.GetRoomList();
        }

        public List<Room> GetDisabledRoomList()
        {
            return roomDB.GetDisabledRoomList();
        }

        public List<Room> GetTypeList()
        {
            return roomDB.GetTypeList();
        }

        public bool AddNewRoom(Room room)
        {
            return roomDB.AddNewRoom(room);
        }

        public bool DisableRoom(Room room)
        {
            return roomDB.DisableRoom(room);
        }

        public int GetLastRoomID()
        {
            return roomDB.GetLastRoomID();
        }

        public Room GetRoomDetails(int roomID)
        {
            return roomDB.GetRoomDetails(roomID);
        }

        public bool UpdateRoom(Room room)
        {
            return roomDB.UpdateRoom(room);
        }

        public bool ValidateRoomNo(string roomNo)
        {
            Room room = new Room();
            room = roomDB.ValidateRoomNo(roomNo);
            bool exists = false;
            try
            {
                if (room.RoomNo != null)
                    exists = true;
            }
            catch (NullReferenceException)
            {
                exists = false;
            }
            return exists;
        }
    }
}
