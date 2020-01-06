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
    <asp:ListBox ID="LB_ticket" runat="server" Height="126px" Width="120px"></asp:ListBox>
    </strong>

    &nbsp;<asp:Button ID="BT_zobrazit" runat="server" OnClick="BT_zobrazit_Click" Text="Zobrazit" />
    &nbsp;<asp:Button ID="BT_delete" runat="server" OnClick="BT_delete_Click" Text="Smazat" />
&nbsp;<asp:Label ID="LB_msg0" runat="server" ForeColor="Red"></asp:Label>
    <br />
&nbsp;&nbsp;&nbsp; Text ticketu<br />
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TB_text" runat="server" Height="70px" ReadOnly="True" TextMode="MultiLine" Width="900px"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp; Odpověď<br />
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TB_reply" runat="server" Height="68px" ReadOnly="True" TextMode="MultiLine" Width="900px"></asp:TextBox>
</asp:Content>

