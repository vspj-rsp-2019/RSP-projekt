<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ArchivaceClanku.aspx.cs" Inherits="ArchivaceClanku" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            margin-left: 0px;
        }
        .auto-style7 {
            width: 55%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h2 class="auto-style5">Archivace článků </h2>
    <br />

        <table align="center" border="1">
            <tr>
                <td class="auto-style6">Vydání:</td>
                <td>
                    <div class="auto-style5">
                    <asp:DropDownList ID="DDL1_vydani" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Id" CssClass="auto-style6" Height="20px" Width="183px" OnSelectedIndexChanged="DDL1_vydani_SelectedIndexChanged1">
                    </asp:DropDownList>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Vydani]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Stav článku:</td>
                <td>
                    <asp:DropDownList ID="DDL_stavClanku" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="nazev" DataValueField="Id_cl_status" Height="20px" Width="183px" OnSelectedIndexChanged="DDL_stavClanku_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Clanky_Status]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
&nbsp;<asp:Label ID="Lb_stav" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:Button ID="Btn_hledatClanky" runat="server" Text="Hledat" Width="135px" />
                </td>
            </tr>
        </table>
    <br /><br />
    <h3 class="auto-style5">Články ve vydání</h3>
    <p class="auto-style5">(pro zobrazení verzí článku vyberte konkrétní článek)</p>
        <div align="center">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="Žádné datové záznamy k zobrazení." DataKeyNames="Id" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Id" HeaderText="Id článku" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Expr1" HeaderText="Název článku" SortExpression="Expr1" />
            <asp:BoundField DataField="Name" HeaderText="Vydání" SortExpression="Name" />
            <asp:BoundField DataField="Datum" HeaderText="Datum vložení" SortExpression="Datum" DataFormatString="{0:d}" />
            <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" />
            <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
            <asp:BoundField DataField="nazev" HeaderText="Stav článku" SortExpression="nazev" />
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
             <br />
            <table align="center" class="auto-style7">
                <tr>
                    <td>
             <asp:Button ID="Btn_archivovatClanky" runat="server" Text="Archivovat schválené články" BackColor="#CCFF33" ForeColor="Black" OnClick="Btn_archivovatClanky_Click" Width="253px" />
                    </td>
                    <td>
                        <asp:Button ID="Btn_vyjmoutZarchivu" runat="server" BackColor="#FF6666" OnClick="Btn_vyjmoutZarchivu_Click" Text="Vyjmout článek z archivu do  schválených" Width="314px" />
                    </td>
                </tr>
            </table>
         </div> 
        
         <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Clanky] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Clanky] ([autor_id], [vydani_id], [nazev], [filePath], [Datum], [status_clanek]) VALUES (@autor_id, @vydani_id, @nazev, @filePath, @Datum, @status_clanek)" SelectCommand="SELECT Clanky.Id, Clanky.autor_id, Clanky.vydani_id, Clanky.nazev AS Expr1, Clanky.filePath, Clanky.Datum, Clanky.status_clanek, Vydani.Name, Users.jmeno, Users.prijmeni, Users.role, Clanky_Status.* FROM Vydani INNER JOIN Clanky ON Clanky.vydani_id = Vydani.Id INNER JOIN Users ON Clanky.autor_id = Users.id INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status WHERE (Vydani.Id = @VydaniId) AND (Clanky_Status.Id_cl_status = @Status)" UpdateCommand="UPDATE [Clanky] SET [autor_id] = @autor_id, [vydani_id] = @vydani_id, [nazev] = @nazev, [filePath] = @filePath, [Datum] = @Datum, [status_clanek] = @status_clanek WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="autor_id" Type="Int32" />
                    <asp:Parameter Name="vydani_id" Type="Int32" />
                    <asp:Parameter Name="nazev" Type="String" />
                    <asp:Parameter Name="filePath" Type="String" />
                    <asp:Parameter DbType="Date" Name="Datum" />
                    <asp:Parameter Name="status_clanek" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDL1_vydani" Name="VydaniId" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DDL_stavClanku" DefaultValue="*" Name="Status" PropertyName="SelectedValue" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="autor_id" Type="Int32" />
                    <asp:Parameter Name="vydani_id" Type="Int32" />
                    <asp:Parameter Name="nazev" Type="String" />
                    <asp:Parameter Name="filePath" Type="String" />
                    <asp:Parameter DbType="Date" Name="Datum" />
                    <asp:Parameter Name="status_clanek" Type="Int32" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
    </asp:SqlDataSource>
    <br />

    <h3 class="auto-style5">Verze článku</h3>
    <div align="center">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ClanekId,VerzeId" DataSourceID="SqlDataSource4" EmptyDataText="Žádné datové záznamy k zobrazení." ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ClanekId" HeaderText="Id článku" ReadOnly="True" SortExpression="ClanekId" />
                <asp:BoundField DataField="Expr1" HeaderText="Název článku" SortExpression="Expr1" />
                <asp:BoundField DataField="VerzeId" HeaderText="Verze článku" SortExpression="VerzeId" ReadOnly="True" />
                <asp:BoundField DataField="Datum" HeaderText="Datum vložení" SortExpression="Datum" DataFormatString="{0:d}" />
                <asp:BoundField DataField="Expr2" HeaderText="Stav článku" SortExpression="Expr2" />
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
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ClankyArchiv] WHERE [ClanekId] = @ClanekId AND [VerzeId] = @VerzeId" InsertCommand="INSERT INTO [ClankyArchiv] ([ClanekId], [VerzeId], [Stav], [FilePath], [Nazev], [Datum]) VALUES (@ClanekId, @VerzeId, @Stav, @FilePath, @Nazev, @Datum)" SelectCommand="SELECT ClankyArchiv.ClanekId, ClankyArchiv.VerzeId, ClankyArchiv.Stav, ClankyArchiv.FilePath, ClankyArchiv.Nazev AS Expr1, ClankyArchiv.Datum, Clanky_Status.nazev AS Expr2 FROM ClankyArchiv INNER JOIN Clanky_Status ON ClankyArchiv.Stav = Clanky_Status.Id_cl_status WHERE ([ClanekId] = @ClanekId)" UpdateCommand="UPDATE [ClankyArchiv] SET [Stav] = @Stav, [FilePath] = @FilePath, [Nazev] = @Nazev, [Datum] = @Datum WHERE [ClanekId] = @ClanekId AND [VerzeId] = @VerzeId">
            <DeleteParameters>
                <asp:Parameter Name="ClanekId" Type="Int32" />
                <asp:Parameter Name="VerzeId" Type="Byte" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ClanekId" Type="Int32" />
                <asp:Parameter Name="VerzeId" Type="Byte" />
                <asp:Parameter Name="Stav" Type="Int32" />
                <asp:Parameter Name="FilePath" Type="String" />
                <asp:Parameter Name="Nazev" Type="String" />
                <asp:Parameter Name="Datum" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="ClanekId" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Stav" Type="Int32" />
                <asp:Parameter Name="FilePath" Type="String" />
                <asp:Parameter Name="Nazev" Type="String" />
                <asp:Parameter Name="Datum" Type="DateTime" />
                <asp:Parameter Name="ClanekId" Type="Int32" />
                <asp:Parameter Name="VerzeId" Type="Byte" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <br />

</asp:Content>

