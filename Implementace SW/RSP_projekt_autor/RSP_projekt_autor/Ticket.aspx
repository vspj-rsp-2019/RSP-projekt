<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Ticket.aspx.cs" Inherits="Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <asp:Button ID="BT_novyTicket" runat="server" OnClick="BT_novyTicket_Click" Text="Nový Ticket" />
    <br />
    <br />
    <strong>Moje Tickety<br />
    </strong>
    <asp:ListView ID="LV_tickets" runat="server">
    </asp:ListView>
    <br />
</asp:Content>

