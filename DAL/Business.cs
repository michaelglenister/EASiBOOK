using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class Business
    {
        public int BusinessID { get; set; }
        public string Name { get; set; }
        public string PhoneNo { get; set; }
        public string Email { get; set; }
        public string EmailPassword { get; set; }
        public string EmailServer { get; set; }
        public int EmailPort { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public int DepositPercent { get; set; }
        public string BankName { get; set; }
        public string AccountNo { get; set; }
        public string BranchCode { get; set; }
    }
}
