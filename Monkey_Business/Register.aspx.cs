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
    public partial class Register : System.Web.UI.Page
    {
        City_SuburbHandler city_SuburbHandler = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            city_SuburbHandler = new City_SuburbHandler();
            txtCity.Visible = false;
            txtSuburb.Visible = false;
            txtCity.Enabled = false;
            txtSuburb.Enabled = false;
            txtPostalCode.Enabled = false;
            rdoBack.Visible = false;

            if (IsPostBack == false)
            {
                BindData();
                cmbSuburb.Enabled = false;
                cmbCity.Items.Insert(0, "Select a city");
            }
        }

        private void BindData()
        {
            List<City_Suburb> cityList = city_SuburbHandler.GetCityList();

            cmbCity.DataTextField = "CityName";
            cmbCity.DataValueField = "CityID";
            cmbCity.DataSource = cityList;
            cmbCity.DataBind();

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string option = "";
            double num = 0;
            option = txtPhoneNo.Text.Trim();
            PhoneIsNumberValidator.Visible = false;


            string city = "";
            string suburb = "";

            if (rdoOtherCity.Checked == true)
            {
                city = txtCity.Text;
                suburb = txtSuburb.Text;
            }
            else
            {
                city = cmbCity.SelectedItem.Text;
                suburb = cmbSuburb.SelectedItem.Text;
            }

            Member member = new Member();

            member.Email = txtEmail.Text;
            member.Password = txtPassword.Text;
            member.FirstName = txtFirstName.Text;
            member.Surname = txtSurname.Text;
            member.AddressLine1 = txtAddressLine1.Text;
            member.AddressLine2 = txtAddressLine2.Text;
            member.Suburb = suburb;
            member.PostalCode = txtPostalCode.Text;
            member.City = city;
            member.PhoneNo = txtPhoneNo.Text;

            MemberHandler memberHandler = new MemberHandler();

            if (memberHandler.ValidateEmail(txtEmail.Text) == false && double.TryParse(option, out num) == true)
            {
                if (memberHandler.AddNewMember(member) == false)
                    Response.Redirect("Login.aspx?registered=1");
            }

            else if (memberHandler.ValidateEmail(txtEmail.Text) == true)
            {
                litInvalidEmail.Text = "<h3 style=\"color:red\">This E-Mail address is already in use</h3><br />";
                txtPassword.Attributes.Add("value", txtPassword.Text);
                txtConfirmPassword.Attributes.Add("value", txtConfirmPassword.Text);
                if (rdoOtherCity.Checked == false)
                {
                    RequiredCityValidator.Enabled = false;
                    RequiredSuburbValidator.Enabled = false;
                }
            }

            else if (double.TryParse(option, out num) == false)
            {
                litInvalidEmail.Text = "";
                txtPassword.Attributes.Add("value", txtPassword.Text);
                txtConfirmPassword.Attributes.Add("value", txtConfirmPassword.Text);
                PhoneIsNumberValidator.Visible = true;
                RequiredCityValidator.Enabled = false;
                RequiredSuburbValidator.Enabled = false;
            }
        }

        protected void cmbCity_SelectedIndexChanged(object sender, EventArgs e)
        {

            cmbSuburb.Enabled = true;
            txtPostalCode.Text = "";
            //txtCity.Attributes.Add("value", cmbCity.SelectedItem.ToString());
            if (IsPostBack == true)
            {
                txtPassword.Attributes.Add("value", txtPassword.Text);
                txtConfirmPassword.Attributes.Add("value", txtConfirmPassword.Text);
            }
            //If city combo box changed back to "select a city"
            if (cmbCity.SelectedIndex >= 1)
            {
                cmbSuburb.Visible = true;
                List<City_Suburb> suburbList = city_SuburbHandler.GetSuburbList(Convert.ToInt32(cmbCity.SelectedItem.Value));
                cmbSuburb.DataTextField = "SuburbName";
                cmbSuburb.DataValueField = "PostalCode";
                cmbSuburb.DataSource = suburbList;
                cmbSuburb.DataBind();
                cmbSuburb.Items.Insert(0, "Select a suburb");
            }

            //clear suburb combo box and postal code if city combo box changed to "select a city"
            else
            {
                cmbSuburb.SelectedIndex = 0;
                cmbSuburb.Enabled = false;
                txtPostalCode.Text = "";
            }

        }



        protected void cmbSuburb_TextChanged(object sender, EventArgs e)
        {


            //txtSuburb.Attributes.Add("value", cmbSuburb.SelectedItem.ToString());
            if (cmbSuburb.SelectedIndex >= 1)
            {
                txtPostalCode.Text = cmbSuburb.SelectedItem.Value.ToString();
            }
            else
            {
                txtPostalCode.Text = "";
            }
        }

        protected void rdoOtherCity_CheckedChanged(object sender, EventArgs e)
        {
            txtPassword.Attributes.Add("value", txtPassword.Text);
            txtConfirmPassword.Attributes.Add("value", txtConfirmPassword.Text);

            cmbCity.SelectedIndex = 0;
            try
            {
                cmbSuburb.SelectedIndex = 0;
            }
            catch (ArgumentOutOfRangeException)
            {
            }
            rdoBack.Visible = true;
            cmbCity.Enabled = false;
            cmbSuburb.Enabled = false;
            txtCity.Visible = true;
            txtCity.Enabled = true;
            txtSuburb.Visible = true;
            txtSuburb.Enabled = true;
            txtPostalCode.Text = "";
            //enable validation
            RequiredCityValidator.Enabled = true;
            RequiredSuburbValidator.Enabled = true;
            //txtCity.Attributes.Clear();
            //txtSuburb.Attributes.Clear();
            txtPostalCode.Enabled = true;
        }

        protected void rdoBack_CheckedChanged(object sender, EventArgs e)
        {
            txtPassword.Attributes.Add("value", txtPassword.Text);
            txtConfirmPassword.Attributes.Add("value", txtConfirmPassword.Text);

            txtCity.Text = "";
            txtSuburb.Text = "";
            cmbCity.Enabled = true;
            cmbSuburb.Enabled = true;
            txtCity.Visible = false;
            txtCity.Enabled = false;
            txtSuburb.Visible = false;
            txtSuburb.Enabled = false;
            txtPostalCode.Text = "";
            txtPostalCode.Enabled = false;
            rdoBack.Visible = false;
            rdoBack.Checked = false;
            cmbSuburb.Enabled = false;
            cmbCity.SelectedIndex = 0;
            //disable validation
            RequiredCityValidator.Enabled = false;
            RequiredSuburbValidator.Enabled = false;

        }
    }
}