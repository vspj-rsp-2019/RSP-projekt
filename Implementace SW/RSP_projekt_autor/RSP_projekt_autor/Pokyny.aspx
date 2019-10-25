<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pokyny.aspx.cs" Inherits="Pokyny" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Pokyny pro autory
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            list-style-type: circle;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h3> Pokyny pro autory</h3>
    <p> &nbsp;</p>
    <p> 
        <asp:LinkButton ID="liB_pokynyAutor" runat="server" OnClick="liB_pokynyAutor_Click">Pokyny pro přispěvatele</asp:LinkButton>
    </p>
    <p> 
        <asp:LinkButton ID="liB_sablona" runat="server" OnClick="liB_sablona_Click">Šablona</asp:LinkButton>
    </p>
    <p> 
        <asp:LinkButton ID="liB_recenRizeni" runat="server" OnClick="liB_recenRizeni_Click">Recenzní řízení</asp:LinkButton>
    </p> 


</asp:Content>

