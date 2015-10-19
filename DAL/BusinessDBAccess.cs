using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class BusinessDBAccess
    {
        public Business GetBusinessDetails()
        {
            Business business = null;

            using (DataTable table = DBHelper.ExecuteSelectCommand("sp_GetBusinessDetails", CommandType.StoredProcedure))
            {
                if (table.Rows.Count >= 1)
                {
                    DataRow row = table.Rows[0];
                    business = new Business();

                    business.BusinessID = Convert.ToInt32(row["BusinessID"]);
                    business.Name = row["Name"].ToString();
                    business.PhoneNo = row["PhoneNo"].ToString();
                    business.Email = row["Email"].ToString();
                    business.EmailPassword = row["EmailPassword"].ToString();
                    business.EmailServer = row["EmailServer"].ToString();
                    business.EmailPort = Convert.ToInt32(row["EmailPort"]);
                    business.AddressLine1 = row["AddressLine1"].ToString();
                    business.AddressLine2 = row["AddressLine2"].ToString();
                    business.DepositPercent = Convert.ToInt32(row["DepositPercent"]);
                    business.BankName = row["BankName"].ToString();
                    business.AccountNo = row["BankAccountNo"].ToString();
                    business.BranchCode = row["BranchCode"].ToString();
                }
            }
            return business;
        }

        public bool UpdateBusinessDetails(Business business)
        {
            SqlParameter[] parameters = new SqlParameter[]
            {
                new SqlParameter("@Name", business.Name),
                new SqlParameter("@PhoneNo", business.PhoneNo),
                new SqlParameter("@Email", business.Email),
                new SqlParameter("@Server", business.EmailServer),
                new SqlParameter("@Port", business.EmailPort),
                new SqlParameter("@EmailPassword", business.EmailPassword), 
                new SqlParameter("@Address1", business.AddressLine1),
                new SqlParameter("@Address2", business.AddressLine2),
                new SqlParameter("@Percentage", business.DepositPercent),
                new SqlParameter("@BankName", business.BankName),
                new SqlParameter("@AccountNo", business.AccountNo),
                new SqlParameter("@BranchCode", business.BranchCode)
            };

            return DBHelper.ExecuteNonQuery("sp_UpdateBusinessDetails", CommandType.StoredProcedure, parameters);
        }
    }
}
