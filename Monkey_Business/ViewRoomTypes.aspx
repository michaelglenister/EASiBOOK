<%@ Page Title="EASiBOOK :: View RoomTypes" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewRoomTypes.aspx.cs" Inherits="Monkey_Business.EditRoomType" %>
<asp:Content ID ="Content1" ContentPlaceHolderID="head" runat="server">
<script>
    function EditRoom(roomNo) {
        document.getElementById('selectedRoomType').value = roomNo;
    }
</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    <div class="container text-center"> 
        <div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <p style="font-size: 16px">Choose a room type by selecting the button to the right in the list and then select the edit or delete buttons at the bottom of the page.</p></div>
        <div class="well">
            <h3>View Room Types</h3><br />
            <div class="bs-example">
	        <ul class="nav nav-tabs" style="margin-bottom: 15px;">
		        <li class="active"><a href="#one" data-toggle="tab">Room Types</a></li>
		        <li><a href="#two" data-toggle="tab">View Help</a></li>
	        </ul>
			  
	            <div id="myTabContent" class="tab-content">
		            <div class="tab-pane fade active in" id="one">

                        <asp:Button Width="150px" ID="btnAddRoomType" runat="server" Text="Add Room Type" CssClass="btn btn-success" OnClick="btnAddRoomType_Click"/><br /><br />
                        <table class="table-spacing">
                            <tr><td><asp:RadioButton AutoPostBack ="true" ID="rdoAvailable" runat="server" Text="View Available Room Types" GroupName="selectedOption" OnCheckedChanged="rdoAvailable_CheckedChanged" /></td>
                            <td><asp:RadioButton AutoPostBack="true" ID="rdoDeleted" runat="server" Text="View Deleted Room Types" GroupName="selectedOption" OnCheckedChanged="rdoDeleted_CheckedChanged" /></td></tr>
                        </table>

                        <asp:Literal ID="litHeader" runat="server"></asp:Literal><br />
                        <asp:Literal ID="litError" runat="server"></asp:Literal><br />

                        <div class="table-responsive">
                        <table class="table table-hover table-striped tablesorter align-left">
                            <thead><tr><th>Name <asp:Image ID="Image2" runat="server" ImageUrl="./resources/updown.png" /></th><th>Capacity <asp:Image ID="Image3" runat="server" ImageUrl="./resources/updown.png" /></th><th>Available <asp:Image ID="Image4" runat="server" ImageUrl="./resources/updown.png" /></th><th>Rate <asp:Image ID="Image5" runat="server" ImageUrl="./resources/updown.png" /></th><th></th></tr></thead>
                        <asp:Literal ID="litRoomTypeList" runat="server"></asp:Literal>
                        </table>
                        </div>
            
                        <asp:Button CssClass="btn btn-warning" ID="btnEditRoomType" runat="server"  Text="Edit Room Type" OnClick="btnEditRoomType_Click" />
                        <asp:Button CssClass="btn btn-danger" ID="btnDeleteRoomType" runat="server" Text="Delete Room Type" OnClick="btnDeleteRoomType_Click" />
                    </div>
		            <div class="tab-pane fade text-left" id="two">
                        <br />
                        <strong>What is the list of room types?</strong>
                        <p>This list serves to show all the room types currently offered by this hotel, as well as the information associated with that room type.</p>
                        <hr />
                        <strong>What is a deleted room type?</strong>
                        <p>This is a room type that the hotel no longer offers and has removed from the system.</p>
                        <hr />
                        <strong>How do I delete a room type?</strong>
                        <p>In the list of available room types by selecting the room type you wish to delete and clicking the delete room type button located at the bottom of the room type list. 
                            A summary of the room type details will then be shown and the room type can be deleted.</p>
                        <hr />
                        <strong>Can deleted room types be viewed?</strong>
                        <p>Yes. By clicking on the radio button labelled view deleted room types a list of deleted room types can be viewed.</p>
                        <hr />
                        <strong>How do I restore a deleted room type?</strong>
                        <p>A room type will automatically be changed to available by editing the room type, even though this option is not shown.</p>
                        <hr />
                        <strong>How do I edit a room type?</strong>
                        <p>In the list of available room types by selecting the room type you wish to delete and clicking the edit room type button located at the bottom of the room type list. 
                            A summary of the room type details will then be shown and the room type can be edited. 
                            A deleted room type that is edited will automatically become available on editing.</p>
                        <hr />
                        <strong>How do I add a room type?</strong>
                        <p>By clicking the add room type button on the view room type form, you will be taken to a form that allows you to add a room type. 
                            Simply enter the details of the new room type and click add room type. 
                            The new room type will now be displayed in the available room type list.</p>
		            </div>
	            </div>
            </div>
        </div>
    <asp:HiddenField ID="selectedRoomType" ClientIDMode="Static" runat="server" />
    </div>
</asp:Content>
