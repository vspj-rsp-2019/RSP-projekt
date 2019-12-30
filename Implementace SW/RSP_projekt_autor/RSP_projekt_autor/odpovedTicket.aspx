<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="odpovedTicket.aspx.cs" Inherits="odpovedTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        Nezodpovězené tickety</p>
    <p>
        <asp:ListBox ID="LB_ticket" runat="server" Height="166px" OnSelectedIndexChanged="LB_ticket_SelectedIndexChanged" Width="153px"></asp:ListBox>
        <asp:Label ID="Label4" runat="server" style="z-index: 1; left: 264px; top: 220px; position: absolute; height: 25px" Text="Autor Ticketu"></asp:Label>
        <asp:TextBox ID="TB_autor" runat="server" ReadOnly="True" style="z-index: 1; left: 371px; top: 226px; position: absolute"></asp:TextBox>
        <asp:TextBox ID="TB_odp" runat="server" style="z-index: 1; left: 649px; top: 290px; position: absolute; height: 86px; width: 361px" TextMode="MultiLine"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 260px; top: 255px; position: absolute; height: 17px" Text="Text Ticketu"></asp:Label>
        <asp:Label ID="Label3" runat="server" style="z-index: 1; left: 651px; top: 262px; position: absolute" Text="Odpověď"></asp:Label>
        <asp:TextBox ID="TB_text" runat="server" ReadOnly="True" style="z-index: 1; left: 255px; top: 285px; position: absolute; height: 98px; width: 373px" TextMode="MultiLine"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="BT_select" runat="server" OnClick="BT_select_Click" Text="Vybrat" />
        <asp:Button ID="BT_reply" runat="server" style="z-index: 1; left: 916px; top: 390px; position: absolute; right: 111px" Text="Odpovědět" OnClick="BT_reply_Click" />
        <asp:Label ID="LB_msg" runat="server" style="z-index: 1; left: 649px; top: 337px; position: absolute" ForeColor="Red"></asp:Label>
    </p>
</asp:Content>

