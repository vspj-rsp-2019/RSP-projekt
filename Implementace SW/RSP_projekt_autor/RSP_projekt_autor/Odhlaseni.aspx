<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Odhlaseni.aspx.cs" Inherits="Odhlaseni" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Odlášení</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 362px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <br /><br />
    <table style="margin:auto">
        <tr>
            <td>
                <asp:Button ID="btn_odhlaseni" runat="server" Text="Odhlásit se" OnClick="btn_odhlaseni_Click" Width="155px" Font-Bold="True" />
            </td>
        </tr>
    </table>
    <asp:Literal ID="PopupBox" runat="server"></asp:Literal>
</asp:Content>

