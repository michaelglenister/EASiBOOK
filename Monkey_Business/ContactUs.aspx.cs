using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using DAL;
using BLL;

namespace Monkey_Business
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessHandler businessHandler = new BusinessHandler();
            Business business = new Business();

            business = businessHandler.GetBusinessDetails();

            lblPhone.Text = business.PhoneNo;
            lblEmail.Text = business.Email;
            lblAddress1.Text = business.AddressLine1;
            lblAddress2.Text = business.AddressLine2;
        }
    }
}