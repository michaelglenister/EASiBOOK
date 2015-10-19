<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Monkey_Business.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <%--Panel for dismissable information--%>
        <div class="col-lg-12"><div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <p style="font-size: 16px">Enter you email to reset your password. A new password will be sent to you.</p></div></div>

        <%--Panel for searching a member--%>
        <div class="col-lg-12">
            <div class="well">
                <h3>Reset your password</h3>
                <br /><br />
            
                <table class="table" style="width:50%; margin-left:auto; margin-right:auto;">
                    <tr>
                        <td style="width:35%;">Enter email:</td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control required-field" MaxLength="200" ToolTip="Enter your email address here."></asp:TextBox></td>
                        <td><%--Required vaildator--%>
                            <asp:RequiredFieldValidator ID="validEmailRequired" runat="server" ErrorMessage="Required*" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                            <%--Email vaildator--%>
                            <asp:RegularExpressionValidator ID="validEmailRegex" runat="server" ErrorMessage="RegEx*" ControlToValidate="txtEmail" ValidationExpression="\S+@\S+\.\S+"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><br /><asp:Button ID="btnResetPassword" runat="server" CssClass="btn btn-success" Text="Reset Password" OnClick="btnResetPassword_Click" /><br /><br />
                            <asp:Label ID="lblProgress" runat="server" Text="" CssClass="label label-warning"></asp:Label><br /><br />
                            <asp:Label ID="lblRedirect" runat="server" Text="" CssClass="label label-info"></asp:Label></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
