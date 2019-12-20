<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecenzeClankuAutora.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Recenze článku autora</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 51%;
        }
        .auto-style2 {
            width: 324px;
        }
        .auto-style3 {
            margin-left: 0px;
        }
        .auto-style4 {
            width: 651px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <div align="center"> 
    <br />
    <br />
    <h2>Vyhledávání článků</h2>
    <br />
    <table class="auto-style1" >
        <tr>
            <td class="auto-style2" align="left">Název článku:</td>
            <td class="auto-style4" align="left"><asp:TextBox ID="Tb1_nazevClanku" runat="server" CssClass="auto-style3" Width="228px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style2" align="left">Název vydání:</td>
            <td class="auto-style4" align="left">
                <asp:DropDownList ID="DDL1_vydani" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Name] FROM [Vydani]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" align="left">&nbsp;</td>
            <td class="auto-style4" align="left"><asp:Button ID="Btn1_hledat" runat="server" OnClick="Btn1_hledat_Click" Text="Hledat" /> &nbsp; <asp:Button ID="Btn2_resetHledani" runat="server" OnClick="Btn2_resetHledani_Click" Text="Reset hledání" /></td>
        </tr>
    </table>
    <br />


    <br />
    <h2>Články autora</h2>
    <br />
                <asp:GridView ID="gv_recenze" runat="server" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" DataKeyNames="Id"  EmptyDataText="Žádné datové záznamy k zobrazení." CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Název vydání" />
                    <asp:BoundField DataField="nazev" HeaderText="Název článku" />
                    <asp:BoundField DataField="Datum" HeaderText="Datum uložení" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
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

    <h2>Přiřazené recenze</h2>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Žádné datové záznamy k zobrazení." CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="nazev" HeaderText="Název" SortExpression="nazev" />
            <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
            <asp:BoundField DataField="Aktualnost" HeaderText="Aktuálnost" SortExpression="Aktualnost" />
            <asp:BoundField DataField="Originalita" HeaderText="Originalita" SortExpression="Originalita" />
            <asp:BoundField DataField="OdbornaUroven" HeaderText="Odborná úroveň" SortExpression="OdbornaUroven" />
            <asp:BoundField DataField="JazykovaUroven" HeaderText="Jazyková úroveň" SortExpression="JazykovaUroven" />
            <asp:CommandField ShowSelectButton="True" />

        </Columns>
                <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Recenze] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Recenze] ([Clanek_id], [Recenzent_id], [Datum], [TextRecenze]) VALUES (@Clanek_id, @Recenzent_id, @Datum, @TextRecenze)" SelectCommand="SELECT Recenze.Id, Recenze.Clanek_id, Recenze.Recenzent_id, Recenze.Datum, Recenze.Aktualnost, Recenze.Originalita, Recenze.OdbornaUroven, Recenze.JazykovaUroven, Clanky.nazev FROM Recenze INNER JOIN Clanky ON Recenze.Clanek_id = Clanky.Id
WHERE ([Clanek_id] = @Clanek_id) AND Recenze.Zverejneno = 1" UpdateCommand="UPDATE [Recenze] SET [Clanek_id] = @Clanek_id, [Recenzent_id] = @Recenzent_id, [Datum] = @Datum, [TextRecenze] = @TextRecenze WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Clanek_id" Type="Int32" />
            <asp:Parameter Name="Recenzent_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Datum" />
            <asp:Parameter Name="TextRecenze" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gv_recenze" Name="Clanek_id" PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Clanek_id" Type="Int32" />
            <asp:Parameter Name="Recenzent_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="Datum" />
            <asp:Parameter Name="TextRecenze" Type="String" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
        <br />
        <h2>Text recenze </h2>
        (Vyberte recenzi pro zobrazení textu)<br />
        <asp:TextBox ID="TB_textRecenze" runat="server" Height="111px" TextMode="MultiLine" Width="500px"></asp:TextBox>
        <br />
        <br />
    <br />

</div>

</asp:Content>