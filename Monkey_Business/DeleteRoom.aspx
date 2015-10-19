<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DeleteRoom.aspx.cs" Inherits="Monkey_Business.DeleteRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3>Delete Room</h3>
            <table class="table">
                <thead>
                <tr>
                    <td>
                        Room Number:</td>
                    <td>
                        <asp:Label ID="lblRoomNo" runat="server"></asp:Label></td>
                </tr>
                </thead>
                <tr>
                    <td>
                        Description:</td>
                    <td>
                        <asp:Label ID="lblDescription" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        Picture:</td>
                    <td>
                        <asp:Literal ID="litRoomPicture" runat="server"></asp:Literal></td>
                </tr>
                <tr>
                    <td>
                        Room Type:</td>
                    <td>
                        <asp:Label ID="lblRoomType" runat="server"></asp:Label></td>
                </tr>
            </table>

            <asp:Button ID="btnDeleteRoom" runat ="server" Text="Delete Room" CssClass="btn btn-danger" OnClick="btnDeleteRoom_Click" />
            <asp:Button ID="btnRoomList" runat="server" Text="View Room List" CssClass="btn btn-warning" OnClick="btnRoomList_Click" ToolTip="Go back to the view room list page."/><br /><br />
                        
            <asp:Label ID="lblProgress" runat="server" Text="" CssClass="label label-warning"></asp:Label><br /><br />
            <asp:Label ID="lblRedirect" runat="server" Text="" CssClass="label label-info"></asp:Label>
        </div>
    </div>
</asp:Content>
