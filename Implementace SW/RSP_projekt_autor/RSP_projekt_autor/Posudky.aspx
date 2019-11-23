<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Posudky.aspx.cs" Inherits="Posudky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Termíny - Posudky
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            margin-left: 7px;
            margin-right: 7px;
        }
        .auto-style6 {
            margin-left: 7px;
            margin-right: 7px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    
    <p class="auto-style6">
        <asp:Label ID="lbl_akt_date" runat="server"></asp:Label>
    </p>
    <h4 class="auto-style5">Kontrola termínů - Upozornění na končící datum vypracování posudku od recenzentů</h4>
    <p class="auto-style5">&nbsp;</p>
    <p class="auto-style5">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="CheckTerminy2" ForeColor="#333333" GridLines="None" EmptyDataText="Aktuálně neevidujeme končící termíny.">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Datum_vypracovani" HeaderText="Datum vypracování" SortExpression="Datum_vypracovani" />
                <asp:BoundField DataField="id" HeaderText="ID recenzenta" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="jmeno" HeaderText="Jméno recenzenta" SortExpression="jmeno" />
                <asp:BoundField DataField="prijmeni" HeaderText="Příjmení recenzenta" SortExpression="prijmeni" />
                <asp:BoundField DataField="Id_Clanku" HeaderText="ID článku" SortExpression="Id_Clanku" />
                <asp:BoundField DataField="nazev" HeaderText="Název článku" SortExpression="nazev" />
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
        <asp:SqlDataSource ID="CheckTerminy2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT PrideleneClanky.Datum_vypracovani, Users.id, Users.jmeno, Users.prijmeni, 
PrideleneClanky.Id_Clanku, Clanky.nazev
FROM PrideleneClanky 
INNER JOIN Users ON PrideleneClanky.Id_Recenzenta = Users.id 
INNER JOIN Clanky ON PrideleneClanky.ID_Clanku = Clanky.Id
WHERE (Users.role = 'recenzent') AND DATEDIFF (DAY, GETDATE(), PrideleneClanky.Datum_vypracovani) &lt;= 3;"></asp:SqlDataSource>
    </p>
    <p class="auto-style5">
        <asp:Button ID="btn_zobrPos" runat="server" OnClick="btn_zobrPos_Click" Text="Zobrazit všechny posudky" Width="280px" />
    </p>
    <p class="auto-style5">
        <asp:Button ID="btn_skryt" runat="server" OnClick="btn_skryt_Click" Text="Skrýt všechny posudky" Width="280px" Visible="False" />
    </p>
    <p class="auto-style5">&nbsp;</p>
    <p class="auto-style5">
        <asp:GridView ID="GridView2_VsechnyPos" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="vsechnyposudky" ForeColor="#333333" GridLines="None" Visible="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Datum_vypracovani" HeaderText="Datum vypracování" SortExpression="Datum_vypracovani" />
                <asp:BoundField DataField="id" HeaderText="ID recenzenta" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="jmeno" HeaderText="Jméno recenzenta" SortExpression="jmeno" />
                <asp:BoundField DataField="prijmeni" HeaderText="Příjmení recenzenta" SortExpression="prijmeni" />
                <asp:BoundField DataField="Id_Clanku" HeaderText="ID článku" SortExpression="Id_Clanku" />
                <asp:BoundField DataField="nazev" HeaderText="Název článku" SortExpression="nazev" />
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
        <asp:SqlDataSource ID="vsechnyposudky" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT PrideleneClanky.Datum_vypracovani, Users.id, Users.jmeno, Users.prijmeni, 
PrideleneClanky.Id_Clanku, Clanky.nazev
FROM PrideleneClanky 
INNER JOIN Users ON PrideleneClanky.Id_Recenzenta = Users.id 
INNER JOIN Clanky ON PrideleneClanky.ID_Clanku = Clanky.Id
WHERE (Users.role = 'recenzent')"></asp:SqlDataSource>
    </p>
</asp:Content>

