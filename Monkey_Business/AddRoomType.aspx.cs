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
    public partial class AddRoomType : System.Web.UI.Page
    {
        RoomTypeHandler handler = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblRoomTypeRateIsNumberValidator.Visible = false;
        }

        protected void btnAddRoomType_Click(object sender, EventArgs e)
        {
            handler = new RoomTypeHandler();
            int rateId = 0;
            string option = "";
            double num = 0;
            option = txtRatePerNight.Text;

            if (double.TryParse(option, out num) == true && handler.ValidateRoomTypeName(txtRoomTypeName.Text) == false && double.TryParse(option, out num) == true)
            {
                RoomType roomType = new RoomType();
                roomType.Name = txtRoomTypeName.Text;
                roomType.MaxCapacity = int.Parse(txtRoomTypeCapacity.Text);
                roomType.RatePerNight = Convert.ToDouble(txtRatePerNight.Text);

                handler.AddNewRoomType(roomType);
                rateId = handler.GetLastRoomTypeID();
                handler.AddNewRate(Convert.ToDouble(txtRatePerNight.Text), rateId);
                Response.Redirect("ViewRoomTypes.aspx");
            }

            if (handler.ValidateRoomTypeName(txtRoomTypeName.Text) == false)
            {
                DuplicateNameValidator.Visible = false;
            }

            if (handler.ValidateRoomTypeName(txtRoomTypeName.Text) == true)
            {
                DuplicateNameValidator.Visible = true;
            }

            if (txtRoomTypeName == null)
            {
                DuplicateNameValidator.Visible = false;
            }

            if (double.TryParse(option, out num) == false)
            {
                lblRoomTypeRateIsNumberValidator.Visible = true;
            }

            if (double.TryParse(option, out num) == true)
            {
                lblRoomTypeRateIsNumberValidator.Visible = false;
            }

            if (txtRatePerNight.Text == null)
            {
                lblRoomTypeRateIsNumberValidator.Visible = false;
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

        protected void btnRoomTypeList_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewRoomTypes.aspx");
        }

    }
}