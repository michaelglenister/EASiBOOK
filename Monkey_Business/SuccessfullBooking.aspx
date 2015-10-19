<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="SuccessfullBooking.aspx.cs" Inherits="Monkey_Business.SuccessfullBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
        <h3 style="color:green;">You have successfully created a booking</h3>
            <p>Thank you for your reservation.<br />
               Your booking is currently provisional and will only become confirmed once you have paid your deposit and uploaded your proof of payment.<br />
               You can choose to either upload your proof of payment now, or it can be uploaded at a later stage by going to "My Bookings"<br />
               Our banking details can be found on the invoice.
            </p>

            <br />
            <asp:Button ID="btnViewInvoice" runat="server" Text="View Invoice" CssClass="btn btn-info btnViewInvoice" OnClick="btnViewInvoice_Click" /><br /><br />
            <asp:Button ID="btnUploadPOP" runat="server" Text="Upload Proof of Payment" CssClass="btn btn-success" OnClick="btnUploadPOP_Click" /><br /><br />
        </div>
    </div>
</asp:Content>
