<%@ Page Title="EASiBOOK :: Booking History" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="Monkey_Business.BookingHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <div class="well">
            <h3>Booking history for <asp:Literal ID="litMemberName" runat="server"></asp:Literal></h3>
            <br />
            <div class="panel panel-info">
              <div class="panel-heading">
                <h3 class="panel-title">Tabel Legend</h3>
              </div>
              <div class="panel-body">

                <div class="row">
                  <div class="col-sm-3 text-center">
                    <div class="panel panel-default">
                      <div class="panel-body" style="background-color:#FF6600">
                        Provisional
                      </div>
                    </div>            
                  </div>
                  <div class="col-sm-3 text-center">
                    <div class="panel panel-default">
                      <div class="panel-body" style="background-color:#00C0FF">
                        Cancelled
                      </div>
                    </div>            
                  </div>
                  <div class="col-sm-3 text-center">
                    <div class="panel panel-default">
                      <div class="panel-body" style="background-color:#FF3300">
                        Declined
                      </div>
                    </div>            
                  </div>
                  <div class="col-sm-3 text-center">
                    <div class="panel panel-default">
                      <div class="panel-body" style="background-color:#66FF66">
                        Confirmed
                      </div>
                    </div>            
                  </div>
                </div>

              </div>
            </div>
            <br />
            <asp:Literal ID="litError" runat="server"></asp:Literal>

            <div class="table-responsive">
            <table class="table provisionalBookings">
                <thead><tr><th>Booking No <asp:Image ID="Image1" runat="server" ImageUrl="./resources/updown.png" /></th><th>Arrival <asp:Image ID="Image2" runat="server" ImageUrl="./resources/updown.png" /></th><th>Departure <asp:Image ID="Image3" runat="server" ImageUrl="./resources/updown.png" /></th><th>Status <asp:Image ID="Image4" runat="server" ImageUrl="./resources/updown.png" /></th><th>Proof of Payment <asp:Image ID="Image6" runat="server" ImageUrl="./resources/updown.png" /></th><th>Upload Proof <asp:Image ID="Image7" runat="server" ImageUrl="./resources/updown.png" /></th><th>Invoice <asp:Image ID="Image5" runat="server" ImageUrl="./resources/updown.png" /></th><th>Cancel <asp:Image ID="Image8" runat="server" ImageUrl="./resources/updown.png" /></th></tr></thead>
                <asp:Literal ID="litBookingHistory" runat="server"></asp:Literal>
            </table>
            </div>
        </div>
    </div>
</asp:Content>
