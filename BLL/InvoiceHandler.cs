using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DAL;

namespace BLL
{
    public class InvoiceHandler
    {
        InvoiceDBAccess invoiceDB = null;

        public InvoiceHandler()
        {
            invoiceDB = new InvoiceDBAccess();
        }

        public double GetDepositAmount(int bookingID)
        {
            return invoiceDB.GetDepositAmount(bookingID);
        }

        public double GetTotalAmount(int bookingID)
        {
            return invoiceDB.GetTotalAmount(bookingID);
        }

        public Invoice GetInvoiceDetails(int invoiceID)
        {
            return invoiceDB.GetInvoiceDetails(invoiceID);
        }
    }
}
