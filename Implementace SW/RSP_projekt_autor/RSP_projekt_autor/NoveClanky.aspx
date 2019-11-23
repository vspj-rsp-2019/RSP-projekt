<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="NoveClanky.aspx.cs" Inherits="NoveClanky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Nové články
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

    <h4 class="auto-style1">Nově podané články od autorů k dalšímu zpracování</h4>
    <p class="auto-style1">&nbsp;</p>
    <p class="auto-style1">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" CssClass="auto-style1" DataKeyNames="Id" DataSourceID="NoveClankyRedaktorovi" EmptyDataText="Nejsou žádné nové data." ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Datum" HeaderText="Datum podání" SortExpression="Datum" />
                <asp:BoundField DataField="jmeno" HeaderText="Jméno autora" SortExpression="jmeno" />
                <asp:BoundField DataField="prijmeni" HeaderText="Příjmení autora" SortExpression="prijmeni" />
                <asp:BoundField DataField="datum_zah_rec_riz" HeaderText="Datum zahájení RR" SortExpression="datum_zah_rec_riz" />
                <asp:BoundField DataField="Expr1" HeaderText="Stav" SortExpression="Expr1" />
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
        <asp:SqlDataSource ID="NoveClankyRedaktorovi" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Clanky.Datum, Users.jmeno, Users.prijmeni, Clanky.filePath, Clanky.datum_zah_rec_riz, Clanky.Id, Clanky_Status.nazev AS Expr1 FROM Clanky INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status INNER JOIN Users ON Clanky.autor_id = Users.id WHERE (Clanky_Status.Id_cl_status = 0)"></asp:SqlDataSource>
    </p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style1">
        <asp:Button ID="btn_zmenaStatusu_formD" runat="server" OnClick="btn_zmenaStatusu_Click" Text="Předat k formálnímu doplnění" BackColor="#FFFF66" OnCommand="Page_Load" />
        <asp:Button ID="btn_odeslat_do_RR" runat="server" BackColor="#66FF33" OnClick="btn_odeslat_do_RR_Click" Text="Odeslat do recenzního řízení" />
        <asp:Button ID="btn_zamitnoutcl" runat="server" BackColor="Red" OnClick="btn_zamitnoutcl_Click" Text="Zamítnout článek" />
    </p>
    <p class="auto-style1">
        &nbsp;</p>
    <p class="auto-style5">
        <asp:Label ID="lbl_stav" runat="server" ForeColor="#66FF33" Text="sss" Visible="False"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
     
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p class="auto-style1">&nbsp;</p>
    <p class="auto-style1">&nbsp;</p>
    <p class="auto-style1">&nbsp;</p>
</asp:Content>

