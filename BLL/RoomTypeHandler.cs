using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DAL;

namespace BLL
{
    public class RoomTypeHandler
    {
        RoomTypeDBAccess roomTypeDB = null;

        public RoomTypeHandler()
        {
            roomTypeDB = new RoomTypeDBAccess();
        }

        public List<RoomType> GetRoomTypeList()
        {
            return roomTypeDB.GetRoomTypeList();
        }

        public List<RoomType> GetRoomTypeList(string selectedRadioButton)
        {
            return roomTypeDB.GetRoomTypeList(selectedRadioButton);
        }

        public bool AddNewRoomType(RoomType roomType)
        {
            return roomTypeDB.AddNewRoomType(roomType);
        }

        public bool AddNewRate(double RatePerNight, int id)
        {
            return roomTypeDB.AddNewRate(RatePerNight, id);
        }

        public bool UpdateRoomType(RoomType roomType)
        {
            return roomTypeDB.UpdateRoomType(roomType);
        }

        public bool DeleteRoomType(RoomType roomType)
        {
            return roomTypeDB.DeleteRoomType(roomType);
        }

        public RoomType GetRoomTypeDetails(int typeID)
        {
            return roomTypeDB.GetRoomTypeDetails(typeID);
        }

        public int GetLastRoomTypeID()
        {
            return roomTypeDB.GetLastRoomTypeID();
        }

        public bool ValidateRoomTypeName(string name)
        {
            RoomType roomType = new RoomType();
            roomType = roomTypeDB.ValidateRoomTypeName(name);
            bool exists = false;
            try
            {
                if (roomType.Name != null)
                    exists = true;
            }
            catch (NullReferenceException)
            {
                exists = false;
            }
            return exists;
        }


        public List<Booking> GetOccupants(string userInput, DateTime todaysDate)
        {
            return roomTypeDB.GetOccupants(userInput, todaysDate);
        }

        public DateTime GetDate()
        {
            return roomTypeDB.GetDate();
        }

        public string GetRoomNames(string roomNo)
        {
            return roomTypeDB.GetRoomNames(roomNo);
        }
    }
}
