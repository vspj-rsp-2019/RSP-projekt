<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Archiv.aspx.cs" Inherits="Archiv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Archiv
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 7px;
            margin-right: 7px;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h3 class="auto-style1">Archiv časopisu</h3>
    <br />

    <div align="center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Žádné datové záznamy k zobrazení." ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Název vydání" SortExpression="Name" />
                <asp:BoundField DataField="Popis" HeaderText="Popis" SortExpression="Popis" />
                <asp:HyperLinkField DataNavigateUrlFields="filePath" DataTextField="filePath" DataTextFormatString="Otevřít" HeaderText="Vydání" NavigateUrl="filePath" Target="_blank" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Vydani] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Vydani] ([Name], [Archiv], [Popis], [filePath]) VALUES (@Name, @Archiv, @Popis, @filePath)" SelectCommand="SELECT [Id], [Name], [Archiv], [Popis], [filePath] FROM [Vydani] WHERE Archiv = 1" UpdateCommand="UPDATE [Vydani] SET [Name] = @Name, [Archiv] = @Archiv, [Popis] = @Popis, [filePath] = @filePath WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Archiv" Type="Boolean" />
                <asp:Parameter Name="Popis" Type="String" />
                <asp:Parameter Name="filePath" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Archiv" Type="Boolean" />
                <asp:Parameter Name="Popis" Type="String" />
                <asp:Parameter Name="filePath" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div> 
    <br /><br />
</asp:Content>

