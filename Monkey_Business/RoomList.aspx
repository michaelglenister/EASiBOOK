<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RoomList.aspx.cs" Inherits="Monkey_Business.RoomList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function EditRoom(roomNo) {
            document.getElementById('selectedRooms').value = roomNo;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <p style="font-size: 16px">Choose a room by selecting the button to the right in the list and then select the edit or delete buttons at the bottom of the page.</p></div>

        <div class="well">
            <h3>List of rooms</h3><br />

            <div class="bs-example">
	        <ul class="nav nav-tabs" style="margin-bottom: 15px;">
		        <li class="active"><a href="#one" data-toggle="tab">View Rooms</a></li>
		        <li><a href="#two" data-toggle="tab">View Help</a></li>
	        </ul>
			  
	        <div id="myTabContent" class="tab-content">
		        <div class="tab-pane fade active in" id="one">

                    <asp:Button ID="btnAddRoom" runat="server" Text="Add a New Room" CssClass="btn btn-success" ToolTip="Add a new room to this list" OnClick="btnAddRoom_Click" /><br /><br />
                    
                    <table class="table-spacing">
                        <tr><td><asp:RadioButton ID="rdoShowEnabled" runat="server" Text="Display Enabled Rooms" ToolTip="Check this box to display the enabled rooms only" Checked="True" GroupName="RoomDisplay" OnCheckedChanged="rdoShowEnabled_CheckedChanged" AutoPostBack="True" /><br /></td>
                            <td><asp:RadioButton ID="rdoShowDisabled" runat="server" Text="Display Deleted Rooms" ToolTip="Check this box to display disabled rooms only" GroupName="RoomDisplay" OnCheckedChanged="rdoShowDisabled_CheckedChanged" AutoPostBack="True" /><br /></td></tr>
                    </table>

                    <asp:Literal ID="litHeader" runat="server"></asp:Literal><br />
                    <asp:Literal ID="litError" runat="server"></asp:Literal><br />

                    <div class="table-responsive">
                    <table class="table table-hover table-striped tablesorter align-left">
                        <thead><tr><th>Room Number <asp:Image ID="Image1" runat="server" ImageUrl="./resources/updown.png" /></th><th>Description <asp:Image ID="Image2" runat="server" ImageUrl="./resources/updown.png" /></th><th>Picture <asp:Image ID="Image3" runat="server" ImageUrl="./resources/updown.png" /></th><th>Room Type <asp:Image ID="Image4" runat="server" ImageUrl="./resources/updown.png" /></th><th>Capacity <asp:Image ID="Image5" runat="server" ImageUrl="./resources/updown.png" /></th><th>Details</th><th>Select</th></tr></thead>
                    <asp:Literal ID="litRoomList" runat="server"></asp:Literal>
                    </table>
                    </div>

                    <asp:Button ID="btnEditRoom" runat="server" Text="Edit Selected Room" CssClass="btn btn-warning" OnClick="btnEditRoom_Click" ToolTip="Edit the room you have selected" />
                    <asp:Button ID="btnDeleteRoom" runat="server" Text="Deleted Selected Room" CssClass="btn btn-danger" OnClientClick = "Confirm()" OnClick="btnDeleteRoom_Click" ToolTip="This will delete the selected room." />

                    <asp:HiddenField ID="selectedRooms" ClientIDMode="Static" runat="server" />
                    </div>
                    <div class="tab-pane fade text-left" id="two">
                        <br />
                        <strong>How do I add a room to the system?</strong>
                        <p>At the top of the page you have the option to add a room. 
                            Take note that if a room has been added and disabled before you can simply enable it again.</p>
                        <hr />
                        <strong>How can I edit or delete a room?</strong>
                        <p>The options to edit and delete rooms appear at the bottom of the room list page. 
                            Be sure to select a room from the list first and the choose edit or delete.</p>
                        <hr />
                        <strong>I accidentally deleted a room, how do I get it back?</strong>
                        <p>Toggle the option near the top of the page to show deleted rooms. 
                            Then simply edit the room you wish to enable again.</p>
                        <hr />
                        <strong>How do I change or remove a picture of the room?</strong>
                        <p>You can do this by editing a room on the room list page and selecting either the, add or remove picture options.</p>
                        <hr />
                        <strong>Why can't I add a room to the system?</strong>
                        <p>Check that you aren't using a room number that already exists. 
                            If the room number is being used by a deleted room, it is advised that you edit and enable that room with the new details.</p>
                    </div>
	            </div>
            </div>
        </div>
    </div>
</asp:Content>
