using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using BLL;
using DAL;

namespace Monkey_Business
{
    public partial class AddRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //populate typeID drop down list (dlTypeID) with every TypeID
                RoomHandler roomHandler = new RoomHandler();

                dlTypeID.DataSource = roomHandler.GetTypeList();
                dlTypeID.DataTextField = "Name";
                dlTypeID.DataValueField = "TypeID";
                dlTypeID.DataBind();
            }
        }

        public void btnAddRoom_Click(object sender, EventArgs e)
        {
            AvailabilityHandler availabilityHandler = new AvailabilityHandler();
            RoomHandler roomHandler = new RoomHandler();

            string picturePath = @"\RoomPictures\";

            //check if room exists
            if (roomHandler.ValidateRoomNo(txtRoomNo.Text) == false)
            {
                Room room = new Room();

                room.RoomNo = txtRoomNo.Text;
                room.Description = txtDescription.Text;
                room.TypeID = Convert.ToInt32(dlTypeID.SelectedValue);

                if (cbWifi.Checked)
                    room.WifiStatus = "Yes";
                else
                    room.WifiStatus = "No";

                if (cbAircon.Checked)
                    room.AirconStatus = "Yes";
                else
                    room.AirconStatus = "No";

                if (cbRoomservice.Checked)
                    room.RoomserviceStatus = "Yes";
                else
                    room.RoomserviceStatus = "No";

                if (cbTelevision.Checked)
                    room.TelevisionStatus = "Yes";
                else
                    room.TelevisionStatus = "No";

                //check if picture is selected
                if (fileUploadControl.HasFile)
                {
                    try
                    {
                        //only accept .png and .jpg image files
                        if (fileUploadControl.PostedFile.ContentType == "image/jpeg" || fileUploadControl.PostedFile.ContentType == "image/png")
                        {
                            //check file is within maximum size limit
                            if (fileUploadControl.PostedFile.ContentLength < 3072000)
                            {
                                //get file name from the upload control
                                string filename = Path.GetFileName(fileUploadControl.FileName);

                                //get the extension name of the file
                                string extension = filename.Substring(filename.LastIndexOf("."));

                                //remove the extension from the file name
                                filename = filename.Substring(0, filename.LastIndexOf("."));

                                //append room number to the end of the file name
                                filename += "_" + room.RoomNo;

                                //combine path, file name and extension. phew
                                picturePath += filename + extension;

                                //all checks successfull, upload image and run SQL command
                                fileUploadControl.SaveAs(Server.MapPath(@"~" + picturePath));

                                room.Picture = picturePath;

                                int lastRoomID = 0;
                                DateTime currentYear = DateTime.Now;

                                lastRoomID = roomHandler.GetLastRoomID();

                                if (roomHandler.AddNewRoom(room) == false)
                                {
                                    //populate availability table
                                    availabilityHandler.AddAvailabilityRecord(lastRoomID, currentYear.Year);
                                    availabilityHandler.AddAvailabilityRecord(lastRoomID, (currentYear.Year + 1));

                                    //alert of success
                                    lblProgress.CssClass = "label label-success";
                                    lblProgress.Text = "Room added successfully";

                                    //delay redirect to alert user of page change
                                    lblRedirect.Text = "Redirecting to room list in 5 seconds.";
                                    Response.Write("<script type=\"text/javascript\">setTimeout(function () { window.location.href = \"RoomList.aspx\"; }, 5000);</script>");
                                }
                            }
                            else
                                lblProgress.Text = "The picture has to be less than 3 megabytes!";

                        }
                        else
                            lblProgress.Text = "Only JPEG or PNG files are accepted!";

                    }
                    catch (Exception)
                    {
                        lblProgress.Text = "The picture failed to upload";
                    }

                }

                //no picture is selected
                else
                {
                    room.Picture = "";

                    //run SQL insert
                    if (roomHandler.AddNewRoom(room) == false)
                    {
                        //populate availability table
                        int lastRoomID = 0;
                        DateTime currentYear = DateTime.Now;

                        lastRoomID = roomHandler.GetLastRoomID();
                        availabilityHandler.AddAvailabilityRecord(lastRoomID, currentYear.Year);
                        availabilityHandler.AddAvailabilityRecord(lastRoomID, (currentYear.Year + 1));

                        //alert of success
                        lblProgress.CssClass = "label label-success";
                        lblProgress.Text = "Room added successfully";

                        //delay redirect to alert user of page change
                        lblRedirect.Text = "Redirecting to room list in 5 seconds.";
                        Response.Write("<script type=\"text/javascript\">setTimeout(function () { window.location.href = \"RoomList.aspx\"; }, 5000);</script>");
                    }
                }
            }
            else
                lblProgress.Text = "This room number already exists!";
        }

        protected void btnListRooms_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomList.aspx");
        }
    }
}