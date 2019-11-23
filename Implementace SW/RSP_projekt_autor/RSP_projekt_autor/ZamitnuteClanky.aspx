<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ZamitnuteClanky.aspx.cs" Inherits="ZamitnuteClanky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Zamítnuté články
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            margin-left: 7px;
            margin-right: 7px;
        }
    .auto-style6 {
        text-align: center;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">

    <h4 class="auto-style5">Zamítnuté články</h4>
    <p class="auto-style5">&nbsp;</p>
    <p class="auto-style5">
        <div class="auto-style6">
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" EmptyDataText="Neevidujeme žádné data.">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Datum" HeaderText="Datum příspěvku" SortExpression="Datum" />
                <asp:BoundField DataField="jmeno" HeaderText="Jméno autora" SortExpression="jmeno" />
                <asp:BoundField DataField="prijmeni" HeaderText="Příjmení autora" SortExpression="prijmeni" />
                <asp:BoundField DataField="Expr1" HeaderText="Status článku" SortExpression="Expr1" />
                <asp:HyperLinkField DataNavigateUrlFields="filePath" DataTextField="filePath" DataTextFormatString="Otevřít" HeaderText="Odkaz" NavigateUrl="filePath" Target="_blank" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Clanky.Datum, Users.jmeno, Users.prijmeni, Clanky.filePath, Clanky.datum_zah_rec_riz, Clanky.Id, Clanky_Status.nazev AS Expr1 FROM Clanky INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status INNER JOIN Users ON Clanky.autor_id = Users.id WHERE (Clanky_Status.Id_cl_status = 7)"></asp:SqlDataSource>
    </p>














</asp:Content>

