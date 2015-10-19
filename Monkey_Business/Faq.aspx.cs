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
    public partial class Faq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessHandler businessHandler = new BusinessHandler();
            Business business = businessHandler.GetBusinessDetails();

            int depositPercent = business.DepositPercent;
            lblDeposit.Text = depositPercent.ToString();


            lblOwed.Text = (100 - depositPercent).ToString();
        }
    }
}