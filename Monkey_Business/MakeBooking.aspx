<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MakeBooking.aspx.cs" Inherits="Monkey_Business.MakeBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3>Finalize booking</h3>
            <br />
            <p>You have selected to book the following rooms, please check that this is correct before you confirm the booking.</p>
            <h3><asp:Literal ID="litDates" runat="server"></asp:Literal></h3>
            

            <br />
            <div class="table-responsive">
            <table class="table displayAvailabilityTable">
                <thead><tr><td>Room Number</td><td>Room Type</td><td>Maximum Occupants</td><td>Rate per night</td><td>Total Cost</td></tr></thead>
            <asp:Literal ID="litAvailableRooms" runat="server"></asp:Literal>
                <tr><td colspan="4">&nbsp;</td>
                    <td>
                        <strong>Deposit: R <asp:Label ID="lblDeposit" runat="server" Text="0"></asp:Label></strong>
                        <br />
                        <strong>Total:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; R <asp:Label ID="lblTotalCost" runat="server" Text="0"></asp:Label></strong>
                    </td></tr>
                <tr><td colspan="5" class="btnColumn"><asp:Button ID="btnReselect" runat="server" Text="Re-Select Rooms" CssClass="btn btn-warning" OnClick="btnReselect_Click" />&nbsp;<asp:Button ID="btnFinishBooking" runat="server" Text="Finish Booking" CssClass="btn btn-success" OnClick="btnFinishBooking_Click" /></td></tr>
            </table>
            </div>
        </div>
    </div>
</asp:Content>
