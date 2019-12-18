<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="KDoreseni.aspx.cs" Inherits="KDoreseni" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Články k dořešení
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
        .auto-style7 {
            margin-left: 7px;
            margin-right: 7px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h4 class="auto-style5">Články k dořešení:</h4>
    <p class="auto-style5">&nbsp;</p>
    <p class="auto-style5">
        <div class="auto-style6">
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource15" EmptyDataText="Momentálně neevidujeme žádné články." ForeColor="#333333" GridLines="None" Width="863px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                    <asp:BoundField DataField="jmeno" HeaderText="Jméno autora" SortExpression="jmeno" />
                    <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
                    <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" Visible="False" />
                    <asp:BoundField DataField="nazev" HeaderText="Název čl." SortExpression="nazev" />
                    <asp:BoundField DataField="datum_zah_rec_riz" HeaderText="Datum zah.RR" SortExpression="datum_zah_rec_riz" />
                    <asp:BoundField DataField="Expr1" HeaderText="Stav článku" SortExpression="Expr1" />
                    <asp:HyperLinkField DataNavigateUrlFields="filePath" DataTextField="filePath" DataTextFormatString="Otevřít" HeaderText="Článek" NavigateUrl="filePath" Target="_blank" />
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
        <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Clanky.Datum, Users.jmeno, Users.prijmeni, 
Clanky.filePath, Clanky.nazev, Clanky.datum_zah_rec_riz, Clanky.Id, 
Clanky_Status.nazev AS Expr1 FROM Clanky 
INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status 
INNER JOIN Users ON Clanky.autor_id = Users.id 
WHERE (Clanky_Status.Id_cl_status = 5)"></asp:SqlDataSource>
    </p>
    <p class="auto-style5">&nbsp;</p>
    <p class="auto-style5">&nbsp;</p>
    <p class="auto-style5">
        <asp:Button ID="btn_OdeslatRR" runat="server" BackColor="#66FF33" OnClick="btn_OdeslatRR_Click" Text="Odeslat do RR" Width="185px" />
        <asp:Button ID="btn_VratitKformDopl" runat="server" BackColor="#FFFF66" OnClick="btn_VratitKformDopl_Click" Text="Vrátit k formálnímu doplnění" Width="264px" />
        <asp:Button ID="btn_VratitDoRR" runat="server" BackColor="#33CCFF" OnClick="btn_VratitDoRR_Click" Text="Vrátit do probíhajícího RR" Width="257px" />
        <asp:Button ID="btn_zamitnout" runat="server" BackColor="Red" OnClick="btn_zamitnout_Click" Text="Zamítnout článek" />
    </p>
    <p class="auto-style5">&nbsp;</p>
    <p class="auto-style7">
        <asp:Label ID="lb_stav" runat="server" ForeColor="#66FF33" Text="sss" Visible="False"></asp:Label>
        <h4 class="auto-style5">Články na straně Autora:</h4>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="KdoreseniClanky" ForeColor="#333333" GridLines="None" EmptyDataText="Momentálně neevidujeme žádné články." Width="871px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID článku" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                    <asp:BoundField DataField="jmeno" HeaderText="Jméno autora" SortExpression="jmeno" />
                    <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
                    <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" Visible="False" />
<asp:BoundField DataField="nazev" HeaderText="Název čl." SortExpression="nazev"></asp:BoundField>
                    <asp:BoundField DataField="datum_zah_rec_riz" HeaderText="Datum zah. RR" SortExpression="datum_zah_rec_riz" />
                    <asp:BoundField DataField="Expr1" HeaderText="Stav článku" SortExpression="Expr1" />
                    <asp:HyperLinkField DataNavigateUrlFields="filePath" DataTextField="filePath" DataTextFormatString="Otevřít" HeaderText="Článek" NavigateUrl="filePath" Target="_blank" />
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
        <div>
        </div>
        <asp:SqlDataSource ID="KdoreseniClanky" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Clanky.Datum, Users.jmeno, Users.prijmeni, 
Clanky.filePath, Clanky.nazev, Clanky.datum_zah_rec_riz, Clanky.Id, 
Clanky_Status.nazev AS Expr1 FROM Clanky 
INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status 
INNER JOIN Users ON Clanky.autor_id = Users.id 
WHERE (Clanky_Status.Id_cl_status = 1 OR Clanky_Status.Id_cl_status = 9)"></asp:SqlDataSource>
    <br />
    </p>


    
    </asp:Content>

