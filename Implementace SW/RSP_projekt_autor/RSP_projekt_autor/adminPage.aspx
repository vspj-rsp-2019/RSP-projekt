<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="adminPage.aspx.cs" Inherits="adminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Administrátorská stránka
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h1 align="center"> Welcome in Admin page</h1>
    <p align="center"> 
        <asp:Label ID="lb_premission" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="Red"></asp:Label>
    </p>
    <p> 
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Visible="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                <asp:BoundField DataField="jmeno" HeaderText="jmeno" SortExpression="jmeno" />
                <asp:BoundField DataField="prijmeni" HeaderText="prijmeni" SortExpression="prijmeni" />
                <asp:BoundField DataField="hesloHash" HeaderText="hesloHash" SortExpression="hesloHash" ReadOnly="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [id] = @id" InsertCommand="INSERT INTO [Users] ([role], [email], [jmeno], [prijmeni], [hesloHash]) VALUES (@role, @email, @jmeno, @prijmeni, @hesloHash)" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [role] = @role, [email] = @email, [jmeno] = @jmeno, [prijmeni] = @prijmeni, [hesloHash] = @hesloHash WHERE [id] = @id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="jmeno" Type="String" />
                <asp:Parameter Name="prijmeni" Type="String" />
                <asp:Parameter Name="hesloHash" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="jmeno" Type="String" />
                <asp:Parameter Name="prijmeni" Type="String" />
                <asp:Parameter Name="hesloHash" Type="String" />
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>

