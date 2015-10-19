<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="EditBusinessDetails.aspx.cs" Inherits="Monkey_Business.EditBusinessDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <table class="table table-hover tablesorter">
                <tr>
                    <td><strong>Business Name:</strong></td>
                    <td><asp:TextBox ID="txtName" runat="server" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">                    
                        <asp:RequiredFieldValidator ID="NameRequired" runat="server" ErrorMessage="You are required to enter a Business Name" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td><strong>Phone Number:</strong></td>
                    <td><asp:TextBox ID="txtPhone" runat="server" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">                    
                        <asp:RequiredFieldValidator ID="PhoneNoRequired" runat="server" ErrorMessage="You are required to enter a phone number" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtPhone" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td><strong>E-mail:</strong></td>
                    <td><asp:TextBox ID="txtEmail" runat="server" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">                    
                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ErrorMessage="You are required to enter an E-Mail address" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="EmailValidator" ControlToValidate="txtEmail" ValidationExpression="\S+@\S+\.\S+" runat="server" ErrorMessage="Your E-Mail address is invalid" EnableClientScript="true" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>E-mail Server:</strong></td>
                    <td><asp:TextBox ID="txtServer" runat="server" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">                    
                        <asp:RequiredFieldValidator ID="EmailServerRequired" runat="server" ErrorMessage="You are required to enter an e-mail server" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtServer" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>E-mail Port:</strong></td>
                    <td><asp:TextBox ID="txtPort" runat="server" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">                    
                        <asp:RequiredFieldValidator ID="EmailPortRequired" runat="server" ErrorMessage="You are required to enter an e-mail port" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtPort" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>E-mail Password:</strong></td>
                    <td><asp:TextBox MaxLength="50" ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
                
                <tr>
                    <td><strong>Address Line 1:</strong></td>
                    <td><asp:TextBox ID="txtAddressLine1" runat="server" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">                    
                        <asp:RequiredFieldValidator ID="AddressRequired" runat="server" ErrorMessage="You are required to enter an address" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtAddressLine1" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>Address Line 2:</strong></td>
                    <td><asp:TextBox ID="txtAddressLine2" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td><strong>Deposit Percentage:</strong></td>
                    <td><asp:TextBox ID="txtPercentage" runat="server" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td class="validatorColumn">                    
                        <asp:RequiredFieldValidator ID="PercentageRequired" runat="server" ErrorMessage="You are required to enter a deposit percentage" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtPercentage" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:Label ForeColor="Red" ID="lblPercentageIsNumberValidator" runat="server" Text ="Rate must be a number"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td><strong>Bank Name:</strong></td>
                    <td><asp:TextBox ID="txtBankName" runat="server" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">                    
                        <asp:RequiredFieldValidator ID="BankNameRequired" runat="server" ErrorMessage="You are required to enter a bank name" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtBankName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>Bank Account Number:</strong></td>
                    <td><asp:TextBox ID="txtAccountNo" runat="server" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">                    
                        <asp:RequiredFieldValidator ID="AccountNoRequired" runat="server" ErrorMessage="You are required to enter a bank account number" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtAccountNo" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td><strong>Branch Code:</strong></td>
                    <td><asp:TextBox ID="txtBranchCode" runat="server" CssClass="required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">                    
                        <asp:RequiredFieldValidator ID="BranchCodeRequired" runat="server" ErrorMessage="You are required to enter a branch code" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtBranchCode" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr><td colspan="2"><asp:Button ID="btnEdit" runat="server" CssClass="btn-success" Text="Edit" Width="51px" OnClick="btnEdit_Click" /></td></tr>
            </table>
            <asp:HiddenField ID="hiddenPassword" runat="server" />
        </div>
    </div>
</asp:Content>
