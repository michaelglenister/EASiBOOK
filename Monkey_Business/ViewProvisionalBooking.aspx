<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewProvisionalBooking.aspx.cs" Inherits="Monkey_Business.ViewProvisionalBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well" style="width:50%;margin-left:auto;margin-right:auto;">
            <h3>Booking Number <asp:Literal ID="litBookingNo" runat="server"></asp:Literal></h3><br />
            <div class="table-responsive">
            <table style="margin-left:auto;margin-right:auto;" class="table bookingTable">
                <tr><td><strong>Name</strong></td><td><asp:Label ID="lblName" runat="server" Text="Name"></asp:Label></td></tr>
                <tr><td><strong>E-Mail</strong></td><td><asp:Label ID="lblEmail" runat="server" Text="E-Mail"></asp:Label></td></tr>
                <tr><td><strong>Phone Number</strong></td><td><asp:Label ID="lblPhoneNo" runat="server" Text="Phone Number"></asp:Label></td></tr>
                <%--<tr><td><strong>Number of Rooms</strong></td><td><asp:Label ID="lblNoOfRooms" runat="server" Text="Number of Rooms"></asp:Label></td></tr>--%>
                <tr><td><strong>Deposit Owed</strong></td><td><asp:Label ID="lblDeposit" runat="server" Text="Deposit"></asp:Label></td></tr>
                <tr><td><strong>Arrive Date</strong></td><td><asp:Label ID="lblArriveDate" runat="server" Text="Arrive Date"></asp:Label></td></tr>
                <tr><td><strong>Depart Date</strong></td><td><asp:Label ID="lblDepartDate" runat="server" Text="Depart Date"></asp:Label></td></tr>
                <tr><td style="vertical-align:middle"><strong>Proof of Payment</strong></td><td><asp:Label ID="lblNoPOP" runat="server" Text="No proof of payment has been uploaded" ForeColor="Red" Visible="false"></asp:Label><asp:Label ID="lblLargeImage" runat="server" ForeColor="Red" >Click on image to view large version</asp:Label><br /><a href="<asp:Literal ID="litProofOfPayment" runat="server"></asp:Literal>"><asp:Image ID="imgProofOfPayment" runat="server" Width="300px" Height="300px" /></a></td></tr>
                <tr><td style="text-align:center" colspan="2"><asp:Button ID="btnConfirm" runat="server" Text="Confirm Booking" CssClass="btn btn-success" OnClick="btnConfirm_Click" /> <asp:Button ID="btnDecline" runat="server" Text="Decline Booking" CssClass="btn btn-danger" OnClick="btnDecline_Click" /></td></tr>
            </table>
            </div>
        </div>
    </div>
</asp:Content>
