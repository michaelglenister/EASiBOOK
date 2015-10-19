<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="StaffTools.aspx.cs" Inherits="Monkey_Business.StaffTools" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3>Booking Admin and Owner</h3><br />
            <asp:Button ID="btnProfileDetails" runat="server" Text="View Provisional Bookings" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnProfileDetails_Click" /><br /><br />
            <asp:Button ID="btnCheckIn" runat="server" Text="Check-in Customer" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnCheckIn_Click" /><br /><br />
            <asp:Button ID="btnCheckOut" runat="server" Text="Check-out Customer" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnCheckOut_Click" /><br /><br />
            <asp:Button ID="btnViewOccupants" runat="server" Text="View Current Occupants" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnViewOccupants_Click" />

            <asp:Literal ID="litOwnerHeader" runat="server" Text="<br /><br /><h3>Owner Only</h3><br />" Visible="false"></asp:Literal>
            <asp:Button ID="btnListRooms" runat="server" Text="List all rooms" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnListRooms_Click" Visible="false" /><br /><br />
            <asp:Button ID="btnListRoomTypes" runat="server" Text="List all room types" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnListRoomTypes_Click" Visible="false" /><br /><br />
            <asp:Button ID="btnFindMember" runat="server" Text="Find a Member" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnFindMember_Click" Visible="false" /><br /><br />
            <asp:Button ID="btnBusinessSettings" runat="server" Text="Business Settings" CssClass="btn-success btnHome" Width="250px" Height="50px" Visible="false" OnClick="btnBusinessSettings_Click" /><br /><br />
        </div>
    </div>
</asp:Content>
