<%@ Page Title="EASiBOOK :: Available Rooms" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ShowAvailability.aspx.cs" Inherits="Monkey_Business.ShowAvailability" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function AddRoomToBooking(roomID) {
            var hiddenfieldstring = document.getElementById('bookedRooms').value;
            var compareString = roomID + ",";
            if (hiddenfieldstring.indexOf(compareString) > -1)
                document.getElementById('bookedRooms').value = hiddenfieldstring.replace(roomID + ",", "");
            else
                document.getElementById('bookedRooms').value += roomID + ",";
        }

        function TestHidden() {
            var hiddenField = document.getElementById('bookedRooms').value;
            window.alert(hiddenField);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <asp:Literal ID="litHeader" runat="server"></asp:Literal>
            <br />
            <asp:Literal ID="litError" runat="server"></asp:Literal>

            <div class="table-responsive">
            <table class="displayAvailabilityTable">
                <tr>
                    <td>Filter according to room type</td>
                    <td><asp:DropDownList ID="ddlRoomType" runat="server" OnSelectedIndexChanged="ddlRoomType_SelectedIndexChanged" AutoPostBack="True" ViewStateMode="Inherit">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:Button ID="btnBookRooms" runat="server" CssClass="btn btn-success btnBookRooms" Text="Book Selected Rooms" OnClick="btnBookRooms_Click" />
                    </td>
                </tr>
            </table>
            </div>
            <br />
            <div class="table-responsive">
            <table class="table displayAvailabilityTable table-hover table-striped tablesorter align-left">
                <thead><tr><th>Room Number <asp:Image ID="Image1" runat="server" ImageUrl="./resources/updown.png" /></th><th>Room Type <asp:Image ID="Image2" runat="server" ImageUrl="./resources/updown.png" /></th><th>Picture <asp:Image ID="Image6" runat="server" ImageUrl="./resources/updown.png" /></th><th>Maximum Occupants <asp:Image ID="Image3" runat="server" ImageUrl="./resources/updown.png" /></th><th>Rate per night <asp:Image ID="Image4" runat="server" ImageUrl="./resources/updown.png" /></th><th>Details</th><th>Book Room</th></tr></thead>
            <asp:Literal ID="litAvailableRooms" runat="server"></asp:Literal>
            </table>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="bookedRooms" ClientIDMode="Static" runat="server" />

    <%-- Test button to check if the hidden field works --%>
    <%--<button onclick="TestHidden()">Test</button>--%>
</asp:Content>
