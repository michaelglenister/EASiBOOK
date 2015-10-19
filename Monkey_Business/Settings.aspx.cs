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
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BusinessHandler businessHandler = new BusinessHandler();
            Business business = new Business();
            business = businessHandler.GetBusinessDetails();

            lblName.Text = business.Name;
            lblPhoneNo.Text = business.PhoneNo;
            lblEmail.Text = business.Email;
            lblServer.Text = business.EmailServer;
            lblPort.Text = Convert.ToString(business.EmailPort);
            lblAddressLine1.Text = business.AddressLine1;
            lblAddressLine2.Text = business.AddressLine2;
            lblPercentage.Text = Convert.ToString(business.DepositPercent);
            lblBankName.Text = business.BankName;
            lblAccountNo.Text = business.AccountNo;
            lblBranchCode.Text = business.BranchCode;

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditBusinessDetails.aspx");
        }
    }
}