<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Navod.aspx.cs" Inherits="Navod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Návod
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            margin-left: 7px;
            margin-right: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h3 class="auto-style1"><br>Návody pro aplikaci LOGOS POLYTECHNIKOS<br></h3>
    <p class="auto-style1">
        &nbsp;<br>
        &nbsp;&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://github.com/vspj-rsp-2019/RSP-projekt/blob/master/U%C5%BEivatelsk%C3%A1%20dokumentace/Uziv_Dokumentace_Archivace_clanku.pdf">Archivace článku</asp:HyperLink><br>
        &nbsp;&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="https://github.com/vspj-rsp-2019/RSP-projekt/blob/master/U%C5%BEivatelsk%C3%A1%20dokumentace/Uziv_Dokumentace_Komunikace_s_recenzentem.pdf">Komunikace s recenzetem</asp:HyperLink><br>
        &nbsp;&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="https://github.com/vspj-rsp-2019/RSP-projekt/blob/master/U%C5%BEivatelsk%C3%A1%20dokumentace/Uziv_Dokumentace_Komunikace_s_recenzentem.pdf">Zpracování recenzních komentářů</asp:HyperLink><br>
        &nbsp;&nbsp;<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="https://github.com/vspj-rsp-2019/RSP-projekt/blob/master/U%C5%BEivatelsk%C3%A1%20dokumentace/Uziv_Dokumentace_Komunikace_s_recenzentem.pdf">Příručka pro autora</asp:HyperLink><br>
        &nbsp;&nbsp;<asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="https://github.com/vspj-rsp-2019/RSP-projekt/blob/master/U%C5%BEivatelsk%C3%A1%20dokumentace/U%C5%BEivatelsk%C3%A1%20p%C5%99%C3%ADru%C4%8Dka_Recenzent.pdf">Příručka recenzenta</asp:HyperLink><br>
        &nbsp;&nbsp;<asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="https://github.com/vspj-rsp-2019/RSP-projekt/blob/master/U%C5%BEivatelsk%C3%A1%20dokumentace/U%C5%BEivatelsk%C3%A1%20p%C5%99%C3%ADru%C4%8Dka_Redaktor.pdf">Příručka pro redaktora</asp:HyperLink><br><br>
</p>
</asp:Content>

