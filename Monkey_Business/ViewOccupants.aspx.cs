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
    public partial class ViewOccupants : System.Web.UI.Page
    {
        string userInput = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            BindData();
        }

        protected void BindData()
        {
            DateTime todaysDate = DateTime.Now.AddDays(1);
            userInput = TextBox1.Text;
            RoomTypeHandler handler = new RoomTypeHandler();
            string htmlOutput = "";

            List<Booking> occupantList = handler.GetOccupants(userInput, todaysDate);

            try
            {
                for (int i = 0; i < occupantList.Count; i++)
                {
                    //room name list
                    string roomNames = "";
                    string roomNumbers = occupantList[i].RoomsBooked;
                    string[] roomlist;
                    string arriveDate = "";
                    string departDate = "";
                    roomlist = roomNumbers.Split(',');
                    for (int x = 0; x < roomlist.Length; x++)
                    {
                        arriveDate = occupantList[i].ArriveDate.Year.ToString() + '-' + occupantList[i].ArriveDate.Month.ToString() + '-' + occupantList[i].ArriveDate.Day.ToString();
                        departDate = occupantList[i].DepartDate.Year.ToString() + '-' + occupantList[i].DepartDate.Month.ToString() + '-' + occupantList[i].DepartDate.Day.ToString();
                        roomNames += handler.GetRoomNames(roomlist[x]) + " ";
                    }
                    htmlOutput += "<tr><td>" + occupantList[i].BookingID + "</td><td>" + arriveDate + "</td><td>" + departDate + "</td><td>" + occupantList[i].FullName + "</td><td>" + roomNames + "</td><td><a class=\"btn btn-info\" href = \"Profile.aspx?id=" + occupantList[i].MemberID.ToString() + "\">View Profile</a></td></tr>";
                    roomNames = "";
                }
            }
            catch (NullReferenceException)
            {
                htmlOutput = "<tr><td colspan=\"6\" style=\"text-align:center; font-size:20px; font-wight:bold; color:red;\">There no occupied rooms</td></tr>";
            }

            litOccupantList.Text = htmlOutput;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void TextBox1_DataBinding(object sender, EventArgs e)
        {
            BindData();
        }
    }
}