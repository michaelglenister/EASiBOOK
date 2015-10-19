<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomDetails.aspx.cs" Inherits="Monkey_Business.RoomDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Room Details</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Details for room: <asp:Label ID="lblRoomNo" runat="server" Text=""></asp:Label></h3>
            </div>
            <div class="panel-body">
                <table class="table">
                    <thead><tr>
                        <td>WiFi:</td>
                        <td>
                            <asp:Label ID="lblWifi" runat="server" Text=""></asp:Label></td>
                    </tr></thead>
                    <tr>
                        <td>Air Conditioner:</td>
                        <td>
                            <asp:Label ID="lblAircon" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Room Service:</td>
                        <td>
                            <asp:Label ID="lblRoomservice" runat="server" Text=""></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Television:</td>
                        <td>
                            <asp:Label ID="lblTelevision" runat="server" Text=""></asp:Label></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
