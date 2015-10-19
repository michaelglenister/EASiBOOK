<%@ Page Title="EASiBOOK :: Register" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Monkey_Business.Register" %>
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
            <h3>Register</h3>
            <table class="register">
                <asp:Literal ID="litInvalidEmail" runat="server"></asp:Literal>
                <%--<tr><td colspan="2"><asp:ValidationSummary ID="errorSummary" runat="server" EnableClientScript="true" ForeColor="Red" DisplayMode="List" /></td></tr>--%>
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
                    <td class="column1">Password</td>
                    <td class="column2"><asp:TextBox ID="txtPassword" runat="server" Width="200" TextMode="Password" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Password validators--%>
                        <asp:RequiredFieldValidator ID="RequiredPasswordValidator" ControlToValidate="txtPassword" runat="server" ErrorMessage="You are required to enter a password" ForeColor="Red" EnableClientScript="true" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="PasswordValidator" ControlToValidate="txtPassword" runat="server" ValidationExpression="\w{6,26}" ErrorMessage="Your password must be atleast 6 characters long" EnableClientScript="true" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">Confirm Password</td>
                    <td class="column2"><asp:TextBox ID="txtConfirmPassword" runat="server" Width="200" TextMode="Password" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Confirm password validators--%>
                        <asp:RequiredFieldValidator ID="RequiredConfirmPasswordValidator" ControlToValidate="txtConfirmPassword" runat="server" ErrorMessage="You are required to enter your password again" EnableClientScript="true" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="ComparePasswordValidator" runat="server" ErrorMessage="Your passwords do not match!" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" EnableClientScript="true" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
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

                <%--<tr>
                    <td class="column1">City</td>
                    <td class="column2"><asp:TextBox ID="txtCity" runat="server" Width="200" ClientIDMode="Static" CssClass="required-field"></asp:TextBox></td>
                </tr>
                --%>

                <%--Start of editing--%>
                <tr>
                    <td class="column1">City</td>
                    <td class ="column2"><asp:DropDownList Width="200" ID="cmbCity" runat="server" CssClass="required-field" OnSelectedIndexChanged="cmbCity_SelectedIndexChanged" AutoPostBack ="true" AppendDataBoundItems="true"></asp:DropDownList> <asp:RadioButton GroupName ="CitySuburb" AutoPostBack="true" ID="rdoOtherCity" runat="server" Text="Other" OnCheckedChanged="rdoOtherCity_CheckedChanged" /></td>
                    <td class="column2"><asp:TextBox Width="200" CssClass="required-field" ID="txtCity" runat="server" ClientIDMode="Static"></asp:TextBox> </td>
                </tr>
                <tr>
                    <td class="validatorColumn" colspan="2">
                        <asp:RequiredFieldValidator ID="RequiredCityValidator" runat="server" ErrorMessage="You are required to enter your city" ControlToValidate="txtCity" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>                    
                </tr>
                
                <tr>
                    <td class="column1">Suburb</td>
                    <td class="column2"><asp:DropDownList Width="200" CssClass="required-field" ID="cmbSuburb" runat="server" AutoPostBack="true" OnTextChanged="cmbSuburb_TextChanged"></asp:DropDownList> <asp:RadioButton GroupName="CitySuburb" AutoPostBack="true" ID="rdoBack" runat="server" Text="Back" OnCheckedChanged="rdoBack_CheckedChanged" /></td>
                    <td class="column2"><asp:TextBox Width="200" CssClass="required-field" ID="txtSuburb" runat="server" ClientIDMode="Static"></asp:TextBox> </td>
                </tr>                

                <tr>
                    <td colspan="2" class="validatorColumn">
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
                    <td class="column1">Phone Number</td>
                    <td class="column2"><asp:TextBox ID="txtPhoneNo" runat="server" Width="200" ClientIDMode="Static" CssClass="required-field" MaxLength="20"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Phone Number Validator--%>
                        <asp:RequiredFieldValidator ID="RequiredPhoneNoValidator" runat="server" ErrorMessage="You are required to enter your phone number" ControlToValidate="txtPhoneNo" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="PhoneIsNumberValidator" ForeColor ="Red" runat="server" Visible="false">Invalid phone number</asp:Label>
                    </td>
                    
                </tr>

                <tr>
                    <td colspan="2" class="btnColumn"><asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-danger" OnClick="btnRegister_Click" /></td>
                </tr>
            </table>
        </div>
    </div>
    <script>
        SetPlaceHolders();
    </script>

    <%--Validators starts here--%>
    <%--Email validators--%>
    <%--<asp:RequiredFieldValidator ID="RequiredEmailValidator" runat="server" ErrorMessage="You are required to enter an E-Mail address" Display="None" EnableClientScript="true" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>--%>
    <%--<asp:RegularExpressionValidator ID="RegExEmailValidator" ControlToValidate="txtEmail" ValidationExpression="\S+@\S+\.\S+" runat="server" ErrorMessage="Your E-Mail address is invalid" EnableClientScript="true" Display="None"></asp:RegularExpressionValidator>--%>

    <%--Password validators--%>
    <%--<asp:RequiredFieldValidator ID="RequiredPasswordValidator" ControlToValidate="txtPassword" runat="server" ErrorMessage="You are required to enter a password" ForeColor="Red" EnableClientScript="true" Display="None"></asp:RequiredFieldValidator>--%>
    <%--<asp:RegularExpressionValidator ID="PasswordValidator" ControlToValidate="txtPassword" runat="server" ValidationExpression="\w{6,26}" ErrorMessage="Your password must be atleast 6 characters long" EnableClientScript="true" Display="None"></asp:RegularExpressionValidator>--%>

    <%--Confirm password validators--%>
    <%--<asp:RequiredFieldValidator ID="RequiredConfirmPasswordValidator" ControlToValidate="txtConfirmPassword" runat="server" ErrorMessage="You are required to enter your password again" EnableClientScript="true" Display="None"></asp:RequiredFieldValidator>--%>
    <%--<asp:CompareValidator ID="ComparePasswordValidator" runat="server" ErrorMessage="Your passwords do not match!" ControlToValidate="txtConfirmPassword" ControlToCompare="txtPassword" EnableClientScript="true" Display="None"></asp:CompareValidator>--%>

    <%--First name validator--%>
    <%--<asp:RequiredFieldValidator ID="RequiredFirstNameValidator" runat="server" ErrorMessage="You are required to enter your first name" ControlToValidate="txtFirstName" Display="None"></asp:RequiredFieldValidator>--%>

    <%--Surname validator--%>
    <%--<asp:RequiredFieldValidator ID="RequriredSurnameValidator" runat="server" ErrorMessage="You are required to enter your surname" ControlToValidate="txtSurname" Display="None"></asp:RequiredFieldValidator>--%>

    <%--Address Line 1 validator--%>
    <%--<asp:RequiredFieldValidator ID="RequiredAddressLine1Validator" runat="server" ErrorMessage="You are required to enter address line 1" ControlToValidate="txtAddressLine1" Display="None"></asp:RequiredFieldValidator>--%>

    <%--Suburb validator--%>
    <%--<asp:RequiredFieldValidator ID="RequiredSuburbValidator" runat="server" ErrorMessage="You are required to enter your suburb" ControlToValidate="txtSuburb" Display="None"></asp:RequiredFieldValidator>--%>

    <%--Postal Code validator--%>
    <%--<asp:RequiredFieldValidator ID="RequiredPostalCodeValidator" runat="server" ErrorMessage="You are required to enter your postal code" ControlToValidate="txtPostalCode" Display="None"></asp:RequiredFieldValidator>--%>

    <%--City Validator--%>
    <%--<asp:RequiredFieldValidator ID="RequiredCityValidator" runat="server" ErrorMessage="You are required to enter your city" ControlToValidate="txtCity" Display="None"></asp:RequiredFieldValidator>--%>

    <%--Phone Number Validator--%>
    <%--<asp:RequiredFieldValidator ID="RequiredPhoneNoValidator" runat="server" ErrorMessage="You are required to enter your phone number" ControlToValidate="txtPhoneNo" Display="None"></asp:RequiredFieldValidator>--%>

    <%--Validators ends here--%>
</asp:Content>
