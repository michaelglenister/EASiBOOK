using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class BookingDBAccess
    {
        public bool CreateBooking(DateTime startDate, DateTime endDate, int memberID)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
                new SqlParameter("@ArriveDate", startDate),
                new SqlParameter("@DepartDate", endDate),
                new SqlParameter("@MemberID", memberID),
		    };

            return DBHelper.ExecuteNonQuery("sp_CreateBooking", CommandType.StoredProcedure, parameters);
        }

        public bool SetUnavailable(DateTime startDate, DateTime endDate, int roomID, int bookingID)
        {
            endDate = endDate.AddDays(-1);
            SqlParameter[] parameters = new SqlParameter[]
		    {                
                new SqlParameter("@StartDate", startDate),
                new SqlParameter("@EndDate", endDate),
                new SqlParameter("@RoomID", roomID),
                new SqlParameter("@BookingID", bookingID),
		    };

            return DBHelper.ExecuteNonQuery("sp_SetUnavailable", CommandType.StoredProcedure, parameters);
        }

        public bool SetAvailable(int bookingID)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
                new SqlParameter("@BookingID", bookingID)
		    };

            return DBHelper.ExecuteNonQuery("sp_SetAvailable", CommandType.StoredProcedure, parameters);
        }

        public int GetLastBookingID()
        {
            int bookingID = 0;
            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetLastBookingID", CommandType.StoredProcedure))
            {
                if (table.Rows.Count >= 1)
                {
                    DataRow row = table.Rows[0];
                    bookingID = Convert.ToInt32(row["BookingID"]);
                }
            }
            return bookingID;
        }

        public double GetRate(int roomID)
        {
            double rate = 0;

            SqlParameter[] parameters = new SqlParameter[]
		    {                
                new SqlParameter("@RoomID", roomID)
		    };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetRate", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count >= 1)
                {
                    DataRow row = table.Rows[0];
                    rate = Convert.ToInt32(row["RatePerNight"]);
                }
            }
            return rate;
        }

        public List<ProvisionalBooking> GetAllProvisionalBookings()
        {
            List<ProvisionalBooking> listAllProvisionalBookings = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetAllProvisionalBookings", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listAllProvisionalBookings = new List<ProvisionalBooking>();
                    foreach (DataRow row in table.Rows)
                    {
                        ProvisionalBooking provisionalBooking = new ProvisionalBooking();
                        provisionalBooking.BookingID = Convert.ToInt32(row["BookingID"]);
                        provisionalBooking.Name = row["Name"].ToString();
                        provisionalBooking.ArriveDate = Convert.ToDateTime(row["ArriveDate"]);
                        provisionalBooking.DepartDate = Convert.ToDateTime(row["DepartDate"]);

                        listAllProvisionalBookings.Add(provisionalBooking);
                    }
                }
            }
            return listAllProvisionalBookings;
        }

        public List<ProvisionalBooking> GetProvisionalBookingsPOP()
        {
            List<ProvisionalBooking> listAllProvisionalBookings = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetProvisionalBookingsPOP", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listAllProvisionalBookings = new List<ProvisionalBooking>();
                    foreach (DataRow row in table.Rows)
                    {
                        ProvisionalBooking provisionalBooking = new ProvisionalBooking();
                        provisionalBooking.BookingID = Convert.ToInt32(row["BookingID"]);
                        provisionalBooking.Name = row["Name"].ToString();
                        provisionalBooking.ArriveDate = Convert.ToDateTime(row["ArriveDate"]);
                        provisionalBooking.DepartDate = Convert.ToDateTime(row["DepartDate"]);

                        listAllProvisionalBookings.Add(provisionalBooking);
                    }
                }
            }
            return listAllProvisionalBookings;
        }


        public List<ProvisionalBooking> GetProvisionalBookingsWithoutPOP()
        {
            List<ProvisionalBooking> listAllProvisionalBookings = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetProvisionalBookingsWithoutPOP", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listAllProvisionalBookings = new List<ProvisionalBooking>();
                    foreach (DataRow row in table.Rows)
                    {
                        ProvisionalBooking provisionalBooking = new ProvisionalBooking();
                        provisionalBooking.BookingID = Convert.ToInt32(row["BookingID"]);
                        provisionalBooking.Name = row["Name"].ToString();
                        provisionalBooking.ArriveDate = Convert.ToDateTime(row["ArriveDate"]);
                        provisionalBooking.DepartDate = Convert.ToDateTime(row["DepartDate"]);

                        listAllProvisionalBookings.Add(provisionalBooking);
                    }
                }
            }
            return listAllProvisionalBookings;
        }

        public ProvisionalBooking GetProvisionalBookingDetails(int bookingID)
        {
            ProvisionalBooking provisionalBooking = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@BookingID", bookingID),
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetProvisionalBookingDetails", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count == 1)
                {
                    DataRow row = table.Rows[0];

                    provisionalBooking = new ProvisionalBooking();
                    provisionalBooking.Name = row["Name"].ToString();
                    provisionalBooking.Email = row["Email"].ToString();
                    provisionalBooking.PhoneNo = row["PhoneNo"].ToString();
                    provisionalBooking.ArriveDate = Convert.ToDateTime(row["ArriveDate"]);
                    provisionalBooking.DepartDate = Convert.ToDateTime(row["DepartDate"]);
                    try
                    {
                        provisionalBooking.ProofOfPayment = row["ProofOfPayment"].ToString();
                    }
                    catch (NullReferenceException)
                    {
                        provisionalBooking.ProofOfPayment = null;
                    }
                }
            }
            return provisionalBooking;
        }

        public bool UpdateProofOfPayment(Booking booking)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@BookingID", booking.BookingID),
                new SqlParameter("@ProofOfPayment", booking.ProofOfPayment)
		    };

            return DBHelper.ExecuteNonQuery("sp_UpdateProofOfPayment", CommandType.StoredProcedure, parameters);
        }

        public bool ConfirmBooking(int bookingID)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@BookingID", bookingID)
		    };

            return DBHelper.ExecuteNonQuery("sp_ConfirmBooking", CommandType.StoredProcedure, parameters);
        }

        public bool DeclineBooking(int bookingID)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@BookingID", bookingID)
		    };

            return DBHelper.ExecuteNonQuery("sp_DeclineBooking", CommandType.StoredProcedure, parameters);
        }

        public List<ProvisionalBooking> GetAllConfirmedBookings()
        {
            List<ProvisionalBooking> listAllConfirmedBookings = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetConfirmedBookings", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listAllConfirmedBookings = new List<ProvisionalBooking>();
                    foreach (DataRow row in table.Rows)
                    {
                        ProvisionalBooking provisionalBooking = new ProvisionalBooking();
                        provisionalBooking.BookingID = Convert.ToInt32(row["BookingID"]);
                        provisionalBooking.Name = row["Name"].ToString();
                        provisionalBooking.ArriveDate = Convert.ToDateTime(row["ArriveDate"]);
                        provisionalBooking.DepartDate = Convert.ToDateTime(row["DepartDate"]);

                        listAllConfirmedBookings.Add(provisionalBooking);
                    }
                }
            }
            return listAllConfirmedBookings;
        }

        public List<ProvisionalBooking> GetCheckedInBookings()
        {
            List<ProvisionalBooking> listAllConfirmedBookings = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetCheckedInBookings", CommandType.StoredProcedure))
            {
                if (table.Rows.Count > 0)
                {
                    listAllConfirmedBookings = new List<ProvisionalBooking>();
                    foreach (DataRow row in table.Rows)
                    {
                        ProvisionalBooking provisionalBooking = new ProvisionalBooking();
                        provisionalBooking.BookingID = Convert.ToInt32(row["BookingID"]);
                        provisionalBooking.Name = row["Name"].ToString();
                        provisionalBooking.ArriveDate = Convert.ToDateTime(row["CheckinDate"]);

                        listAllConfirmedBookings.Add(provisionalBooking);
                    }
                }
            }
            return listAllConfirmedBookings;
        }

        public bool Checkin(int bookingID)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@BookingID", bookingID),
                new SqlParameter("@CheckinDate", DateTime.Now)
		    };

            return DBHelper.ExecuteNonQuery("sp_Checkin", CommandType.StoredProcedure, parameters);
        }

        public bool Checkout(int bookingID)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@BookingID", bookingID),
                new SqlParameter("@CheckoutDate", DateTime.Now)
		    };

            return DBHelper.ExecuteNonQuery("sp_Checkout", CommandType.StoredProcedure, parameters);
        }

        public List<Booking> GetBookingHistory(int memberID)
        {
            List<Booking> bookingHistory = null;

            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@MemberID", memberID)
		    };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetBookingHistory", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count > 0)
                {
                    bookingHistory = new List<Booking>();
                    foreach (DataRow row in table.Rows)
                    {
                        Booking booking = new Booking();
                        booking.BookingID = Convert.ToInt32(row["BookingID"]);
                        booking.ArriveDate = Convert.ToDateTime(row["ArriveDate"]);
                        booking.DepartDate = Convert.ToDateTime(row["DepartDate"]);
                        booking.ProofOfPayment = row["ProofOfPayment"].ToString();
                        booking.Status = row["Status"].ToString();
                        bookingHistory.Add(booking);
                    }
                }
            }
            return bookingHistory;
        }

        public bool CancelBooking(int bookingID)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
			    new SqlParameter("@BookingID", bookingID),
		    };

            return DBHelper.ExecuteNonQuery("sp_CancelBooking", CommandType.StoredProcedure, parameters);
        }

        public int GetBookingOwner(int bookingID)
        {
            int memberID = 0;

            SqlParameter[] parameters = new SqlParameter[]
		    {                
                new SqlParameter("@BookingID", bookingID)
		    };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetBookingOwner", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count >= 1)
                {
                    DataRow row = table.Rows[0];
                    memberID = Convert.ToInt32(row["MemberID"]);
                }
            }
            return memberID;
        }

    }
}
