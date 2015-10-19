<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="FindMember.aspx.cs" Inherits="Monkey_Business.FindMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center">
        <%--Panel for dismissable information--%>
        <div class="col-lg-12"><div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <p style="font-size: 16px">Here you can find a member by their name. You can type their name to refine the search.</p></div></div>

        <%--Panel for searching a member--%>
        <div class="col-lg-12">
            <div class="well">
                <h3>Find Member</h3>
                <div class="bs-example">
	            <ul class="nav nav-tabs" style="margin-bottom: 15px;">
		            <li class="active"><a href="#one" data-toggle="tab">Search Members</a></li>
		            <li><a href="#two" data-toggle="tab">View Help</a></li>
	            </ul>
			  
	                <div id="myTabContent" class="tab-content">
		                <div class="tab-pane fade active in" id="one">
                        <br />
            
                        <table class="table" style="width:50%; margin-left:auto; margin-right:auto;">
                            <thead>
                                <tr>
                                    <td style="width:35%;">Enter members name:</td>
                                    <td>
                                        <div class="form-group input-group">
                                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" ToolTip="Enter the name you wish to search for here." MaxLength="200"></asp:TextBox> 
                                            <span class="input-group-btn">
                                                <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-small btn-primary" OnClick="btnSearch_Click"><i class="glyphicon glyphicon-search">&nbsp;Search</i></asp:LinkButton>
                                            </span>
                                        </div>
                                    </td>
                                </tr>
                            </thead>
                            <tr>
                                <td>Select member from list:</td>
                                <td><asp:ListBox ID="lstMembers" runat="server" CssClass="form-control"></asp:ListBox></td>
                            </tr>
                        </table>
                        <asp:Button ID="btnViewProfile" runat="server" CssClass="btn btn-success" Text="View Selected Profile" OnClick="btnViewProfile_Click" />
                        <asp:Button ID="btnStaffTools" runat="server" CssClass="btn btn-warning" Text="Staff Tools" ToolTip="This will take you back to the staff tools page." OnClick="btnStaffTools_Click" /><br /><br />
                        <asp:Label ID="lblProgress" runat="server" CssClass="label label-warning"></asp:Label>

                        </div>
		                <div class="tab-pane fade text-left" id="two">
                            <br />
                            <strong>How do I use this to find a customers profile?</strong>
                            <p>You can use this page to search for profiles by first name and/or surname.</p>
                            <hr />
                            <strong>How can I finder a member that is currently booked into the hotel?</strong>
                            <p>You may view all the customers who are currently booked in on the <a href="ViewOccupants.aspx">current occupants page</a> on the <a href="StaffTools.aspx">staff tools dashboard</a>. 
                                From this page you may also access the customer’s profile.</p>
		                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
