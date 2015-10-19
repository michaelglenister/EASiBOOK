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
    public partial class EditRoomType : System.Web.UI.Page
    {
        RoomTypeHandler roomTypeHandler = null;
        string selectedRadioButton;

        protected void Page_Load(object sender, EventArgs e)
        {
            roomTypeHandler = new RoomTypeHandler();
            if (IsPostBack == false)
            {
                rdoAvailable.Checked = true;
                BindData();
            }
        }

        private void BindData()
        {
            string htmlOutput = "";

            if (rdoAvailable.Checked == true)
            {
                selectedRadioButton = "Yes";
            }
            else
            {
                selectedRadioButton = "No";
            }

            List<RoomType> roomTypeList = roomTypeHandler.GetRoomTypeList(selectedRadioButton);

            //Populating room type literal
            try
            {
                for (int i = 0; i < roomTypeList.Count; i++)
                {
                    htmlOutput += "<tr><td>" + roomTypeList[i].Name + "</td><td>" + roomTypeList[i].MaxCapacity + "</td><td>" + roomTypeList[i].Available + "</td><td>R " + roomTypeList[i].RatePerNight + "</td><td><input type=\"radio\" name=\"room\" onclick=\"EditRoom(" + roomTypeList[i].TypeID + ")\" />" + "</td></tr>";
                }

                litRoomTypeList.Text = htmlOutput;
            }
            catch (NullReferenceException)
            { }
        }


        protected void btnAddRoomType_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddRoomType.aspx");
        }

        protected void rdoAvailable_CheckedChanged(object sender, EventArgs e)
        {
            btnDeleteRoomType.Enabled = true;
            BindData();
        }

        protected void rdoDeleted_CheckedChanged(object sender, EventArgs e)
        {
            btnDeleteRoomType.Enabled = false;
            BindData();
        }

        protected void btnEditRoomType_Click(object sender, EventArgs e)
        {
            Session["EditRoomType"] = selectedRoomType.Value;

            if (selectedRoomType.Value == "" || selectedRoomType.Value == null)
            {
                litError.Text = "<h3 style=\"color:red\">You need to select a room type to edit</h3><br />";
            }
            else
                Response.Redirect("EditRoomType.aspx");
        }

        protected void btnDeleteRoomType_Click(object sender, EventArgs e)
        {
            Session["EditRoomType"] = selectedRoomType.Value;

            if (selectedRoomType.Value == "" || selectedRoomType.Value == null)
            {
                litError.Text = "<h3 style=\"color:red\">You need to select a room to delete</h3><br />";
            }
            else
                Response.Redirect("DeleteRoomType.aspx");
        }

    }
}