using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monkey_Business
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pathFile = Request.Url.AbsolutePath;
            pathFile = pathFile.Substring(pathFile.LastIndexOf('/'));
            switch (pathFile)
            {
                case "/Default.aspx": litHome.Text = "class=\"active\"";
                    break;
                case "/AboutUs.aspx": litAboutUs.Text = "class=\"active\"";
                    break;
                case "/Login.aspx": litLogin.Text = "class=\"active\"";
                    break;
                case "/Register.aspx": litRegister.Text = "class=\"active\"";
                    break;
                case "/Profile.aspx": litProfile.Text = "active";
                    break;
                case "/UpdateProfile.aspx": litProfile.Text = "active";
                    break;
                case "/ContactUs.aspx": litContactUs.Text = "class=\"active\"";
                    break;
                case "/Faq.aspx":  litFaq.Text = "class=\"active\"";
                    break;
            }


            bool loggedIn = false;
            if (Session["MemberID"] != null)
                loggedIn = true;

            if (loggedIn == true)
            {
                loginURL.Text = "Logout";
                loginURL.NavigateUrl = "Logout.aspx";
                profileURL.NavigateUrl = "Profile.aspx?id=" + Session["MemberID"];
                updateProfileURL.NavigateUrl = "UpdateProfile.aspx?id=" + Session["MemberID"];
            }
        }
    }
}