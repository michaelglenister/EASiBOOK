using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monkey_Business
{
    public partial class CheckLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool loggedIn = false;
            if (Session["MemberID"] != null)
                loggedIn = true;

            if (loggedIn == false)
                loggedIn = false;

            if (loggedIn == true)
                Response.Redirect("MakeBooking.aspx");
        }
    }
}