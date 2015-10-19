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
    public partial class EditRoomType1 : System.Web.UI.Page
    {
        RoomTypeHandler roomTypeHandler = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblRoomTypeRateIsNumberValidator.Visible = false;
            int ID = Convert.ToInt32(Session["EditRoomType"]);
            if (IsPostBack == false)
            {


                roomTypeHandler = new RoomTypeHandler();

                RoomType roomType = roomTypeHandler.GetRoomTypeDetails(ID);
                lblTypeID.Text = ID.ToString();
                txtName.Text = roomType.Name.ToString();
                txtRoomTypeCapacity.Text = roomType.MaxCapacity.ToString();
                txtRate.Text = roomType.RatePerNight.ToString();
            }
        }

        protected void btnMinusOne_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtRoomTypeCapacity.Text) != 1)
            {
                int value = Convert.ToInt32(txtRoomTypeCapacity.Text) - 1;
                txtRoomTypeCapacity.Text = value.ToString();
            }
        }

        protected void btnPlusOne_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtRoomTypeCapacity.Text) < 20)
            {
                int value = Convert.ToInt32(txtRoomTypeCapacity.Text) + 1;
                txtRoomTypeCapacity.Text = value.ToString();
            }
        }

        protected void btnAddRoomType_Click(object sender, EventArgs e)
        {
            roomTypeHandler = new RoomTypeHandler();

            string option = "";
            double num = 0;
            option = txtRate.Text.Trim();

            if (double.TryParse(option, out num) == true)
            {
                RoomType roomType = new RoomType();
                roomType.TypeID = Convert.ToInt32(lblTypeID.Text.Trim());
                roomType.Name = txtName.Text;
                roomType.MaxCapacity = Convert.ToInt32(txtRoomTypeCapacity.Text.Trim());
                roomType.RatePerNight = Convert.ToDouble(txtRate.Text.Trim());

                roomTypeHandler.UpdateRoomType(roomType);

                lblProgress.Text = "Room edited successfully.";

                //delay redirect to alert user of page change
                lblRedirect.Text = "Redirecting to room type list in 5 seconds.";
                Response.Write("<script type=\"text/javascript\">setTimeout(function () { window.location.href = \"ViewRoomTypes.aspx\"; }, 5000);</script>");
            }

            else if (double.TryParse(option, out num) == false)
            {
                lblRoomTypeRateIsNumberValidator.Visible = true;
            }

            else if (txtRate.Text == null)
            {
                lblRoomTypeRateIsNumberValidator.Visible = false;
            }

        }

        protected void btnRoomTypeList_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewRoomTypes.aspx");
        }
    }
}