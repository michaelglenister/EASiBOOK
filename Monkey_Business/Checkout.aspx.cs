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
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int checkoutID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["id"], out checkoutID);

            if (checkoutID == 0)
                Response.Redirect("CheckoutList.aspx");

            if (IsPostBack)
            {
                litHeader.Text = "Booking number " + checkoutID.ToString() + " has been checked out";
                btnYes.Visible = false;
                btnNo.Visible = false;
                btnBack.Visible = true;
            }
            else
            {
                litHeader.Text = "You are about to check-out booking number " + checkoutID.ToString() + "<br /><br />Once you check this person out this process can't be undone, are you sure you want to continue?";
            }
        }

        protected void btnYes_Click(object sender, EventArgs e)
        {
            int checkoutID = 0;
            bool intTest = false;
            intTest = int.TryParse(Request.QueryString["id"], out checkoutID);

            if (checkoutID == 0)
                Response.Redirect("CheckoutList.aspx");

            BookingHandler bookingHandler = new BookingHandler();
            bookingHandler.Checkout(checkoutID);
        }

        protected void btnNo_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckoutList.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckoutList.aspx");
        }
    }
}