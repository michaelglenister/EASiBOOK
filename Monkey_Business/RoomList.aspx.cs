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
    public partial class RoomList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateTableEnabledRooms();
            }
        }

        protected void btnEditRoom_Click(object sender, EventArgs e)
        {
            //set session variable using room number from the hidden field
            Session["EditRoom"] = selectedRooms.Value;

            //check that a room is selected
            if (selectedRooms.Value == "" || selectedRooms.Value == null)
            {
                litError.Text = "<h3 style=\"color:red\">You need to select a room to edit</h3><br />";
            }
            else
                Response.Redirect("EditRoom.aspx");
        }

        protected void btnDeleteRoom_Click(object sender, EventArgs e)
        {
            Session["DeleteRoom"] = selectedRooms.Value;
            
            if (selectedRooms.Value == "" || selectedRooms.Value == null)
                litError.Text = "<h3 style=\"color:red\">You need to select a room to delete</h3><br />";
            else
                Response.Redirect("DeleteRoom.aspx"); 
        }

        protected void rdoShowEnabled_CheckedChanged(object sender, EventArgs e)
        {
            //enable delete button
            btnDeleteRoom.Enabled = true;
            populateTableEnabledRooms();
        }

        protected void rdoShowDisabled_CheckedChanged(object sender, EventArgs e)
        {
            //disable delete button
            btnDeleteRoom.Enabled = false;
            populateTableDisabledRooms();
        }

        //methods

        protected void populateTableEnabledRooms()
        {
            //generate a table to list all rooms
            RoomHandler roomHandler = new RoomHandler();

            int roomID = 0;
            string htmlOutput = "";

            List<Room> listRooms = roomHandler.GetRoomList();

            //Check to make sure there is rooms in the system
            if (listRooms == null)
                litHeader.Text = "<h3>There are currently no rooms enabled on the system</h3>";
            else
            {
                //add rooms to table as it is generated
                for (int i = 0; i < listRooms.Count; i++)
                {
                    roomID = listRooms[i].RoomID;
                    if (listRooms[i].Picture == "" || listRooms[i].Picture == null || listRooms[i].Picture == " ")
                    {
                        htmlOutput += "<tr><td>" + listRooms[i].RoomNo + "</td><td>" + listRooms[i].Description + "</td><td>No picture</td><td>" + listRooms[i].Name + "</td><td>" + listRooms[i].MaxCapacity + "</td><td><input type=\"button\" value=\"View\" onclick=\"window.open('RoomDetails.aspx?id=" + listRooms[i].RoomID + "', 'name', 'height=270,width=270')\" /></td><td><input type=\"radio\" name=\"room\" onclick=\"EditRoom(" + listRooms[i].RoomID + ")\" />" + "</td></tr>\n";
                    }
                    else
                    {
                        htmlOutput += "<tr><td>" + listRooms[i].RoomNo + "</td><td>" + listRooms[i].Description + "</td><td><a href=\"" + "." + listRooms[i].Picture.Replace('\\', '/') + "\"data-lightbox=\"image" + i.ToString() + "\">View Picture</a></td><td>" + listRooms[i].Name + "</td><td>" + listRooms[i].MaxCapacity + "</td><td><input type=\"button\" value=\"View\" onclick=\"window.open('RoomDetails.aspx?id=" + listRooms[i].RoomID + "', 'name', 'height=270,width=270')\" /></td><td><input type=\"radio\" name=\"room\" onclick=\"EditRoom(" + listRooms[i].RoomID + ")\" />" + "</td></tr>\n";
                    }
                }
                litRoomList.Text = htmlOutput;
            }
        }

        protected void populateTableDisabledRooms()
        {
            //generate and populate table of rooms
            RoomHandler roomHandler = new RoomHandler();

            int roomID = 0;
            string htmlOutput = "";

            List<Room> listRooms = roomHandler.GetDisabledRoomList();

            //Check to make sure there is rooms in the system
            if (listRooms == null)
                litHeader.Text = "<h3>There are currently no deleted rooms in the system</h3>";
            else
            {
                //add rooms to table as it is generated
                for (int i = 0; i < listRooms.Count; i++)
                {
                    roomID = listRooms[i].RoomID;

                    if (listRooms[i].Picture == "" || listRooms[i].Picture == null || listRooms[i].Picture == " ")
                    {
                        htmlOutput += "<tr><td>" + listRooms[i].RoomNo + "</td><td>" + listRooms[i].Description + "</td><td>No picture</td><td>" + listRooms[i].Name + "</td><td>" + listRooms[i].MaxCapacity + "</td><td><input type=\"button\" value=\"View\" onclick=\"window.open('RoomDetails.aspx?id=" + listRooms[i].RoomID + "', 'name', 'height=270,width=270')\" /></td><td><input type=\"radio\" name=\"room\" onclick=\"EditRoom(" + listRooms[i].RoomID + ")\" />" + "</td></tr>\n";
                    }
                    else
                    {
                        htmlOutput += "<tr><td>" + listRooms[i].RoomNo + "</td><td>" + listRooms[i].Description + "</td><td><a href=\"" + "." + listRooms[i].Picture.Replace('\\', '/') + "\"data-lightbox=\"image" + i.ToString() + "\">View Picture</a></td><td>" + listRooms[i].Name + "</td><td>" + listRooms[i].MaxCapacity + "</td><td><input type=\"button\" value=\"View\" onclick=\"window.open('RoomDetails.aspx?id=" + listRooms[i].RoomID + "', 'name', 'height=270,width=270')\" /></td><td><input type=\"radio\" name=\"room\" onclick=\"EditRoom(" + listRooms[i].RoomID + ")\" />" + "</td></tr>\n";
                    }
                }
                litRoomList.Text = htmlOutput;
            }
        }

        protected void btnAddRoom_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddRoom.aspx");
        }
    }
}