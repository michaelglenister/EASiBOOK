<%@ Page Title="EASiBOOK :: View Occupants" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ViewOccupants.aspx.cs" Inherits="Monkey_Business.ViewOccupants" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center"> 
        <div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <p style="font-size: 16px">Here you can view who is currently booked into a room.</p></div>
        <div class="well">
            <h3>View Occupants</h3>
            <div class="bs-example">
	            <ul class="nav nav-tabs" style="margin-bottom: 15px;">
		            <li class="active"><a href="#one" data-toggle="tab">Selecting Dates</a></li>
		            <li><a href="#two" data-toggle="tab">View Help</a></li>
	            </ul>
			  
	            <div id="myTabContent" class="tab-content">
		            <div class="tab-pane fade active in" id="one">
                        <asp:Label Enabled="false" Visible="false" ID="Label1" runat="server" Text="Label"></asp:Label><br />
                        <asp:TextBox Enabled="false" Visible="false" ID="TextBox1" runat="server" AutoPostBack ="true" CausesValidation="true" OnTextChanged="TextBox1_TextChanged" OnDataBinding="TextBox1_DataBinding"></asp:TextBox>
        
                        <div class="table-responsive">
                            <table class="table table-hover table-striped tablesorter align-left">
                            <thead><tr><th>BookingID <asp:Image ID="Image2" runat="server" ImageUrl="./resources/updown.png" /></th><th>Arrival Date <asp:Image ID="Image3" runat="server" ImageUrl="./resources/updown.png" /></th><th>Departure Date <asp:Image ID="Image4" runat="server" ImageUrl="./resources/updown.png" /></th><th>Occupant Name <asp:Image ID="Image5" runat="server" ImageUrl="./resources/updown.png" /></th><th>Room(s) Booked <asp:Image  ID="Image1" runat="server" ImageUrl="./resources/updown.png" /></th ><th>View Profile</th></tr></thead>
                                <asp:Literal ID="litOccupantList" runat="server"></asp:Literal>
                            </table>
                        </div>
                    </div>
		            <div class="tab-pane fade text-left" id="two">
                        <br />
                        <strong>What is the list of current occupants?</strong>
                        <p>This is a list showing the people currently occupying rooms in the hotel.</p>
                        <hr />
                        <strong>What is the list of current occupants used for?</strong>
                        <p>This list acts as a means to contact/find any customers that might need to be reached by the hotel owner or staff.</p>
                        <hr />
                        <strong>The list of current occupants doesn’t show me any contact details, how do I contact/find the occupant?</strong>
                        <p>Each occupant record in the list includes a button that will take you to that individual occupants profile page. From here the relevant contact information can be obtained.</p>
		            </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
