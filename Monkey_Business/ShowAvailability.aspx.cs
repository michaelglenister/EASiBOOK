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
    public partial class ShowAvailability : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Populate room type drop down list
            if (!IsPostBack)
            {
                RoomTypeHandler roomTypeHandler = new RoomTypeHandler();
                List<RoomType> listRoomTypes = roomTypeHandler.GetRoomTypeList();
                ddlRoomType.DataSource = listRoomTypes;
                ddlRoomType.DataValueField = "TypeID";
                ddlRoomType.DataTextField = "Name";
                ddlRoomType.DataBind();
                ddlRoomType.Items.Insert(0, new ListItem("Select Room Type", "NA"));
            }


            DateTime startDate = new DateTime();
            DateTime endDate = new DateTime();
            try
            {
                startDate = (DateTime)Session["StartDate"];
                endDate = (DateTime)Session["EndDate"];
            }
            catch (NullReferenceException)
            {
                Response.Redirect("Availability.aspx");
            }

            litHeader.Text = "<h3>Rooms available between " + startDate.Year + "-" + startDate.Month + "-" + startDate.Day + " and " + endDate.Year + "-" + endDate.Month + "-" + endDate.Day + "</h3>";

            int roomID = 0;
            string htmlOutput = "";
            string picture = "";
            AvailabilityHandler availabilityHandler = new AvailabilityHandler();
            List<RoomAndType> listRoomAvailability = availabilityHandler.GetListOfAllRooms();

            //Check to make sure there is rooms in the system
            if (listRoomAvailability == null)
                litHeader.Text = "<h3>There are currently no rooms added to the system</h3>";
            else
            {
                for (int i = 0; i < listRoomAvailability.Count; i++)
                {
                    roomID = listRoomAvailability[i].RoomID;
                    if (listRoomAvailability[i].Picture != null && listRoomAvailability[i].Picture != "")
                        picture = "<a href=\"" + "." + listRoomAvailability[i].Picture.Replace('\\', '/') + "\" data-lightbox=\"image" + i.ToString() + "\">View Picture</a>";
                    else
                        picture = "No Picture Available";
                    if (availabilityHandler.CheckAvailability(roomID, startDate, endDate) == true)
                        htmlOutput += "<tr><td>" + listRoomAvailability[i].RoomNo.ToString() + "</td><td>" + listRoomAvailability[i].Name + "</td><td>" + picture + "</td><td>" + listRoomAvailability[i].MaxCapacity.ToString() + "</td><td>R " + listRoomAvailability[i].Rate.ToString() + "</td><td><input type=\"button\" value=\"View\" onclick=\"window.open('RoomDetails.aspx?id=" + listRoomAvailability[i].RoomID + "', 'name', 'height=270,width=270')\" /></td><td><input type=\"checkbox\" onclick=\"AddRoomToBooking(" + listRoomAvailability[i].RoomID + ")\" />" + "</td></tr>\n";
                }
                litAvailableRooms.Text = htmlOutput;
            }
        }

        protected void ddlRoomType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlRoomType.SelectedValue != "NA")
            {
                ddlRoomType.Items[0].Text = "Show All Rooms";
                //This selected index changed event will load rooms selected only from a specific room type
                DateTime startDate = new DateTime();
                DateTime endDate = new DateTime();
                try
                {
                    startDate = (DateTime)Session["StartDate"];
                    endDate = (DateTime)Session["EndDate"];
                }
                catch (NullReferenceException)
                {
                    Response.Redirect("Availability.aspx");
                }

                litHeader.Text = "<h3>Rooms available between " + startDate.Year + "-" + startDate.Month + "-" + startDate.Day + " and " + endDate.Year + "-" + endDate.Month + "-" + endDate.Day + "</h3>";

                int roomID = 0;
                string htmlOutput = "";
                string picture = "";
                int typeID;
                typeID = Convert.ToInt32(ddlRoomType.SelectedValue);
                AvailabilityHandler availabilityHandler = new AvailabilityHandler();
                List<RoomAndType> listRoomAvailability = availabilityHandler.GetListOfSpecificRooms(typeID);

                //Check to make sure there is rooms in the system
                if (listRoomAvailability == null)
                    litHeader.Text = "<h3 style=\"color:red\">There are currently no rooms available in the category you selected</h3>";
                else
                {
                    for (int i = 0; i < listRoomAvailability.Count; i++)
                    {
                        roomID = listRoomAvailability[i].RoomID;
                        if (listRoomAvailability[i].Picture != null && listRoomAvailability[i].Picture != "")
                            picture = "<a href=\"" + "." + listRoomAvailability[i].Picture.Replace('\\', '/') + "\" data-lightbox=\"image" + i.ToString() + "\">View Picture</a>";
                        else
                            picture = "No Picture Available";
                        if (availabilityHandler.CheckAvailability(roomID, startDate, endDate) == true)
                            htmlOutput += "<tr><td>" + listRoomAvailability[i].RoomNo.ToString() + "</td><td>" + listRoomAvailability[i].Name + "</td><td>" + picture + "</td><td>" + listRoomAvailability[i].MaxCapacity.ToString() + "</td><td>R " + listRoomAvailability[i].Rate.ToString() + "</td><td><input type=\"button\" value=\"View\" onclick=\"window.open('RoomDetails.aspx?id=" + listRoomAvailability[i].RoomID + "', 'name', 'height=270,width=270')\" /></td><td><input type=\"checkbox\" onclick=\"AddRoomToBooking(" + listRoomAvailability[i].RoomID + ")\" />" + "</td></tr>\n";
                    }
                    litAvailableRooms.Text = htmlOutput;
                }
            }//End of if statement
        }

        protected void btnBookRooms_Click(object sender, EventArgs e)
        {
            Session["SelectedRooms"] = bookedRooms.Value;
            Session["LoginRedirect"] = "MakeBooking.aspx";
            if (bookedRooms.Value == "" || bookedRooms.Value == null)
            {
                litError.Text = "<h3 style=\"color:red\">You need to select atleast 1 room before you can continue with the booking process</h3><br />";
            }
            else
                Response.Redirect("CheckLogin.aspx");
        }
        
    }
}