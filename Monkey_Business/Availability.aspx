<%@ Page Title="EASiBOOK :: Check Availability" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Availability.aspx.cs" Inherits="Monkey_Business.Availability" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">

        <div class="well availabilityDiv">
            <h3>Check Room Availability</h3><br />
            <div class="bs-example">
              <ul class="nav nav-tabs" style="margin-bottom: 15px;">
                <li class="active"><a href="#one" data-toggle="tab">Selecting Dates</a></li>
                <li><a href="#two" data-toggle="tab">View Help</a></li>
              </ul>
              <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade active in" id="one">

            <table class="availabilityTable">
                <tr>
                    <td class="column1">Arrive Date</td>
                    <td class="column2">
                        <asp:Calendar ID="startDateCalander" runat="server" OnDayRender="startDateCalander_DayRender" OnSelectionChanged="startDateCalander_SelectionChanged" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="column1">Depart Date</td>
                    <td class="column2">
                        <asp:Calendar ID="endDateCalander" runat="server" OnDayRender="endDateCalander_DayRender" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                            <WeekendDayStyle BackColor="#CCCCFF" />
                        </asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="btnColumn"><asp:Button ID="btnCheckAvailability" runat="server" Text="Check Availability" CssClass="btn btn-danger" OnClick="btnCheckAvailability_Click" /></td>
                </tr>
            </table>
                </div>
                <div class="tab-pane fade text-left" id="two">
                    <br />
                    <strong>What are the two calendars?</strong>
                    <p>The first calendars is the date which you plan on arriving on and the second calendars is the date that you plan on leaving.</p>
                    <hr />
                    <strong>How do I see what the room looks like before I book it?</strong>
                    <p>Once you have picked the two dates you will be able to view the rooms that are available between the dates.
                        In the list of rooms there will be a link you can click on called "View Picture" which should bring up a picture of the room.</p>
                    <hr />
                    <strong>How do I book multiple rooms?</strong>
                    <p>There is checkboxes on the right side of the available rooms list which you can check, this allows you to select multiple rooms.</p>
                    <hr />
                    <strong>How do I know how much the booking will cost me?</strong>
                    <p>Before you finalize your booking you will be shown a provisional invoice which will display how much each room will cost, 
                        the deposit amount and the total cost.</p>
                </div>
              </div>
            </div>
        </div>
    </div>
</asp:Content>
