using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Monkey_Business
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["MemberID"] = null;
            Session["FirstName"] = null;
            Session["Surname"] = null;
            Response.Redirect("Default.aspx?logout=1");
        }
    }
}