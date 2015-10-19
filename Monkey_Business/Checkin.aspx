<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Checkin.aspx.cs" Inherits="Monkey_Business.Checkin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3><asp:Literal ID="litHeader" runat="server"></asp:Literal></h3>
            <br />
            <table class="confirmTable" style="margin-left:auto;margin-right:auto;">
                <tr><td>&nbsp;<asp:Button ID="btnYes" runat="server" Text="Yes" CssClass="btn btn-success" Width="100px" OnClick="btnYes_Click" /></td><td><asp:Button ID="btnNo" runat="server" Text="No" CssClass="btn btn-danger" Width="100px" OnClick="btnNo_Click" />&nbsp;</td></tr>
                <tr><td colspan="2"><asp:Button ID="btnBack" runat="server" Text="Back to Check-ins" CssClass="btn btn-info" Visible="false" OnClick="btnBack_Click" /></td></tr>
                
            </table>
        </div>
    </div>
</asp:Content>
