<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddRoom.aspx.cs" Inherits="Monkey_Business.AddRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
            function SetPlaceHolders() {
                document.getElementById('txtRoomNo').placeholder = "Enter room number";
                document.getElementById('txtDescription').placeholder = "Enter room description";
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="container text-center">
        <div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <p style="font-size: 16px">Fill in the details of the new room. <br /> You are required to provide data for fields highlighted in red!</p></div>
        <div class="well">
            <table class="table table-hover tablesorter">
                <thead><tr>
                    <td>
                        <asp:Label ID="lblRoomNumber" runat="server" Text="Room Number:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtRoomNo" runat="server" CssClass="required-field form-control" ToolTip="Enter the room number here" ClientIDMode="Static"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validatorRoomNo" runat="server" ErrorMessage="<br />You must enter a room number." ControlToValidate="txtRoomNo" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtDescription" runat="server" ToolTip="Enter a description for the room here" CssClass="form-control" ClientIDMode="Static"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblType" runat="server" Text="Room Type:"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="dlTypeID" runat="server" CssClass="form-control" ToolTip="Select the type of room"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPicture" runat="server" Text="Picture:"></asp:Label></td>
                    <td><asp:Label ID="lblExtensionWarning" runat="server" Text="Only a JPEG and PNG images smaller than 3 megabytes can be uploaded."></asp:Label>
                        <br />
                        <asp:FileUpload ID="fileUploadControl" runat="server" CssClass ="btn btn-primary" ToolTip="Use this to upload a picture of the room" /><br />
                    </td> 
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblDetails" runat="server" Text="Room Details:"></asp:Label></td>
                    <td>
                        <table class="table-spacing">
                            <tr>
                                <td><asp:CheckBox ID="cbWifi" runat="server" Text="Wifi" /></td>
                                <td><asp:CheckBox ID="cbAircon" runat="server" Text="Air Conditioner" /></td>
                                <td><asp:CheckBox ID="cbRoomservice" runat="server" Text="Room Service" /></td>
                                <td><asp:CheckBox ID="cbTelevision" runat="server" Text="Television" /></td>
                            </tr>
                        </table></td>
                </tr></thead>
            </table>
            <hr />
            <asp:Button ID="btnAddRoom" runat="server" Text="Add This Room" CssClass="btn btn-success" OnClick="btnAddRoom_Click" />
            <button type="reset" class="btn btn-warning cancel" id="clearData">
                <i class="glyphicon glyphicon-ban-circle"></i>
                <span>Clear All Data</span>
            </button>
            <asp:Button ID="btnListRooms" runat="server" Text="List all rooms" CssClass="btn btn-warning" CausesValidation="False" OnClick="btnListRooms_Click" OnClientClick="document.getElementById('clearData').click();"  /><br /><br />
            <asp:Label ID="lblProgress" runat="server" Text="" CssClass="label label-danger"></asp:Label><br /><br />
            <asp:Label ID="lblRedirect" runat="server" Text="" CssClass="label label-info"></asp:Label>
        </div>
    </div>
    
    <script type="text/javascript">
        SetPlaceHolders();
    </script>
</asp:Content>
