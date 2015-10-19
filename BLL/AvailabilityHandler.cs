using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DAL;

namespace BLL
{
    public class AvailabilityHandler
    {
        AvailabilityDBAccess availabilityDB = null;

        public AvailabilityHandler()
        {
            availabilityDB = new AvailabilityDBAccess();
        }

        public bool AddAvailabilityRecord(int roomID, int year)
        {
            DateTime startOfYear = new DateTime(year, 01, 01);
            DateTime endOfYear = new DateTime(year, 12, 31);
            bool x = false;

            for (DateTime dateCount = startOfYear; dateCount <= endOfYear; dateCount = dateCount.AddDays(1))
            {
                x = availabilityDB.AddAvailabilityRecord(roomID, dateCount);
            }

            return x;
        }

        public List<RoomAndType> GetListOfAllRooms()
        {
            return availabilityDB.GetListOfAllRooms();
        }

        public List<RoomAndType> GetListOfSpecificRooms(int typeID)
        {
            return availabilityDB.GetListOfSpecificRooms(typeID);
        }

        public RoomAndType GetAvailableRoomDetails(int roomID)
        {
            return availabilityDB.GetAvailableRoomDetails(roomID);
        }

        public bool CheckAvailability(int roomID, DateTime startDate, DateTime endDate)
        {
            return availabilityDB.CheckAvailability(roomID, startDate, endDate);
        }
    }
}
