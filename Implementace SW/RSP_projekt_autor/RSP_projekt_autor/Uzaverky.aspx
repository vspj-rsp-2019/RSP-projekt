<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Uzaverky.aspx.cs" Inherits="Uzaverky" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">Termíny - Uzávěrky</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            margin-left: 7px;
            margin-right: 7px;
            text-align: center;
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
    <asp:Label ID="lbl_aktDatum" runat="server"></asp:Label>
    </p><br />
    <h3 class="auto-style5">Kontrola uzávěrky - Upozornění na končící datum uzávěrky pro sběr příspěvků do jednotlivých čísel časopisu</h3>
    <br />
    <p class="auto-style5">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="CheckUzaverky" EmptyDataText="Aktuálně neevidujeme končící termíny." ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Termin_uzaverky" HeaderText="Termín uzávěrky" SortExpression="Termin_uzaverky" />
                <asp:BoundField DataField="Name" HeaderText="Vydání" SortExpression="Name" />
                <asp:BoundField DataField="Popis" HeaderText="Popis" SortExpression="Popis" />
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
        <asp:SqlDataSource ID="CheckUzaverky" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Uzaverka.Termin_uzaverky, Vydani.Name, Vydani.Popis 
FROM Uzaverka
INNER JOIN Vydani ON Uzaverka.ID_vydani = Vydani.Id
WHERE DATEDIFF (DAY, GETDATE(), Uzaverka.Termin_uzaverky) &lt;= 3;"></asp:SqlDataSource>
    </p><br />
    <p class="auto-style5"><asp:Button ID="btn_zobrUzaverky" runat="server" OnClick="btn_zobrUzaverky_Click" Text="Zobraz všechny uzávěrky" Width="278px" /></p>
    <p class="auto-style5"><asp:Button ID="brn_skrytUz" runat="server" OnClick="brn_skrytUz_Click" Text="Skrýt všechny uzávěrky" Visible="False" Width="278px" /></p>
    <br />
    <p class="auto-style5">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="VsechnyUzaverky" ForeColor="#333333" GridLines="None" Visible="False" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Termin_uzaverky" HeaderText="Termín uzávěrky" SortExpression="Termin_uzaverky" />
                <asp:BoundField DataField="Name" HeaderText="Vydání" SortExpression="Name" />
                <asp:BoundField DataField="Popis" HeaderText="Popis" SortExpression="Popis" />
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
        <asp:SqlDataSource ID="VsechnyUzaverky" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Uzaverka.Termin_uzaverky, Vydani.Name, Vydani.Popis 
FROM Uzaverka
INNER JOIN Vydani ON Uzaverka.ID_vydani = Vydani.Id"></asp:SqlDataSource>
</p>
</asp:Content>

