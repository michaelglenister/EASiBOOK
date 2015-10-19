using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using DAL;
using BLL;

namespace Monkey_Business
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["registered"] == "1")
                lblSuccessfullRegistration.Visible = true;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string loginResult = "&nbsp;";
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            int memberID = 0;
            string redirectURL = "Default.aspx";

            if ((string)Session["LoginRedirect"] != null)
            {
                redirectURL = (string)Session["LoginRedirect"];
            }
            
            MemberHandler memberHandler = new MemberHandler();
            Member member = new Member();

            member = memberHandler.ValidateLogin(email, password);

            try
            {
                loginResult = member.MemberID.ToString() + "  " + member.Role.ToString();
                memberID = member.MemberID;
                Session["MemberID"] = memberID;
                Session["FirstName"] = member.FirstName;
                Session["Surname"] = member.Surname;
                Response.Redirect(redirectURL);
            }
            catch (NullReferenceException)
            {
                loginResult = "The username or password you entered is incorrect<br /><br />";
            }

            lblSuccessfullRegistration.Text = loginResult;
            lblSuccessfullRegistration.ForeColor = Color.Red;
            lblSuccessfullRegistration.Visible = true;
        }
    }
}