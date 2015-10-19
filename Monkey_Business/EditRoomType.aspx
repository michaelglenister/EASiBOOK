<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditRoomType.aspx.cs" Inherits="Monkey_Business.EditRoomType1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container text-center">
        <div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <p style="font-size: 16px">Any in-active room type will automatically be enabled on commiting changes.</p></div>
        <div class="well">
            <h3>Edit Room Type</h3>
            <br />
            <table class="register">
                <tr>
                    <td class ="column1">Room Type ID:</td>
                    <td class="column2"><asp:Label ID="lblTypeID" runat="server"></asp:Label></td>
                </tr>
                <tr>
                    <td class="column1">Room Type Name:</td>
                    <td class="column2"><asp:TextBox ID="txtName" runat="server" CssClass="form-control required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator Display="Dynamic" ForeColor="Red" ID="RequiredRoomTypeNameValidator" runat="server" ErrorMessage="You must enter a room type name" ControlToValidate="txtName"></asp:RequiredFieldValidator> </td>
                </tr>
                <tr>
                    <td class="column1">Room Type Capacity:</td>
                    <td class="column2">
                        <div class="form-group input-group">
                            <span class="input-group-btn">
                                <asp:LinkButton ID="btnMinusOne" runat="server" CssClass="btn btn-small btn-primary" OnClick="btnMinusOne_Click" CausesValidation="false"><i class="glyphicon glyphicon-minus"></i></asp:LinkButton>
                            </span>
                            <asp:TextBox ID="txtRoomTypeCapacity" runat="server" CssClass="form-control" Enabled="False" Text="1"></asp:TextBox>
                            <span class="input-group-btn">
                                <asp:LinkButton ID="btnPlusOne" runat="server" CssClass="btn btn-small btn-primary" OnClick="btnPlusOne_Click" CausesValidation="false"><i class="glyphicon glyphicon-plus"></i></asp:LinkButton>
                            </span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="column1">Room Type Rate:</td>
                    <td class="column2"><asp:TextBox ID="txtRate" runat="server" CssClass="form-control required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:RequiredFieldValidator ForeColor="Red" ID="RequiredRoomTypeRateValidator" runat="server" ErrorMessage="You must enter a rate for the room type" ControlToValidate="txtRate"></asp:RequiredFieldValidator></td><td><asp:Label ForeColor="Red" ID="lblRoomTypeRateIsNumberValidator" runat="server" Text ="Rate must be a number"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" class="btnColumn">
                        
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btnAddRoomType" runat ="server" Text="Save Changes" OnClick ="btnAddRoomType_Click" CssClass="btn btn-success" />
            <asp:Button ID="btnRoomTypeList" runat="server" Text="View room types" CssClass="btn btn-warning" OnClick="btnRoomTypeList_Click" ToolTip="Go back to the view room type page."/><br /><br />
                        
            <asp:Label ID="lblProgress" runat="server" Text="" CssClass="label label-warning"></asp:Label><br /><br />
            <asp:Label ID="lblRedirect" runat="server" Text="" CssClass="label label-info"></asp:Label>
        </div>
    </div>
</asp:Content>
