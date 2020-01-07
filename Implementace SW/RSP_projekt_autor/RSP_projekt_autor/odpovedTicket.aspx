<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="odpovedTicket.aspx.cs" Inherits="odpovedTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <br /><br /><br />
    <h4 style="text-align:center"> Nezodpovězené tickety </h4>
    <div>
        <div style="position:relative; top:6em; left:11em;  width:100px; ">
            <asp:Label ID="lb_autor" runat="server" Text="Autor ticketu"></asp:Label>
        </div>
        <div style="position:relative; top:6em; left:11em; width:200px;">
             <asp:TextBox ID="TB_autor" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
        </div>
    </div>
    <div>
        <asp:ListBox ID="LB_ticket" runat="server" Height="200px" OnSelectedIndexChanged="LB_ticket_SelectedIndexChanged" Width="153px"></asp:ListBox>
        <div style="position:relative; left:180px; top:-70px;">
                <asp:TextBox ID="TB_text" runat="server" TextMode="MultiLine" Height="60px" Width="380px" ReadOnly="True"></asp:TextBox>
                <asp:TextBox ID="TB_odp" runat="server" TextMode="MultiLine" Height="60px" Width="380px"></asp:TextBox>      
        </div>
    </div>
    <div style="position:relative; top:-160px; left:180px;">
            <asp:Label ID="lb_text" runat="server" Text="Text ticketu"></asp:Label>
            <div style="position:relative; left:390px; top:-20px;">
                <asp:Label ID="lb_odpov" runat="server" Text="Odpověď"></asp:Label>
            </div>
    </div>
    <div style="position:relative; top:-100px;">
            <asp:Button ID="BT_select" runat="server" OnClick="BT_select_Click" Text="Vybrat" />
            <asp:Label ID="LB_msg0" runat="server" ForeColor="Red"></asp:Label>
            <div style="position:relative; left:750px; top:-25px;">
                <asp:Button ID="BT_reply" runat="server" OnClick="BT_reply_Click" Text="Odpovědět" /><br />
                <asp:Label ID="LB_msg" runat="server" ForeColor="Red"></asp:Label>
            </div>
    </div>
    <br />
</asp:Content>

