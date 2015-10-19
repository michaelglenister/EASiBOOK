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
    public partial class ProofUploader : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //get dynamic page info
            BusinessHandler businessHandler = new BusinessHandler();
            Business business = new Business();

            business = businessHandler.GetBusinessDetails();
            lblBusinessEmail.Text = business.Email;
            lblDepositPercent.Text = business.DepositPercent.ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            BookingHandler bookingHandler = new BookingHandler();
            Booking booking = new Booking();

            int bookingID = 0;
            string picturePath = @"\ProofOfPayment\";

            try
            {
                //bookingID = Convert.ToInt32(Request.QueryString["id"]);
                bookingID = 1;
            }
            catch (NullReferenceException)
            {
                Response.Redirect("Default.aspx");
            }

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

                            //give file a unique name using bookingID
                            filename = "booking_" + bookingID.ToString();

                            //combine path, file name and extension. phew
                            picturePath += filename + extension;

                            //all checks successfull, upload image and run SQL command
                            fileUploadControl.SaveAs(Server.MapPath(@"~" + picturePath));

                            booking.BookingID = bookingID;
                            booking.ProofOfPayment = picturePath;

                            if (bookingHandler.UpdateProofOfPayment(booking) == false)
                            {

                                //alert of success
                                lblProgress.CssClass = "label label-success";
                                lblProgress.Text = "Room added successfully";

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
        }
    }
}