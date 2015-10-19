<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Monkey_Business.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <div class="panel panel-primary">
              <div class="panel-heading">
                <h2>Welcome to the <asp:Label ID="lblBusinessName" runat="server" Text="Label"></asp:Label> website</h2>
              </div>
              <div class="panel-body">
                  <div class="col-lg-6">
                      <br />
                      <asp:Image ID="imgLogo" runat="server" ImageUrl="resources/logo.jpg" />
                      <br /><br /><br />
                      Welcome to our hotel!<br />
                      This is an online reservation system where you can book a room that you would like to stay in.<br />
                      <br />
                      Our rooms have got a couple of features such as WiFi, Air Conditioning, Television and Room service.<br />
                      <br />
                      Once you make a booking it will be provisional at first, you will first need to pay the deposit amount
                      and upload the proof of payment before your booking will become confirmed. <br />
                      <br />
                      Our banking details can be found on the invoice.
                  </div>
                  <div class="col-lg-6">
                      <asp:ScriptManager ID="smRotator" runat="server" />
                        <asp:Timer ID="timerRotator" Interval="2000" runat="server" />
                        <asp:UpdatePanel ID="upRotator" runat="server">
                            <Triggers><asp:AsyncPostBackTrigger ControlID="timerRotator" EventName="Tick" /></Triggers>
                            <ContentTemplate>
                                <asp:AdRotator id="arBusinessImages" AdvertisementFile="~/resources/rotator.xml" Runat="server" Height="400px" Width="100%" />
                            </ContentTemplate>
                        </asp:UpdatePanel>  
                  </div>
              </div>
            </div>
        </div>
        
        <asp:Image ID="imgMadeWith" runat="server" ImageUrl="~/resources/madewith.png" Height="50px" ImageAlign="Right" />
    </div>
</asp:Content>
