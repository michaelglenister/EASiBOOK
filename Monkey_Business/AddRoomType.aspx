<%@ Page Title="EASiBOOK :: Add a Room Type" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AddRoomType.aspx.cs" Inherits="Monkey_Business.AddRoomType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
            function SetPlaceHolders() {
                document.getElementById('txtRoomTypeName').placeholder = "Enter room type name";
                document.getElementById('txtRatePerNight').placeholder = "Enter rate";
            }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container text-center">
        <div class="well">
            <h3>Add a Room Type</h3>
    <table class="register">
        <tr>
            <td class ="column1">Enter a name for the room type:</td> 
            <td class ="column2">
                <asp:TextBox ID="txtRoomTypeName" runat="server" Width="200px" CssClass="required-field form-control" ClientIDMode="Static" ></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td colspan="2" class="validatorColumn">
                <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredRoomTypeNameValidator" runat="server" ErrorMessage="You are required to enter a room type name" ControlToValidate="txtRoomTypeName" ></asp:RequiredFieldValidator>
                <asp:Label ID="DuplicateNameValidator" Visible ="false" ForeColor ="Red" runat="server" Text="Room type name already in use"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class ="column1">Enter a capacity for the room type:</td>
            <td class="column2">
                <div class="form-group input-group">
                    <span class="input-group-btn">
                        <asp:LinkButton ID="btnMinusOne" runat="server" Text="-1" CssClass="btn btn-small btn-primary" OnClick="btnMinusOne_Click" CausesValidation="false"><i class="glyphicon glyphicon-minus"></i></asp:LinkButton>
                    </span>
                    <asp:TextBox ID="txtRoomTypeCapacity" runat="server" CssClass="form-control" Enabled="False" Text="1"></asp:TextBox>
                    <span class="input-group-btn">
                        <asp:LinkButton ID="btnPlusOne" runat="server" Text="+1" CssClass="btn btn-small btn-primary" OnClick="btnPlusOne_Click" CausesValidation="false"><i class="glyphicon glyphicon-plus"></i></asp:LinkButton>
                    </span>
                </div>
            </td>
        </tr>

        <tr>
            <td colspan="2" class="validatorColumn">
                <asp:RequiredFieldValidator ForeColor="Red" Display="Dynamic" ID="RequiredCapacityValidator" runat="server" ErrorMessage="You are required to enter a room capacity" ControlToValidate="txtRoomTypeCapacity"></asp:RequiredFieldValidator>
            </td>
        </tr>
        
        
        <tr>
            <td class ="column1">Enter a rate for the room type:</td> 
            <td class ="column2">
                <asp:TextBox ID="txtRatePerNight" runat="server" Width="200px" CssClass="required-field form-control" ClientIDMode="Static" ></asp:TextBox><br />                
            </td>
        </tr>
        <tr>
            <td colspan ="2" class="validatorColumn">
                <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredRateValidator" runat="server" ErrorMessage="You must enter a rate for a room type" Display="Dynamic" ControlToValidate="txtRatePerNight"></asp:RequiredFieldValidator>
                <asp:Label ForeColor="Red" ID="lblRoomTypeRateIsNumberValidator" runat="server" Text="Rate must be a number"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan ="2" class="btnColumn"><br /><asp:Button CssClass="btn btn-success" ID="btnAddRoomType" runat="server" OnClick="btnAddRoomType_Click" Text="Add Room Type" />
                <asp:Button ID="btnRoomTypeList" runat="server" Text="View room types" CssClass="btn btn-warning" OnClick="btnRoomTypeList_Click" ToolTip="Go back to the view room type page." CausesValidation="False"/></td>
        </tr>
    </table>       
    </div>
         </div>

    <script>
        SetPlaceHolders();
    </script>
  </asp:Content>
