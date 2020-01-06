<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="SchvaleneClanky.aspx.cs" Inherits="SchvaleneClanky" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">Schválené články</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            margin-left: 70px;
            margin-right: 7px;
        }
        .auto-style6 {
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <br />   
    <h3 class="auto-style5">Schválené články</h3><br />
        <div class="auto-style6">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SchvaleneClanky2" EmptyDataText="Aktuálně neevidujeme žádné data." ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Datum" HeaderText="Datum článku" SortExpression="Datum" />
                    <asp:BoundField DataField="jmeno" HeaderText="Jméno autora" SortExpression="jmeno" />
                    <asp:BoundField DataField="prijmeni" HeaderText="Příjmení autora" SortExpression="prijmeni" />
                    <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" Visible="False" />
                    <asp:BoundField DataField="datum_zah_rec_riz" HeaderText="Datum zahájení RŘ" SortExpression="datum_zah_rec_riz" />
                    <asp:BoundField DataField="Id" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
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
        <asp:SqlDataSource ID="SchvaleneClanky2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Clanky.Datum, Users.jmeno, Users.prijmeni, 
Clanky.filePath, Clanky.datum_zah_rec_riz, Clanky.Id, 
Clanky_Status.nazev AS Expr1 FROM Clanky 
INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status 
INNER JOIN Users ON Clanky.autor_id = Users.id 
WHERE (Clanky_Status.Id_cl_status = 6)"></asp:SqlDataSource>
    </div>
</asp:Content>

