<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Aktualni_cislo.aspx.cs" Inherits="Aktualni_cislo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Aktuální číslo časopisu
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .auto-style1 {
            margin-left: 7px;
            margin-right: 7px;
        }
         .auto-style5 {
             margin-left: 7px;
             margin-right: 7px;
             text-align: center;
         }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h3 class="auto-style5">Aktuální číslo časopisu</h3>
    <p class="auto-style1">&nbsp;</p>
    <div align="center">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Název vydání" SortExpression="Name" />
                <asp:BoundField DataField="Popis" HeaderText="Popis" SortExpression="Popis" />
                <asp:HyperLinkField DataNavigateUrlFields="filePath" DataTextField="filePath" DataTextFormatString="Otevřít" HeaderText="Vydání" NavigateUrl="filePath" Target="_blank" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name], [Archiv], [Popis], [filePath] FROM [Vydani] WHERE Archiv = 0 AND filePath IS NOT NULL"></asp:SqlDataSource>
    </div>
</asp:Content>

