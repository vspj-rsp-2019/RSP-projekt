<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NovyTicket.aspx.cs" Inherits="NovyTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 310px;
            margin-left: 7px;
            text-align: right;
        }
        .auto-style2 {
            width: 310px;
            text-align: left;
        }
        </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <div style="margin-left:7px"><br />
    Název Ticketu<br />
    <asp:TextBox ID="TB_title" runat="server" Width="516px"></asp:TextBox>
    <br /><br />
    Text Ticketu<br />
    <asp:TextBox ID="TB_textTicket" runat="server" Height="202px" TextMode="MultiLine" Width="930"></asp:TextBox>
        </div>
    <br />
    <table style="margin:auto">
        <tr>
            <td class="auto-style1"><asp:Label ID="lb_error" runat="server" ForeColor="Red"></asp:Label></td>
            <td class="auto-style2">
                <asp:DropDownList ID="DDL_cil" runat="server">
                    <asp:ListItem>Redaktor</asp:ListItem>
                    <asp:ListItem>Recenzent</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                </asp:DropDownList>
                <asp:Button ID="BTN_odeslat" runat="server" OnClick="BTN_odeslat_Click" Text="Odeslat" />
                <asp:Button ID="BT_zpet" runat="server" OnClick="BT_zpet_Click" Text="Zpět" />
            </td>
            <td class="auto-style1"></td>
        </tr>
    </table>
</asp:Content>

