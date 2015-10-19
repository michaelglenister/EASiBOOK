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
    public partial class DeleteRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RoomHandler roomHandler = new RoomHandler();
            Room room = new Room();

            int roomID = Convert.ToInt32(Session["DeleteRoom"]);

            if (!Page.IsPostBack)
            {
                //get room data and populate data fields for editing
                room = roomHandler.GetRoomDetails(roomID);


                lblRoomNo.Text = room.RoomNo;
                lblDescription.Text = room.Description;
                lblRoomType.Text = room.TypeID.ToString();

                if (room.Picture != "" && room.Picture != null && room.Picture != " ")
                    litRoomPicture.Text = "<a href=\"" + room.Picture + "\"data-lightbox=\"image1\">" + room.Picture.Substring(room.Picture.LastIndexOf("\\") + 1) + "</a>";
                else
                    litRoomPicture.Text = "No picture";

            }
        }

        protected void btnDeleteRoom_Click(object sender, EventArgs e)
        {
            RoomHandler roomHandler = new RoomHandler();
            Room room = new Room();

            room.RoomID = Convert.ToInt32(Session["DeleteRoom"]);

            roomHandler.DisableRoom(room);

            //alert of success
            lblProgress.CssClass = "label label-success";
            lblProgress.Text = "Room edited successfully";

            //delay redirect to alert user of page change
            lblRedirect.Text = "Redirecting to room list in 5 seconds.";
            Response.Write("<script type=\"text/javascript\">setTimeout(function () { window.location.href = \"RoomList.aspx\"; }, 5000);</script>");
        }

        protected void btnRoomList_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomList.aspx");
        }
    }
}