<%@ Page Title="EASiBOOK :: Check Out List" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckoutList.aspx.cs" Inherits="Monkey_Business.CheckoutList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <p style="font-size: 16px">Only checked-in bookings will appear in the list below.</p>
        </div>
    </div>
    <div class="container text-center">
        <div class="well">
            <h3>Check-out Customer</h3><br />
            <asp:Literal ID="litHeader" runat="server"></asp:Literal>

            <div class="table-responsive">
            <table style="margin-left:auto;margin-right:auto;" class="table provisionalBookings">
                <thead><tr><th>Booking Number <asp:Image ID="Image1" runat="server" ImageUrl="./resources/updown.png" /></th><th>Customer Name <asp:Image ID="Image2" runat="server" ImageUrl="./resources/updown.png" /></th><th>Check-In Date <asp:Image ID="Image3" runat="server" ImageUrl="./resources/updown.png" /></th><th>Check-out <asp:Image ID="Image5" runat="server" ImageUrl="./resources/updown.png" /></th></tr></thead>
                <asp:Literal ID="litConfirmedBookings" runat="server"></asp:Literal>
            </table>
            </div>
        </div>
    </div>
</asp:Content>
