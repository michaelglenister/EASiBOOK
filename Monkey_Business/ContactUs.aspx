<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Monkey_Business.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3>Contact Us</h3>
            <table class="table">
                <tr>
                    <td><i class="glyphicon glyphicon-earphone">&nbsp;Phone</i></td>
                    <td>
                        <asp:Label ID="lblPhone" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td><i class="glyphicon glyphicon-envelope">&nbsp;E-Mail</i></td>
                    <td>
                        <asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td><i class="glyphicon glyphicon-globe">&nbsp;Address</i></td>
                    <td>
                        <asp:Label ID="lblAddress1" runat="server" Text="Label"></asp:Label><br />
                        <asp:Label ID="lblAddress2" runat="server" Text="Label"></asp:Label></td>
                </tr>
            </table>
            <%-- Embedded Google maps obtained from here https://www.google.com/maps/dir//-1.946684,30.061948/@-1.946684,30.061948,16z/data=!4m3!4m2!1m0!1m0?hl=en-US  --%>
            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3987.5156752782445!2d30.061947999999994!3d-1.9466839999999996!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x19dca426ee39b6ab%3A0xe70107b14b96291c!2sH%C3%B4tel+des+Milles+Collines!5e0!3m2!1sen!2sza!4v1409275067039" width="600" height="450" frameborder="0" style="border:0"></iframe>
        </div>
    </div>
</asp:Content>
