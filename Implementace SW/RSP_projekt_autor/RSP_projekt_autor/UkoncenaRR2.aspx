<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UkoncenaRR2.aspx.cs" Inherits="UkoncenaRR2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Ukončená recenzní řízení</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .auto-style1 {
            margin-left: 7px;
            margin-right: 7px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h4 class="auto-style1">Ukončená recenzní řízení</h4>
<p class="auto-style1">&nbsp;</p>
<p class="auto-style1">
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Aktuálně neevidujeme žádné data.">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id Článku" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="autor_id" HeaderText="ID autora" SortExpression="autor_id" />
            <asp:BoundField DataField="vydani_id" HeaderText="ID vydání" SortExpression="vydani_id" />
            <asp:BoundField DataField="nazev" HeaderText="Název článku" SortExpression="nazev" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
            <asp:BoundField DataField="status_clanek" HeaderText="Stav článku" SortExpression="status_clanek" />
            <asp:BoundField DataField="datum_zah_rec_riz" HeaderText="Datum zahájení RR" SortExpression="datum_zah_rec_riz" />
            <asp:BoundField DataField="datum_uk_rec_riz" HeaderText="Datum ukončení RR" SortExpression="datum_uk_rec_riz" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Clanky] WHERE ([datum_uk_rec_riz] IS NOT NULL)"></asp:SqlDataSource>
</p>
<p class="auto-style1">&nbsp;</p>

</asp:Content>

