using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using DAL;

namespace Monkey_Business
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int myRole = 1;
            bool loggedIn = false;
            int memberID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["id"], out memberID);

            if (memberID == 0)
                Response.Redirect("Default.aspx");
            if (Session["MemberID"] != null)
                loggedIn = true;
            if (loggedIn == false)
                Response.Redirect("Login.aspx");

            MemberHandler memberHandler = new MemberHandler();
            Member member = new Member();
            member = memberHandler.GetMemberDetails(memberID);

            //Begin check to see if this is a members own profile or if owner is viewing it
            myRole = memberHandler.GetRole((int)Session["MemberID"]);
            if (myRole != 3 && (int)Session["MemberID"] != memberID)
            {
                Response.Redirect("Default.aspx");
            }
            //End check

            if (myRole >= 3 && memberID != (int)Session["MemberID"])
                ddlRole.Enabled = true;

            if (!IsPostBack)
            {
                try
                {
                    txtEmail.Text = member.Email;
                    txtFirstName.Text = member.FirstName;
                    txtSurname.Text = member.Surname;
                    txtAddressLine1.Text = member.AddressLine1;
                    txtAddressLine2.Text = member.AddressLine2;
                    txtSuburb.Text = member.Suburb;
                    txtPostalCode.Text = member.PostalCode;
                    txtCity.Text = member.City;
                    txtPhoneNo.Text = member.PhoneNo;
                    if (member.Role == 1)
                        ddlRole.SelectedIndex = 0;
                    else if (member.Role == 2)
                        ddlRole.SelectedIndex = 1;
                    else if (member.Role == 3)
                        ddlRole.SelectedIndex = 2;
                }
                catch (NullReferenceException)
                {
                    Response.Redirect("Default.aspx");
                }
                
            }
        }

        protected void btnUpdateProfile_Click(object sender, EventArgs e)
        {
            int memberID = 0;
            try
            {
                memberID = Convert.ToInt32(Request.QueryString["id"]);
            }
            catch (NullReferenceException)
            {

            }
            MemberHandler memberHandler = new MemberHandler();
            Member member = new Member();
            member = memberHandler.GetMemberDetails(memberID);

            member.MemberID = memberID;
            member.FirstName = txtFirstName.Text;
            member.Surname = txtSurname.Text;
            member.AddressLine1 = txtAddressLine1.Text;
            member.AddressLine2 = txtAddressLine2.Text;
            member.Suburb = txtSuburb.Text;
            member.PostalCode = txtPostalCode.Text;
            member.City = txtCity.Text;
            member.PhoneNo = txtPhoneNo.Text;
            member.Email = txtEmail.Text;
            member.Password = txtPassword.Text;
            member.Role = Convert.ToInt32(ddlRole.SelectedValue);

            if (txtPassword.Text == "")
                memberHandler.UpdateMember(member);
            else if (txtPassword.Text != "")
                memberHandler.UpdateMemberWithPassword(member);


            Response.Redirect("Profile.aspx?id=" + memberID.ToString());
        }
    }
}