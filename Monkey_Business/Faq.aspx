<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Faq.aspx.cs" Inherits="Monkey_Business.Faq" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="well">
            <h2 class="text-center">Frequently asked questions</h2>
            <br />
  
            <!-- customer faq -->
            <div class="panel panel-success">
                <div class="panel-heading text-center"><h4>Technical Help</h4></div>
                <div class="panel-footer">
                    <strong>What is EASiBOOK?</strong>
                    <p>EASiBOOK is a hotel room booking web application.</p>
                    <hr />
                    <strong>How does the billing/deposit system work?</strong>
                    <p>You are required to pay <asp:Label ID="lblDeposit" runat="server" Text=""></asp:Label>% of your total bill to confirm your booking and then the other <asp:Label ID="lblOwed" runat="server" Text=""></asp:Label>% when you arrive at the hotel to check in.</p>
                    <hr />
                    <strong>Why can't I log in?</strong>
                    <p>You need to first <a href="Register.aspx">register</a> before you can log in. If you have already registered go <a href="ResetPassword.aspx">here</a> to reset you password.</p>
                    <hr />
                    <strong>How do I cancel my booking?</strong>
                    <p>You can see you bookings by choosing "view my bookings" on the dashboard.</p>
                    <hr />
                    <strong>How do I change my booking?</strong>
                    <p>You will have to cancel the current booking and make a new one. Remember availability of rooms is not guaranteed.</p>
                    <hr />
                    <strong>What is check in/check out time?</strong>
                    <p>Our check in time out is at 10:00 and check in is 14:00.</p>
                </div>
            </div>
            <div class="panel panel-success">
                <div class="panel-heading text-center"><h4>Hotel Info</h4></div>
                <div class="panel-footer">
                    <strong>Do you have a pool?</strong>
                    <p>Yes, two!</p>
                    <hr />
                    <strong>How do I get to the hotel?</strong>
                    <p>You can get directions on Google Maps registered trademark, <a href="https://www.google.com/maps/place/H%C3%B4tel+des+Milles+Collines/@-1.946684,30.061948,16z/data=!4m2!3m1!1s0x0:0xe70107b14b96291c?hl=en-US">here</a></p>
                    <hr />
                    <strong>Are pets allowed?</strong>
                    <p>Yes, dogs and cats are allowed. As long as they around knee height or less.</p>
                    <hr />
                    <strong>Do you offer shuttle services?</strong>
                    <p>Regrettably no.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
