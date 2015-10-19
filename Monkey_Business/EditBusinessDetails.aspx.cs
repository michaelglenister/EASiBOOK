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
    public partial class EditBusinessDetails : System.Web.UI.Page
    {
        BusinessHandler businessHandler = new BusinessHandler();
        Business business = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblPercentageIsNumberValidator.Visible = false;

            business = businessHandler.GetBusinessDetails();
            if (IsPostBack == false)
            {
                txtName.Text = business.Name;
                txtPhone.Text = business.PhoneNo;
                txtEmail.Text = business.Email;
                txtServer.Text = business.EmailServer;
                txtPort.Text = Convert.ToString(business.EmailPort);
                hiddenPassword.Value = Convert.ToString(business.EmailPassword);
                txtAddressLine1.Text = business.AddressLine1;
                txtAddressLine2.Text = business.AddressLine2;
                txtPercentage.Text = Convert.ToString(business.DepositPercent);
                txtBankName.Text = Convert.ToString(business.BankName);
                txtAccountNo.Text = Convert.ToString(business.AccountNo);
                txtBranchCode.Text = Convert.ToString(business.BranchCode);
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            business = new Business();

            string option = "";
            int num = 0;
            option = txtPercentage.Text.Trim();

            if (int.TryParse(option, out num) == true)
            {
                lblPercentageIsNumberValidator.Visible = false;
                business.Name = txtName.Text;
                business.PhoneNo = txtPhone.Text;
                business.Email = txtEmail.Text;
                business.EmailServer = txtServer.Text;
                business.EmailPort = Convert.ToInt32(txtPort.Text);
                business.EmailPassword = hiddenPassword.Value;
                if (txtPassword.Text != "")
                {
                    business.EmailPassword = txtPassword.Text;
                }
                business.AddressLine1 = txtAddressLine1.Text;
                business.AddressLine2 = txtAddressLine2.Text;
                business.DepositPercent = Convert.ToInt32(txtPercentage.Text);
                business.BankName = txtBankName.Text;
                business.AccountNo = txtAccountNo.Text;
                business.BranchCode = txtBranchCode.Text;

                businessHandler.UpdateBusinessDetails(business);
                Response.Redirect("Settings.aspx");
            }
            else
            {
                lblPercentageIsNumberValidator.Visible = true;
            }
        }
    }
}