<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditRoom.aspx.cs" Inherits="Monkey_Business.EditRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3>Edit Room</h3>
            <br />
            <table class="table table-hover tablesorter">
                <thead><tr>
                    <td>Room Number:</td>
                    <td>
                        <asp:TextBox ID="txtRoomNo" runat="server" CssClass="required-field form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="validatorRoomNo" runat="server" ErrorMessage="<br />You must enter a room number."  ControlToValidate="txtRoomNo" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td>
                        <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" MaxLength="250"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Picture:</td>
                    <td><asp:Label ID="lblExtensionWarning" runat="server" Text="Only a JPEG and PNG images smaller than 3 megabytes can be uploaded."></asp:Label>
                        <br />
                        <asp:Label ID="lblRoomNo" runat="server" Text=""></asp:Label>
                        <asp:Literal ID="litRoomPicture" runat="server"></asp:Literal><br /><br />
                        <table class="table-spacing">
                            <tr>
                                <td>
                                    <asp:RadioButton ID="rdoKeepPic" runat="server" GroupName="PictureOptions" Text="Keep current picture" Checked="True" OnCheckedChanged="rdoKeepPic_CheckedChanged" AutoPostBack="True" /></td>
                                <td>
                                    <asp:RadioButton ID="rdoUploadPic" runat="server" GroupName="PictureOptions" Text="Upload new picture" OnCheckedChanged="rdoUploadPic_CheckedChanged" AutoPostBack="True" /></td>
                                <td>
                                    <asp:RadioButton ID="rdoRemovePic" runat="server" GroupName="PictureOptions" Text="Remove current picture" OnCheckedChanged="rdoRemovePic_CheckedChanged" AutoPostBack="True" /></td>
                            </tr>
                            <tr>
                                <td><asp:FileUpload ID="fileUploadControl" runat="server" CssClass ="btn btn-primary" ToolTip="Use this to upload a picture of the room" Enabled="True" Visible="False" /></td>
                                <td>
                                    
                                </td>
                                <td></td>
                            </tr>
                        </table>
                        </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Room Details:</td>
                    <td>
                        <table class="table-spacing">
                            <tr>
                                <td><asp:CheckBox ID="cbWifi" runat="server" Text="Wifi" /></td>
                                <td><asp:CheckBox ID="cbAircon" runat="server" Text="Air Conditioner" /></td>
                                <td><asp:CheckBox ID="cbRoomservice" runat="server" Text="Room Service" /></td>
                                <td><asp:CheckBox ID="cbTelevision" runat="server" Text="Television" /></td>
                            </tr>
                        </table></td>
                </tr>
                <tr>
                    <td>Room Type:</td>
                    <td>
                        <asp:DropDownList ID="dlRoomType" runat="server" CssClass="btn btn-default form-control"></asp:DropDownList></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Status:</td>
                    <td>
                        <asp:DropDownList ID="dlStatus" runat="server" CssClass="form-control">
                            <asp:ListItem>Enabled</asp:ListItem>
                            <asp:ListItem>Disabled</asp:ListItem>
                        </asp:DropDownList></td>
                    <td></td>
                </tr></thead>
            </table>

            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" ToolTip="Save the changes you have made to this room" OnClick="btnSave_Click"/>
            <button type="reset" class="btn btn-warning cancel" id="resetData">
                <i class="glyphicon glyphicon-ban-circle"></i>
                <span>Reset Data</span>
            </button>
            <asp:Button ID="btnRoomList" runat="server" Text=" Back to Room List"  CssClass="btn btn-warning" OnClick="btnRoomList_Click" CausesValidation="False" OnClientClick="document.getElementById('removeFile').click();" /><br /><br />
            
            <asp:Label ID="lblProgress" runat="server" Text="" CssClass="label label-warning"></asp:Label><br /><br />
            <asp:Label ID="lblRedirect" runat="server" Text="" CssClass="label label-info"></asp:Label>
        </div>
    </div>
</asp:Content>
