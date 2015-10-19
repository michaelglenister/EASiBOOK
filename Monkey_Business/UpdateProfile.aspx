<%@ Page Title="EASiBOOK :: Update Profile Information" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="Monkey_Business.UpdateProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script>
            function SetPlaceHolders() {
                document.getElementById('txtEmail').placeholder = "Enter Email Address";
                document.getElementById('txtPassword').placeholder = "Enter Password";
                document.getElementById('txtConfirmPassword').placeholder = "Re-Enter Password";
                document.getElementById('txtFirstName').placeholder = "Enter First Name";
                document.getElementById('txtSurname').placeholder = "Enter Surname";
                document.getElementById('txtAddressLine1').placeholder = "Enter Address Line 1";
                document.getElementById('txtAddressLine2').placeholder = "Enter Address Line 2";
                document.getElementById('txtSuburb').placeholder = "Enter Suburb";
                document.getElementById('txtPostalCode').placeholder = "Enter Postal Code";
                document.getElementById('txtCity').placeholder = "Enter City";
                document.getElementById('txtPhoneNo').placeholder = "Enter Phone Number";
            }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container text-center">
        <div class="well">
            <h3>Update Profile Details</h3>
            <table class="register">
                <tr>
                    <td class="column1">E-Mail</td>
                    <td class="column2"><asp:TextBox ID="txtEmail" runat="server" Width="200" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                    <%--Email validators--%>
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ErrorMessage="You are required to enter an E-Mail address" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="EmailValidator" ControlToValidate="txtEmail" ValidationExpression="\S+@\S+\.\S+" runat="server" ErrorMessage="Your E-Mail address is invalid" EnableClientScript="true" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">First Name</td>
                    <td class="column2"><asp:TextBox ID="txtFirstName" runat="server" Width="200" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--First name validator--%>
                        <asp:RequiredFieldValidator ID="RequiredFirstNameValidator" runat="server" ErrorMessage="You are required to enter your first name" ControlToValidate="txtFirstName" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">Surname</td>
                    <td class="column2"><asp:TextBox ID="txtSurname" runat="server" Width="200" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Surname validator--%>
                        <asp:RequiredFieldValidator ID="RequriredSurnameValidator" runat="server" ErrorMessage="You are required to enter your surname" ControlToValidate="txtSurname" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">Address Line 1</td>
                    <td class="column2"><asp:TextBox ID="txtAddressLine1" runat="server" Width="200" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Address Line 1 validator--%>
                        <asp:RequiredFieldValidator ID="RequiredAddressLine1Validator" runat="server" ErrorMessage="You are required to enter address line 1" ControlToValidate="txtAddressLine1" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">Address Line 2 &nbsp;</td>
                    <td class="column2"><asp:TextBox ID="txtAddressLine2" runat="server" Width="200" ClientIDMode="Static"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                    </td>
                </tr>

                <tr>
                    <td class="column1">Suburb</td>
                    <td class="column2"><asp:TextBox ID="txtSuburb" runat="server" Width="200" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Suburb validator--%>
                        <asp:RequiredFieldValidator ID="RequiredSuburbValidator" runat="server" ErrorMessage="You are required to enter your suburb" ControlToValidate="txtSuburb" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">Postal Code</td>
                    <td class="column2"><asp:TextBox ID="txtPostalCode" runat="server" Width="200" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Postal Code validator--%>
                        <asp:RequiredFieldValidator ID="RequiredPostalCodeValidator" runat="server" ErrorMessage="You are required to enter your postal code" ControlToValidate="txtPostalCode" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">City</td>
                    <td class="column2"><asp:TextBox ID="txtCity" runat="server" Width="200" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--City Validator--%>
                        <asp:RequiredFieldValidator ID="RequiredCityValidator" runat="server" ErrorMessage="You are required to enter your city" ControlToValidate="txtCity" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">Phone Number</td>
                    <td class="column2"><asp:TextBox ID="txtPhoneNo" runat="server" Width="200" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Phone Number Validator--%>
                        <asp:RequiredFieldValidator ID="RequiredPhoneNoValidator" runat="server" ErrorMessage="You are required to enter your phone number" ControlToValidate="txtPhoneNo" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">Role</td>
                    <td class="column2">
                        <asp:DropDownList ID="ddlRole" runat="server" Enabled="false">
                            <asp:ListItem Value="1">Customer</asp:ListItem>
                            <asp:ListItem Value="2">Booking Admin</asp:ListItem>
                            <asp:ListItem Value="3">Owner</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        &nbsp;
                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="font-weight:bold;">
                        Change Password
                    </td>
                </tr>

                <tr>
                    <td class="column1">New Password</td>
                    <td class="column2"><asp:TextBox ID="txtPassword" runat="server" Width="200" TextMode="Password" ClientIDMode="Static"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Password validators--%>
                        <asp:RegularExpressionValidator ID="PasswordValidator" ControlToValidate="txtPassword" runat="server" ValidationExpression="\w{6,26}" ErrorMessage="Your password must be atleast 6 characters long" EnableClientScript="true" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">Confirm Password</td>
                    <td class="column2"><asp:TextBox ID="txtConfirmPassword" runat="server" Width="200" TextMode="Password" ClientIDMode="Static"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Confirm password validators--%>
                        <asp:CompareValidator ID="ComparePasswordValidator" runat="server" ErrorMessage="Your passwords do not match!" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" EnableClientScript="true" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" class="btnColumn"><asp:Button ID="btnUpdateProfile" runat="server" Text="Update Profile" CssClass="btn btn-danger" OnClick="btnUpdateProfile_Click" /></td>
                </tr>
            </table>
            <br />
            
        </div>
    </div>

    <script>
        SetPlaceHolders();
    </script>
</asp:Content>
