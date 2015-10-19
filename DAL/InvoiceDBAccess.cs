using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class InvoiceDBAccess
    {
        public bool CreateInvoice(int bookingID, string rooms, string rates)
        {
            SqlParameter[] parameters = new SqlParameter[]
		    {                
                new SqlParameter("@BookingID", bookingID),
                new SqlParameter("@Rooms", rooms),
                new SqlParameter("@Rates", rates)
		    };

            return DBHelper.ExecuteNonQuery("sp_CreateInvoice", CommandType.StoredProcedure, parameters);
        }

        public double GetDepositAmount(int bookingID)
        {
            double depositAmount = 0;
            double totalAmount = 0;
            string rates = null;
            DateTime arriveDate = DateTime.Now;
            DateTime departDate = DateTime.Now;

            SqlParameter[] parameters = new SqlParameter[]
		    {                
                new SqlParameter("@BookingID", bookingID)
		    };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetDepositAmount", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count >= 1)
                {
                    DataRow row = table.Rows[0];
                    rates = row["Rates"].ToString();
                    arriveDate = Convert.ToDateTime(row["ArriveDate"]);
                    departDate = Convert.ToDateTime(row["DepartDate"]);
                }
            }
                       
            double noOfDays = (departDate - arriveDate).TotalDays;

            string[] seperateRates = rates.Split('#');
            int rateCount = seperateRates.Count();
            for (int i = 0; i < rateCount - 1; i++)
            {
                totalAmount += (Convert.ToDouble(seperateRates[i])) * noOfDays;
            }

            BusinessDBAccess businessDBAccess = new BusinessDBAccess();
            Business business = businessDBAccess.GetBusinessDetails();

            double depositPercent = business.DepositPercent;
            depositPercent = depositPercent / 100;

            depositAmount = totalAmount * depositPercent;

            return depositAmount;
        }

        public double GetTotalAmount(int bookingID)
        {
            double totalAmount = 0;
            string rates = null;
            DateTime arriveDate = DateTime.Now;
            DateTime departDate = DateTime.Now;

            SqlParameter[] parameters = new SqlParameter[]
		    {                
                new SqlParameter("@BookingID", bookingID)
		    };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetDepositAmount", CommandType.StoredProcedure, parameters))
            {
                if (table.Rows.Count >= 1)
                {
                    DataRow row = table.Rows[0];
                    rates = row["Rates"].ToString();
                    arriveDate = Convert.ToDateTime(row["ArriveDate"]);
                    departDate = Convert.ToDateTime(row["DepartDate"]);
                }
            }

            double noOfDays = (departDate - arriveDate).TotalDays;

            string[] seperateRates = rates.Split('#');
            int rateCount = seperateRates.Count();
            for (int i = 0; i < rateCount - 1; i++)
            {
                totalAmount += (Convert.ToDouble(seperateRates[i])) * noOfDays;
            }

            return totalAmount;
        }

        public Invoice GetInvoiceDetails(int invoiceID)
        {
            Invoice invoice = null;

            SqlParameter[] paramaters = new SqlParameter[]
            {
                new SqlParameter("@InvoiceID", invoiceID)
            };

            using (DataTable table = DBHelper.ExecuteParamerizedSelectCommand("sp_GetInvoiceDetails", CommandType.StoredProcedure, paramaters))
            {
                if (table.Rows.Count >= 1)
                {
                    DataRow row = table.Rows[0];
                    invoice = new Invoice();

                    invoice.BookingID = Convert.ToInt32(row["BookingID"]);
                    invoice.Rooms = row["Rooms"].ToString();
                    invoice.Rates = row["Rates"].ToString();
                }
            }
            return invoice;
        }

    }
}
