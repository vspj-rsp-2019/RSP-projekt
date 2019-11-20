<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChybaOpravneni.aspx.cs" Inherits="ChybaOpravneni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Chyba oprávnění
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">

    <h1 class="auto-style1">Došlo k chybě!</h1>
    <div class="auto-style1">
    Pro zobrazení této stránky nemáta příslušná oprávnění.
    <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Zpět na hlavní stránku" OnClick="Button1_Click" />
    </div>


</asp:Content>

