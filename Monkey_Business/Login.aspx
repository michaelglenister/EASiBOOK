<%@ Page Title="EASiBOOK :: Login" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Monkey_Business.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function SetPlaceHolders() {
            document.getElementById('txtEmail').placeholder = "Enter Email Address";
            document.getElementById('txtPassword').placeholder = "Enter Password";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <p style="font-size: 16px">This is the login page, before you can login you need to be a registered user with a valid E-Mail and Password.
        <br /> If you aren't registered yet please visit our registration page.
        </p>
            <asp:HyperLink ID="RegisterURL" runat="server" CssClass="btn btn-danger" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
        </div>
    </div>
        
    <div class="container text-center">
        <div class="well">
            <asp:Label ID="lblSuccessfullRegistration" runat="server" Text="Your registration was successfull, you may now login!<br /><br />" ForeColor="Green" Visible="false"></asp:Label>
            <table class="register">
                <tr>
                    <td class="column1">E-Mail</td>
                    <td class="column2"><asp:TextBox ID="txtEmail" runat="server" Width="200" ClientIDMode="Static" CssClass="form-control required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                    <%--Email validators--%>
                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ErrorMessage="You are required to enter an E-Mail address" Display="Dynamic" EnableClientScript="true" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                    <<asp:RegularExpressionValidator ID="EmailValidator" ControlToValidate="txtEmail" ValidationExpression="\S+@\S+\.\S+" runat="server" ErrorMessage="Your E-Mail address is invalid" EnableClientScript="true" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td class="column1">Password</td>
                    <td class="column2"><asp:TextBox ID="txtPassword" runat="server" Width="200" TextMode="Password" ClientIDMode="Static" CssClass="form-control required-field"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" class="validatorColumn">
                        <%--Password validators--%>
                        <asp:RequiredFieldValidator ID="RequiredPasswordValidator" ControlToValidate="txtPassword" runat="server" ErrorMessage="You are required to enter a password" ForeColor="Red" EnableClientScript="true" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            <tr><td colspan="2" class="btnColumn"><asp:Button ID="btnLogin" CssClass="btn btn-success btnlogin" runat="server" Text="Login" OnClick="btnLogin_Click" /></td></tr>
            <tr><td colspan="2" class="btnColumn"><a href="ResetPassword.aspx" class="btn btn-warning">Reset Password</a></td></tr>
        </table>
        </div>
    </div>

    <script>
        SetPlaceHolders();
    </script>
</asp:Content>
