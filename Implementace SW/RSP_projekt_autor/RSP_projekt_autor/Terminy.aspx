<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Terminy.aspx.cs" Inherits="Terminy" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">Termíny</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            margin-left: 7px;
            margin-right: 7px;
        }
        .auto-style2 {
            text-align: center;
            margin-left: 7px;
            margin-right: 7px;
            margin:auto;
        }
        .auto-style3 {
            margin-left: 7px;
            margin-right: 7px;
            text-align:center;
        }
        .auto-style5 {
            text-align: left;
            width: 581px;
            margin-left: 7px;
            margin-right: 7px;
        }
        .auto-style6 {
            text-align: left;
            width: 746px;
            margin-left: 7px;
            margin-right: 7px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <p class="auto-style1">Aktuální datum: <asp:Label ID="lbl_AktualDate" runat="server"></asp:Label></p>
    <h3 class="auto-style5">Upozornění na končící datum vypracování posudku od recenzentů:</h3>
    <br />
    <div class="auto-style2">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="CheckTermin_1" ForeColor="#333333" GridLines="None" EmptyDataText="Aktuálně neevidujeme končící termíny." AllowPaging="True" AllowSorting="True" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Datum_vypracovani" HeaderText="Datum vypracování" SortExpression="Datum_vypracovani" />
            <asp:BoundField DataField="id" HeaderText="ID recenzenta" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
            <asp:BoundField DataField="Id_Clanku" HeaderText="ID článku" SortExpression="Id_Clanku" />
            <asp:BoundField DataField="nazev" HeaderText="Název čl." SortExpression="nazev" />
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
    </div>
        <%--Zobrazi jen hodnoty, kdy datum vypracovani posudku vyprsi za 3 nebo mene dni.--%>
        <asp:SqlDataSource ID="CheckTermin_1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT PrideleneClanky.Datum_vypracovani, Users.id, Users.jmeno, Users.prijmeni, 
PrideleneClanky.Id_Clanku, Clanky.nazev
FROM PrideleneClanky 
INNER JOIN Users ON PrideleneClanky.Id_Recenzenta = Users.id 
INNER JOIN Clanky ON PrideleneClanky.ID_Clanku = Clanky.Id
WHERE (Users.role = 'recenzent') AND Zpracovano = 0 AND DATEDIFF (DAY, GETDATE(), PrideleneClanky.Datum_vypracovani) &lt;= 3;"></asp:SqlDataSource>
    <br />
    <p style="text-align:center"><asp:Button ID="btn_zobrazVsechnyPosudky" runat="server" OnClick="Button2_Click" Text="Zobrazit všechny posudky" /></p>
    <p style="text-align:center"><asp:Button ID="btn_skryAllPosudky" runat="server" CausesValidation="False" OnClick="btn_skryAllPosudky_Click" Text="Skrýt všechny posudky" Visible="False" /></p><br />
    <p>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Vsechny_Posudky" ForeColor="#333333" GridLines="None" Visible="False" AllowPaging="True" AllowSorting="True" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Datum_vypracovani" HeaderText="Datum vypracování" SortExpression="Datum_vypracovani" />
            <asp:CheckBoxField DataField="Zpracovano" HeaderText="Zpracovano" SortExpression="Zpracovano" />
            <asp:BoundField DataField="id" HeaderText="Id recenzenta" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
            <asp:BoundField DataField="Id_Clanku" HeaderText="ID článku" SortExpression="Id_Clanku" />
            <asp:BoundField DataField="nazev" HeaderText="Název čl." SortExpression="nazev" />
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
    <asp:SqlDataSource ID="Vsechny_Posudky" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT PrideleneClanky.Datum_vypracovani, PrideleneClanky.Zpracovano, Users.id, Users.jmeno, Users.prijmeni, 
PrideleneClanky.Id_Clanku, Clanky.nazev
FROM PrideleneClanky 
INNER JOIN Users ON PrideleneClanky.Id_Recenzenta = Users.id 
INNER JOIN Clanky ON PrideleneClanky.ID_Clanku = Clanky.Id
WHERE (Users.role = 'recenzent')"></asp:SqlDataSource>
</p>
    <h3 class="auto-style6">Upozornění na končící datum uzávěrky pro sběr příspěvků do jednotlivých čísel časopisu:</h3><br />
    <p>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Check_Uzaverka_prispevky" ForeColor="#333333" GridLines="None" EmptyDataText="Aktuálně neevidujeme končící termíny." HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Termin_uzaverky" HeaderText="Termín uzávěrky" SortExpression="Termin_uzaverky" />
                <asp:BoundField DataField="Name" HeaderText="Název čísla" SortExpression="Name" />
                <asp:BoundField DataField="Popis" HeaderText="Popis vydání" SortExpression="Popis" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
    </p><br />
    <p class="auto-style3">
        <asp:SqlDataSource ID="Check_Uzaverka_prispevky" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Uzaverka.Termin_uzaverky, Vydani.Name, Vydani.Popis 
FROM Uzaverka
INNER JOIN Vydani ON Uzaverka.ID_vydani = Vydani.Id
WHERE DATEDIFF (DAY, GETDATE(), Uzaverka.Termin_uzaverky) &lt;= 3;"></asp:SqlDataSource>
    </p>
    <p style="text-align:center"><asp:Button ID="btn_zobrazVsechnyUzaverky" runat="server" OnClick="Button1_Click" Text="Zobrazit všechny uzávěrky" /></p>
    <p style="text-align:center"><asp:Button ID="btn_skrytAllUzaverky" runat="server" OnClick="btn_skrytAllUzaverky_Click" Text="Skrýt všechny uzávěrky" Visible="False" /></p>
    <br />
    <p>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="Vsechny_Uzaverky" ForeColor="#333333" GridLines="None" Visible="False" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Termin_uzaverky" HeaderText="Termín uzávěrky" SortExpression="Termin_uzaverky" />
                <asp:BoundField DataField="Name" HeaderText="Název čísla" SortExpression="Name" />
                <asp:BoundField DataField="Popis" HeaderText="Popis vydání" SortExpression="Popis" />
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
        <asp:SqlDataSource ID="Vsechny_Uzaverky" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Uzaverka.Termin_uzaverky, Vydani.Name, Vydani.Popis 
FROM Uzaverka
INNER JOIN Vydani ON Uzaverka.ID_vydani = Vydani.Id"></asp:SqlDataSource>
    </p>
    <br /><br />
</asp:Content>