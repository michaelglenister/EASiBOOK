<%@ Page Title="EASiBOOK :: Delete RoomType" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DeleteRoomType.aspx.cs" Inherits="Monkey_Business.DeleteRoomType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3>Delete Room Type</h3>
            <br />
            <table class="register">
                <tr>
                    <td  class ="column1" >Room Type ID:</td>
                    <td class="column2"><asp:Label ID="lblRoomTypeID" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class ="column1">Room Type Name:</td>
                    <td class="column2"><asp:Label ID="lblRoomTypeName" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class ="column1">Room Type Capacity:</td>
                    <td class="column2"><asp:Label ID="lblRoomTypeCapacity" runat="server"></asp:Label></td>
                </tr>

                <tr>
                    <td class ="column1">Room Type Rate:</td>
                    <td class="column2"><asp:Label ID="lblRatePerNight" runat="server"></asp:Label></td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnDeleteRoomType" runat ="server" Text="Delete Room" CssClass="btn btn-danger" OnClick="btnDeleteRoomType_Click" />
            <asp:Button ID="btnRoomTypeList" runat="server" Text="View room types" CssClass="btn btn-warning" OnClick="btnRoomTypeList_Click" ToolTip="Go back to the view room type page."/><br /><br />
                        
            <asp:Label ID="lblProgress" runat="server" Text="" CssClass="label label-warning"></asp:Label><br /><br />
            <asp:Label ID="lblRedirect" runat="server" Text="" CssClass="label label-info"></asp:Label>
        </div>
    </div>
</asp:Content>
