<%@ Page Title="EASiBOOK :: Provisional Bookings" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProvisionalBookings.aspx.cs" Inherits="Monkey_Business.ProvisionalBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3>Provisional Bookings</h3><br />
            <asp:Literal ID="litHeader" runat="server"></asp:Literal>

            <asp:RadioButton ID="rdoAll" runat="server" GroupName="POP" Text="Show All" Checked="true" OnCheckedChanged="rdoAll_CheckedChanged" AutoPostBack="true" />&nbsp;&nbsp;
            <asp:RadioButton ID="rdoPaid" runat="server" GroupName="POP" Text="With Proof of Payment" OnCheckedChanged="rdoPaid_CheckedChanged" AutoPostBack="true" />&nbsp;&nbsp;
            <asp:RadioButton ID="rdoUnpaid" runat="server" GroupName="POP" Text="Without Proof of Payment" OnCheckedChanged="rdoUnpaid_CheckedChanged" AutoPostBack="true" /><br /><br />
            <div class="table-responsive">
            <table style="margin-left:auto;margin-right:auto;" class="table provisionalBookings">
                <thead><tr><th>Booking Number <asp:Image ID="Image1" runat="server" ImageUrl="./resources/updown.png" /></th><th>Customer Name <asp:Image ID="Image2" runat="server" ImageUrl="./resources/updown.png" /></th><th>Deposit Amount <asp:Image ID="Image3" runat="server" ImageUrl="./resources/updown.png" /></th><th>Arrive Date <asp:Image ID="Image4" runat="server" ImageUrl="./resources/updown.png" /></th><th>Depart Date <asp:Image ID="Image5" runat="server" ImageUrl="./resources/updown.png" /></th><th>View Booking <asp:Image ID="Image6" runat="server" ImageUrl="./resources\updown.png" /></th></tr></thead>
                <asp:Literal ID="litProvisionalBookings" runat="server"></asp:Literal>
            </table>
            </div>
        </div>
    </div>
</asp:Content>
