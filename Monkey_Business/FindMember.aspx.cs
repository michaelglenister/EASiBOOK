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
    public partial class FindMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MemberHandler memberHandler = new MemberHandler();

            if (!Page.IsPostBack)
            {
                //populate typeID drop down list (dlTypeID) with every TypeID
                lstMembers.DataSource = memberHandler.GetMemberNameList();
                lstMembers.DataTextField = "Name";
                lstMembers.DataValueField = "MemberID";
                lstMembers.DataBind();
            }
        }

        protected void btnViewProfile_Click(object sender, EventArgs e)
        {
            //go to members profile
            if (lstMembers.SelectedIndex == -1)
            {
                lblProgress.Text = "You must first select a member from the box above.";
            }
            else
            {
                lblProgress.Text = "";
                int memberID = Convert.ToInt32(lstMembers.SelectedValue);
                Session["MemberSearchID"] = memberID;

                Response.Redirect("Profile.aspx?id=" + Session["MemberSearchID"].ToString());
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //search the database for the given search string (includes partial matches)
            lstMembers.Items.Clear();

            string searchQuery = txtSearch.Text.Replace(" ", "%");
            searchQuery = searchQuery.Trim();

            MemberHandler memberHandler = new MemberHandler();

            lstMembers.DataSource = memberHandler.GetMemberSearchList(searchQuery);
            lstMembers.DataTextField = "Name";
            lstMembers.DataValueField = "MemberID";
            lstMembers.DataBind();
        }

        protected void btnStaffTools_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffTools.aspx");
        }
    }
}