<%@ Page Title="EASiBOOK :: My Profile" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Monkey_Business.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h2><asp:Literal ID="litCustomerName" runat="server"></asp:Literal></h2>
            <br />
            <table style="margin-left:auto; margin-right:auto;">
                <tr>
                    <td style="padding:5px"><asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile" CssClass="btn btn-danger" OnClick="btnUpdateProfile_Click" /></td>
                    <td style="padding:5px"><asp:Button ID="btnViewBookingHistory" runat="server" Text="View Booking History" CssClass="btn btn-info" OnClick="btnViewBookingHistory_Click" /></td>
                </tr>
            </table>
            
            <br /><br />
            <div class="table-responsive">
            <table class="table" style="width:50%; margin-left:auto; margin-right:auto;">
                <tr class="warning"><td><strong>Name:</strong></td><td><asp:Label ID="lblFirstName" runat="server" Text="First Name" Font-Bold="true"></asp:Label></td></tr>
                <tr class="info"><td><strong>Surname:</strong></td><td><asp:Label ID="lblSurname" runat="server" Text="Surname" Font-Bold="true"></asp:Label></td></tr>
                <tr class="warning"><td><strong>E-Mail:</strong></td><td><asp:Label ID="lblEmail" runat="server" Text="E-Mail Address" Font-Bold="true"></asp:Label></td></tr>
                <tr class="info"><td><strong>Address Line 1:</strong></td><td><asp:Label ID="lblAddressLine1" runat="server" Text="Address Line 1" Font-Bold="true"></asp:Label></td></tr>
                <tr class="warning"><td><strong>Address Line 2:</strong></td><td><asp:Label ID="lblAddressLine2" runat="server" Text="Address Line 2" Font-Bold="true"></asp:Label></td></tr>
                <tr class="info"><td><strong>Suburb:</strong></td><td><asp:Label ID="lblSuburb" runat="server" Text="Suburb" Font-Bold="true"></asp:Label></td></tr>
                <tr class="warning"><td><strong>Postal Code:</strong></td><td><asp:Label ID="lblPostalCode" runat="server" Text="Postal Code" Font-Bold="true"></asp:Label></td></tr>
                <tr class="info"><td><strong>City:</strong></td><td><asp:Label ID="lblCity" runat="server" Text="City" Font-Bold="true"></asp:Label></td></tr>
                <tr class="warning"><td><strong>Phone Number:</strong></td><td><asp:Label ID="lblPhoneNo" runat="server" Text="Phone Number" Font-Bold="true"></asp:Label></td></tr>
                <tr class="info"><td><strong>Role:</strong></td><td><asp:Label ID="lblRole" runat="server" Text="Role" Font-Bold="true"></asp:Label></td></tr>
            </table>
                </div>
        </div>
    </div>
</asp:Content>
