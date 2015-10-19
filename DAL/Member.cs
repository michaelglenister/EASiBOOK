using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class Member
    {
        public int MemberID { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string Surname { get; set; }
        public string AddressLine1 { get; set; }
        public string AddressLine2 { get; set; }
        public string Suburb { get; set; }
        public string PostalCode { get; set; }
        public string City { get; set; }
        public string PhoneNo { get; set; }
        public int Role { get; set; }

        public string Name { get; set; }
    }
}
