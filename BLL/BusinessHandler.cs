using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using DAL;

namespace BLL
{
    public class BusinessHandler
    {
        BusinessDBAccess businessDB = null;

        public BusinessHandler()
        {
            businessDB = new BusinessDBAccess();
        }

        public Business GetBusinessDetails()
        {
            return businessDB.GetBusinessDetails();
        }

        public bool UpdateBusinessDetails(Business business)
        {
            return businessDB.UpdateBusinessDetails(business);
        }

    }
}
