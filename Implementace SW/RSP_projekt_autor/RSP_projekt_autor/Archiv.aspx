<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Archiv.aspx.cs" Inherits="Archiv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Archiv
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
    <h3 class="auto-style1">Archiv časopisu</h3>
    <p class="auto-style1">&nbsp;</p>
    <p class="auto-style1">
        <asp:HyperLink ID="hpl_archivCislo" runat="server" NavigateUrl="~/2019_Rocnik10_Cislo2.pdf">2019/Ročník 10/Číslo1</asp:HyperLink>
    </p> 
</asp:Content>

