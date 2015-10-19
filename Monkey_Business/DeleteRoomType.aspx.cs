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
    public partial class DeleteRoomType : System.Web.UI.Page
    {
        RoomTypeHandler roomTypeHandler = null;

        protected void Page_Load(object sender, EventArgs e)
        {

            int id = Convert.ToInt32(Session["EditRoomType"]);

            roomTypeHandler = new RoomTypeHandler();

            RoomType roomType = roomTypeHandler.GetRoomTypeDetails(id);
            lblRoomTypeID.Text = id.ToString();
            lblRoomTypeName.Text = roomType.Name.ToString();
            lblRoomTypeCapacity.Text = roomType.MaxCapacity.ToString();
            lblRatePerNight.Text = roomType.RatePerNight.ToString();

        }

        protected void btnDeleteRoomType_Click(object sender, EventArgs e)
        {
            RoomType roomType = new RoomType();
            roomType.TypeID = Convert.ToInt32(lblRoomTypeID.Text);
            roomTypeHandler.DeleteRoomType(roomType);

            lblProgress.Text = "Room type was deleted.";

            //delay redirect to alert user of page change
            lblRedirect.Text = "Redirecting to room type list in 5 seconds.";
            Response.Write("<script type=\"text/javascript\">setTimeout(function () { window.location.href = \"ViewRoomTypes.aspx\"; }, 5000);</script>");
        }

        protected void btnRoomTypeList_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewRoomTypes.aspx");
        }
    }
}