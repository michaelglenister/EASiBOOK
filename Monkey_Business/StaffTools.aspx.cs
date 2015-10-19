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
    public partial class StaffTools : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int myRole = 2;
            bool loggedIn = false;

            if (Session["MemberID"] != null)
                loggedIn = true;

            if (loggedIn == false)
                Response.Redirect("Login.aspx");

            if (loggedIn == true)
            {
                MemberHandler memberHandler = new MemberHandler();
                myRole = memberHandler.GetRole((int)Session["MemberID"]);
                if (myRole > 2)
                {
                    litOwnerHeader.Visible = true;
                    btnListRooms.Visible = true;
                    btnListRoomTypes.Visible = true;
                    btnFindMember.Visible = true;
                    btnBusinessSettings.Visible = true;
                }
            }
        }

        protected void btnListRooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomList.aspx");
        }

        protected void btnProfileDetails_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProvisionalBookings.aspx");
        }

        protected void btnListRoomTypes_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewRoomTypes.aspx");
        }

        protected void btnFindMember_Click(object sender, EventArgs e)
        {
            Response.Redirect("FindMember.aspx");
        }

        protected void btnCheckIn_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckinList.aspx");
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("CheckoutList.aspx");
        }

        protected void btnViewOccupants_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewOccupants.aspx");
        }

        protected void btnBusinessSettings_Click(object sender, EventArgs e)
        {
            Response.Redirect("Settings.aspx");
        }
    }
}