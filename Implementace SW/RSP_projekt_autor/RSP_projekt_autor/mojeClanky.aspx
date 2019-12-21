<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mojeClanky.aspx.cs" Inherits="mojeClanky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Moje články
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style6 {
            font-size: medium;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div align="center">    <strong><span class="auto-style6">Nahrát nový článek</span></strong><br />
        Vydání:
        <asp:DropDownList ID="DDL_vyberVydani" runat="server" AutoPostBack="True" DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="DDL_vyberVydani_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:FileUpload ID="FileUpload" runat="server" />
        <asp:Button ID="BTN_uploadFile" runat="server" Text="Potvrdit" OnClick="Upload" />
        <br />
        K vámi vybranému vydání evidujeme: <asp:Label ID="LB_counterClanku" runat="server"></asp:Label>
&nbsp;podaných článků</div>    

        <br />
        <br />
    <div align="center">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RecenzeClankuAutora.aspx">Recenze mých článků</asp:HyperLink> <br />
        <strong>Moje články</strong>
        <asp:GridView ID="GV_clanky" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="511px" DataKeyNames="Id">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id článku" SortExpression="Id" ReadOnly="True" />
                <asp:BoundField DataField="nazev" HeaderText="Název čl." SortExpression="nazev" />
                <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                <asp:BoundField DataField="Name" HeaderText="Vydání" SortExpression="Name" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Id, [nazev], [Datum], [Name] FROM [View] WHERE ([autor_id] = @autor_id)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="-1" Name="autor_id" SessionField="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <span class="auto-style6">
        <strong>Přijaté články od redaktora</strong></span>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" EmptyDataText="Neevidujeme žádné články." ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                <asp:BoundField DataField="nazev" HeaderText="Název článku" SortExpression="nazev" />
                <asp:BoundField DataField="Expr1" HeaderText="Status článku" SortExpression="Expr1" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Clanky.Datum, Clanky.nazev, Users.jmeno, Users.prijmeni, 
Clanky.filePath, Clanky.datum_zah_rec_riz, Clanky.Id, 
Clanky_Status.nazev AS Expr1 FROM Clanky 
INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status 
INNER JOIN Users ON Clanky.autor_id = Users.id 
WHERE  (autor_id = @autor_id) AND (Clanky_Status.Id_cl_status = 2) ">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="-1" Name="autor_id" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />

        </div>
        
</asp:Content>
