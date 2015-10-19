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
    public partial class RoomDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int roomID;

            RoomHandler roomHandler = new RoomHandler();
            Room room = new Room();

            roomID = int.Parse(Request.QueryString["id"]);

            room = roomHandler.GetRoomDetails(roomID);

            if (room.WifiStatus == null || room.WifiStatus == "")
                room.WifiStatus = "No";
            if (room.AirconStatus == null || room.AirconStatus == "")
                room.AirconStatus = "No";
            if (room.RoomserviceStatus == null || room.RoomserviceStatus == "")
                room.RoomserviceStatus = "No";
            if (room.TelevisionStatus == null || room.TelevisionStatus == "")
                room.TelevisionStatus = "No";

            lblRoomNo.Text = room.RoomNo;

            lblWifi.Text = room.WifiStatus;
            lblAircon.Text = room.AirconStatus;
            lblRoomservice.Text = room.RoomserviceStatus;
            lblTelevision.Text = room.TelevisionStatus;
        }
    }
}