<%@ Page Title="EASiBOOK :: Home" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Monkey_Business.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <p style="font-size: 16px">Welcome to EASiBOOK dashboard, the online hotel room booking system. For more information please visit our FAQ page.</p>
        <a href="Faq.aspx" class="btn btn-info">Frequently asked questions</a>
        </div>
    </div>

    <div class="container text-center">
        <div class="well">
            <asp:Label ID="lblWelcome" runat="server" Text="Label" Font-Size="Large" Visible="false"></asp:Label><br />
            <asp:Button ID="btnViewRooms" runat="server" Text="Make a booking" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnViewRooms_Click" /><br /><br />
            <asp:Button ID="btnProfileDetails" runat="server" Text="View Profile Details" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnProfileDetails_Click" /><br /><br />
            <asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile Details" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnUpdateProfile_Click" /><br /><br />
            <asp:Button ID="btnViewBookingHistory" runat="server" Text="View My Bookings" CssClass="btn-success btnHome" Width="250px" Height="50px" OnClick="btnViewBookingHistory_Click" /><br /><br />

            <asp:Button ID="btnStaffTools" runat="server" Text="Staff Tools" Visible="false" CssClass="btn-danger btnHome" Width="250px" Height="50px" OnClick="btnStaffTools_Click" />
        </div>
    </div>
</asp:Content>
