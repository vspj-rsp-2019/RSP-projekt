<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mojeClanky.aspx.cs" Inherits="mojeClanky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div align="center">    <strong>Nahrát nový článek</strong><br />
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
        <asp:GridView ID="GV_clanky" runat="server" DataSourceID="SqlDataSource1" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="511px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                <asp:BoundField DataField="nazev" HeaderText="Název článku" SortExpression="nazev" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [nazev], [Datum], [Name] FROM [View] WHERE ([autor_id] = @autor_id)">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="-1" Name="autor_id" SessionField="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
        
</asp:Content>
