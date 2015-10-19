<%@ Page Title="EASiBOOK :: Check In List" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckinList.aspx.cs" Inherits="Monkey_Business.CheckList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <p style="font-size: 16px">Only bookings that have been confirmed will appear in the list below.</p>
        </div>
    </div>
    <div class="container text-center">
        <div class="well">
            <h3>Check-in Customer</h3><br />
            <asp:Literal ID="litHeader" runat="server"></asp:Literal>

            <div class="table-responsive">
            <table style="margin-left:auto;margin-right:auto;" class="table provisionalBookings">
                <thead><tr><th>Booking Number <asp:Image ID="Image1" runat="server" ImageUrl="./resources/updown.png" /></th><th>Customer Name <asp:Image ID="Image2" runat="server" ImageUrl="./resources/updown.png" /></th><th>Arrive Date <asp:Image ID="Image3" runat="server" ImageUrl="./resources/updown.png" /></th><th>Depart Date <asp:Image ID="Image4" runat="server" ImageUrl="./resources/updown.png" /></th><th>Check-in <asp:Image ID="Image5" runat="server" ImageUrl="./resources/updown.png" /></th></tr></thead>
                <asp:Literal ID="litConfirmedBookings" runat="server"></asp:Literal>
            </table>
            </div>
        </div>
    </div>
</asp:Content>
