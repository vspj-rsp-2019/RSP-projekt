<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mojeClanky.aspx.cs" Inherits="mojeClanky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
        <strong>Nahrát nový článek</strong><br />
        <asp:FileUpload ID="FileUpload" runat="server" />
        <asp:Button ID="BTN_uploadFile" runat="server" Text="Potvrdit" OnClick="Upload" />
        <br />
        <br />
    <div align="center">
        <strong>Moje články</strong>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="511px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Datum" HeaderText="Datum nahrání" SortExpression="Datum" />
                <asp:BoundField DataField="nazev" HeaderText="Název članku" SortExpression="nazev" />
                <asp:BoundField DataField="Name" HeaderText="Název vydání" SortExpression="Name" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Clanky].[nazev], [Clanky].[Datum], [Vydani].[Name]
FROM [Clanky] 
JOIN [Vydani] ON [Clanky].[vydani_id]=[Vydani].[Id]
WHERE [Clanky].[id] = @mojeID">
            <SelectParameters>
                <asp:SessionParameter Name="mojeID" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>

</asp:Content>
