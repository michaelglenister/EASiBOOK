<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ProofUploader.aspx.cs" Inherits="Monkey_Business.ProofUploader" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="jumbotron text-center alert-info alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <p style="font-size: 16px">
            Your booking will only be confirmed once you have provided proof of payment of the deposit.<br />
            You can do this by taking a picture or scanning the proof of payment and uploading it here.<br />
        </p>
        </div>
    </div>

    <div class="container text-center">
        <div class="well">
        <h3 style="color:green;">Upload proof of payment</h3>
            <p>
                The deposit is <asp:Label ID="lblDepositPercent" runat="server" Text="Label"></asp:Label> percent of your total charge of which the balance must be paid upon check in.<br />
                If you are having trouble with the upload simply e-mail your proof of payment to <asp:Label ID="lblBusinessEmail" runat="server" Text="Label"></asp:Label> along with your booking ID
            </p>

            <br />

            <asp:FileUpload ID="fileUploadControl" runat="server" CssClass ="btn btn-primary" ToolTip="Use this to upload proof of payment for your booking" />

            <asp:Button ID="btnSave" runat="server" Text="Save Now" OnClick="btnSave_Click" /><br />

            <asp:Label ID="lblProgress" runat="server" Text="" CssClass="label label-danger"></asp:Label>
        </div>
    </div>
</asp:Content>
