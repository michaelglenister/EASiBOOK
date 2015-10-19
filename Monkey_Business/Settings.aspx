<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="Monkey_Business.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3>Settings</h3>
            <br />
            <table class="table table-hover tablesorter">
                <tr>
                    <td><strong>Business Name:</strong></td>
                    <td><asp:Label ID="lblName" runat="server" Text="Business Name" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr>
                    <td><strong>Phone Number:</strong></td>
                    <td><asp:Label ID="lblPhoneNo" runat="server" Text="Phone Number" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr>
                    <td><strong>E-mail:</strong></td>
                    <td><asp:Label ID="lblEmail" runat="server" Text="E-mail" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr>
                    <td><strong>E-mail Server:</strong></td>
                    <td><asp:Label ID="lblServer" runat="server" Text="E-mail Server" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr>
                    <td><strong>E-mail Port:</strong></td>
                    <td><asp:Label ID="lblPort" runat="server" Text="E-mail Port" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr>
                    <td><strong>Address Line 1:</strong></td>
                    <td><asp:Label ID="lblAddressLine1" runat="server" Text="Address Line 1" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr>
                    <td><strong>Address Line 2:</strong></td>
                    <td><asp:Label ID="lblAddressLine2" runat="server" Text="Address Line 2" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr>
                    <td><strong>Deposit Percentage:</strong></td>
                    <td><asp:Label ID="lblPercentage" runat="server" Text="Deposit Percentage" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr>
                    <td><strong>Bank Name:</strong></td>
                    <td><asp:Label ID="lblBankName" runat="server" Text="BankName" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr>
                    <td><strong>Account Number:</strong></td>
                    <td><asp:Label ID="lblAccountNo" runat="server" Text="AccountNo" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr>
                    <td><strong>Branch Code:</strong></td>
                    <td><asp:Label ID="lblBranchCode" runat="server" Text="BranchCode" Font-Bold="true"></asp:Label></td>
                </tr>

                <tr><td colspan="2"><asp:Button ID="btnEdit" runat="server" cssclass="btn-success" Text="Edit Business Details" Width="159px" OnClick="btnEdit_Click" /></td></tr>
            </table>
        </div>
    </div>
</asp:Content>

