<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CheckLogin.aspx.cs" Inherits="Monkey_Business.CheckLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3>You are currently not logged in</h3>
            <p>Before you can continue with the booking process you need to login to the system. <br />If you are a new customer click the "New Customer" button and it will redirect you to our registration page. <br />If you are an existing customer please click on "Existing Customer" and you will be redirected to the login page.</p>
            
            <br />
            <div class="table-responsive">
            <table style="margin-left:auto;margin-right:auto;">
                <tr><td><asp:HyperLink ID="registrationPageURL" runat="server" NavigateUrl="~/Register.aspx" CssClass="btnNewCustomer btn btn-success">New Customer</asp:HyperLink></td></tr>
                <tr><td><br /><asp:HyperLink ID="loginPageURL" runat="server" NavigateUrl="~/Login.aspx" CssClass="btnExistingCustomer btn btn-info">Existing Customer</asp:HyperLink></td></tr>
            </table>
            </div>
        </div>
    </div>
</asp:Content>
