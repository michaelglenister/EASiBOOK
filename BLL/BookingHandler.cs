using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DAL;

namespace BLL
{
    public class BookingHandler
    {
        BookingDBAccess bookingDB = null;

        public BookingHandler()
        {
            bookingDB = new BookingDBAccess();
        }

        public bool CreateBooking(DateTime startDate, DateTime endDate, int memberID, string selectedRooms)
        {
            bookingDB.CreateBooking(startDate, endDate, memberID);
            int bookingID = bookingDB.GetLastBookingID();
            int roomID = 0;
            string rate = "";
            string[] rooms = selectedRooms.Split(',');
            int roomCount = rooms.Count();
            for (int i = 0; i < roomCount - 1; i++)
            {
                roomID = Convert.ToInt32(rooms[i]);
                bookingDB.SetUnavailable(startDate, endDate, roomID, bookingID);
                rate += bookingDB.GetRate(roomID).ToString() + "#";
            }

            InvoiceDBAccess invoiceDB = new InvoiceDBAccess();
            invoiceDB.CreateInvoice(bookingID, selectedRooms, rate);
            return true;
        }

        public List<ProvisionalBooking> GetAllProvisionalBookings()
        {
            return bookingDB.GetAllProvisionalBookings();
        }

        public List<ProvisionalBooking> GetProvisionalBookingsPOP()
        {
            return bookingDB.GetProvisionalBookingsPOP();
        }

        public List<ProvisionalBooking> GetProvisionalBookingsWithoutPOP()
        {
            return bookingDB.GetProvisionalBookingsWithoutPOP();
        }

        public ProvisionalBooking GetProvisionalBookingDetails(int bookingID)
        {
            return bookingDB.GetProvisionalBookingDetails(bookingID);
        }

        public bool UpdateProofOfPayment(Booking booking)
        {
            return bookingDB.UpdateProofOfPayment(booking);
        }

        public bool ConfirmBooking(int bookingID)
        {
            return bookingDB.ConfirmBooking(bookingID);
        }

        public bool DeclineBooking(int bookingID)
        {
            bookingDB.SetAvailable(bookingID);
            return bookingDB.DeclineBooking(bookingID);
        }

        public int GetLastBookingID()
        {
            return bookingDB.GetLastBookingID();
        }

        public List<ProvisionalBooking> GetAllConfirmedBookings()
        {
            return bookingDB.GetAllConfirmedBookings();
        }

        public List<ProvisionalBooking> GetCheckedInBookings()
        {
            return bookingDB.GetCheckedInBookings();
        }

        public bool Checkin(int bookingID)
        {
            return bookingDB.Checkin(bookingID);
        }

        public bool Checkout(int bookingID)
        {
            return bookingDB.Checkout(bookingID);
        }

        public List<Booking> GetBookingHistory(int memberID)
        {
            return bookingDB.GetBookingHistory(memberID);
        }

        public bool CancelBooking(int bookingID)
        {
            bookingDB.SetAvailable(bookingID);
            return bookingDB.CancelBooking(bookingID);
        }

        public int GetBookingOwner(int bookingID)
        {
            return bookingDB.GetBookingOwner(bookingID);
        }

    }
}
