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
    public partial class EditRoom : System.Web.UI.Page
    {
        //storage for current picture name
        static string picName;
        //store orinal room number to compare to changed room number
        static string originalRoomNo;

        protected void Page_Load(object sender, EventArgs e)
        {
            RoomHandler roomHandler = new RoomHandler();
            Room room = new Room();
            int roomID = Convert.ToInt32(Session["EditRoom"]);

            if (!Page.IsPostBack)
            {
                
                //populate typeID drop down list (dlTypeID) with every TypeID

                dlRoomType.DataSource = roomHandler.GetTypeList();
                dlRoomType.DataTextField = "Name";
                dlRoomType.DataValueField = "TypeID";
                dlRoomType.DataBind();

                //get room data and populate data fields for editing
                room = roomHandler.GetRoomDetails(roomID);

                lblRoomNo.Text = "Current picture for room " + room.RoomNo + ": ";
                txtRoomNo.Text = room.RoomNo;
                txtDescription.Text = room.Description;
                dlRoomType.SelectedValue = room.TypeID.ToString();

                if (room.WifiStatus == "Yes")
                    cbWifi.Checked = true;
                if (room.AirconStatus == "Yes")
                    cbAircon.Checked = true;
                if (room.RoomserviceStatus == "Yes")
                    cbRoomservice.Checked = true;
                if (room.TelevisionStatus == "Yes")
                    cbTelevision.Checked = true;

                dlStatus.SelectedValue = room.Status;

                if (room.Picture != "" && room.Picture != null && room.Picture != " ")
                    litRoomPicture.Text = "<a href=\"" + "." + room.Picture.Replace('\\', '/') + "\" data-lightbox=\"image\">View Picture</a>";
                else
                    litRoomPicture.Text = "No picture";

                picName = room.Picture;
                originalRoomNo = room.RoomNo;
            }
        }

        public void btnSave_Click(object sender, EventArgs e)
        {
            string picturePath = @"\RoomPictures\";
            int roomID = Convert.ToInt32(Session["EditRoom"]);

            RoomHandler roomHandler = new RoomHandler();

            //check if room exists or if the user changed room number
            if (roomHandler.ValidateRoomNo(txtRoomNo.Text) == false || originalRoomNo == txtRoomNo.Text.Trim())
            {
                Room room = new Room();

                room.RoomID = roomID;
                room.RoomNo = txtRoomNo.Text;
                room.Description = txtDescription.Text;
                room.TypeID = Convert.ToInt32(dlRoomType.SelectedValue);

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

                room.Status = dlStatus.SelectedValue;

                if (rdoKeepPic.Checked)
                {
                    //keep picture
                    room.Picture = picName;
                    roomHandler.UpdateRoom(room);

                    lblProgress.CssClass = "label label-success";
                    lblProgress.Text = "Room edited successfully";

                    //delay redirect to alert user of page change
                    lblRedirect.Text = "Redirecting to room list in 5 seconds.";
                    Response.Write("<script type=\"text/javascript\">setTimeout(function () { window.location.href = \"RoomList.aspx\"; }, 5000);</script>");
                }
                else if (rdoUploadPic.Checked)
                {
                    //upload picture
                    if (fileUploadControl.HasFile)
                    {
                        try
                        {
                            //only accept .png and .jpg image files
                            if (fileUploadControl.PostedFile.ContentType == "image/jpeg" || fileUploadControl.PostedFile.ContentType == "image/png")
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

                                if (roomHandler.UpdateRoom(room) == false)
                                {
                                    //alert of success and redirect
                                    lblProgress.CssClass = "label label-success";
                                    lblProgress.Text = "Room edited successfully";

                                    //delay redirect to alert user of page change
                                    lblRedirect.Text = "Redirecting to room list in 5 seconds.";
                                    Response.Write("<script type=\"text/javascript\">setTimeout(function () { window.location.href = \"RoomList.aspx\"; }, 5000);</script>");
                                }
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
                        lblProgress.CssClass = "label label-warning";
                        lblProgress.Text = "You selected to upload a new picture but failed to select one to upload<br />Use the browse button to choose a picture";
                    }
                }

                else if (rdoRemovePic.Checked)
                {
                    //remove picture
                    room.Picture = "";
                    roomHandler.UpdateRoom(room);

                    lblProgress.CssClass = "label label-success";
                    lblProgress.Text = "Room edited successfully";

                    //delay redirect to alert user of page change
                    lblRedirect.Text = "Redirecting to room list in 5 seconds.";
                    Response.Write("<script type=\"text/javascript\">setTimeout(function () { window.location.href = \"RoomList.aspx\"; }, 5000);</script>");
                }
            }
            else
                lblProgress.Text = "This room number already exists!";
        }

        protected void btnRoomList_Click(object sender, EventArgs e)
        {
            Response.Redirect("RoomList.aspx");
        }

        protected void rdoKeepPic_CheckedChanged(object sender, EventArgs e)
        {
            fileUploadControl.Visible = false;
        }

        protected void rdoUploadPic_CheckedChanged(object sender, EventArgs e)
        {
            fileUploadControl.Visible = true;
        }

        protected void rdoRemovePic_CheckedChanged(object sender, EventArgs e)
        {
            fileUploadControl.Visible = false;
        }
    }
}