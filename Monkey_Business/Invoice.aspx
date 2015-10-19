<%@ Page Title="Invoice" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="Monkey_Business.Invoice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well" style="width:70%;margin-left:auto;margin-right:auto;">
            <h3>Invoice Number <asp:Literal ID="litInvoiceNo" runat="server" Text="0"></asp:Literal></h3>
            <br />
            <div class="table-responsive">
            <table id="invoiceInfo" style="margin-left:auto;margin-right:auto;width:85%">
                <tr>
                    <td><strong><asp:Label ID="lblCompanyName" runat="server" Text="Label"></asp:Label></strong></td>
                    <td><strong>Banking Details:</strong></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblAddressLine1" runat="server" Text="Label"></asp:Label></td>
                    <td>Bank Name: <asp:Label ID="lblBankName" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblAddressLine2" runat="server" Text="Label"></asp:Label></td>
                    <td>Account Number: <asp:Label ID="lblBankAccountNo" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td>Phone: <asp:Label ID="lblPhoneNo" runat="server" Text="Label"></asp:Label></td>
                    <td>Branch Code: <asp:Label ID="lblBranchCode" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2">Email: <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label></td>
                </tr>
            </table>
            </div>

            <br />
            <h3><asp:Label ID="lblArriveDate" runat="server" Text="Label"></asp:Label> to <asp:Label ID="lblDepartDate" runat="server" Text="Label"></asp:Label></h3>
            <div class="table-responsive">
                
            <table id="tblInvoice" style="width:100%;margin-left:auto;margin-right:auto;">
                <tr id="invoiceHeader"><td>Room Number</td><td>Room Type</td><td>Rate per night</td><td>Total Cost</td></tr>

                <asp:Literal ID="litSelectedRooms" runat="server"></asp:Literal>
                <tr><td colspan="4">&nbsp;</td></tr>

                <tr><td colspan="4" style="text-align:right;"><strong>Deposit: R <asp:Label ID="lblDeposit" runat="server" Text="Label"></asp:Label></strong></td></tr>
                <tr><td colspan="4" style="text-align:right;"><strong>Total: R <asp:Label ID="lblTotalAmount" runat="server" Text="Label"></asp:Label></strong></td></tr>
            </table>
            </div>
        </div>
    </div>
</asp:Content>
