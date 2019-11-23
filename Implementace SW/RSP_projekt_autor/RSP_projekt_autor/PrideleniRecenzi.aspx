<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="PrideleniRecenzi.aspx.cs" Inherits="PrideleniRecenzi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Přidělení recenzí
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 51%;
            border-style: solid;
        }
        .auto-style3 {
            width: 79px;
        }
        .auto-style5 {
            text-align: left;
        }
        .auto-style6 {
            width: 79px;
            text-align: left;
        }
        .auto-style7 {
            width: 69%;
        }
        .auto-style9 {
            width: 389px;
        }
        .auto-style10 {
            width: 389px;
            text-align: right;
        }
        .auto-style11 {
            width: 104px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <div align="center">
    <h2 class="auto-style1">Přidělení recenzí</h2>


    <table align="center" class="auto-style2">
        <tr>
            <td class="auto-style6">Vydání:</td>
            <td>
                <div class="auto-style5">
                <asp:DropDownList ID="DDL1_vydani" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Name">
                </asp:DropDownList>
                </div>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Vydani]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style5">
                <asp:Button ID="Btn_hledatClanky" runat="server" Text="Hledat" />
            </td>
        </tr>
    </table>
         <br />
        <strong>ČLÁNKY</strong><br />
    <br />
    <div>


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Žádné datové záznamy k zobrazení." AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="nazev" HeaderText="Název článku" SortExpression="nazev" />
            <asp:BoundField DataField="status_clanek" HeaderText="Stav" SortExpression="status_clanek" />
            <asp:BoundField DataField="Name" HeaderText="Vydání" SortExpression="Name" />
            <asp:BoundField DataField="prijmeni" HeaderText="Příjmení au." SortExpression="prijmeni" />
            <asp:BoundField DataField="jmeno" HeaderText="Jméno au." SortExpression="jmeno" />
            <asp:CommandField ShowSelectButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Clanky] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Clanky] ([autor_id], [vydani_id], [nazev], [filePath], [Datum], [status_clanek]) VALUES (@autor_id, @vydani_id, @nazev, @filePath, @Datum, @status_clanek)" SelectCommand="SELECT Clanky.Id, Clanky.autor_id, Clanky.vydani_id, Clanky.nazev, Clanky.filePath, Clanky.Datum, Clanky.status_clanek, Vydani.Name, Users.jmeno, Users.prijmeni, Users.role FROM Vydani INNER JOIN Clanky ON Clanky.vydani_id = Vydani.Id INNER JOIN Users ON Clanky.autor_id = Users.id
WHERE ([Name] = @Name)" UpdateCommand="UPDATE [Clanky] SET [autor_id] = @autor_id, [vydani_id] = @vydani_id, [nazev] = @nazev, [filePath] = @filePath, [Datum] = @Datum, [status_clanek] = @status_clanek WHERE [Id] = @Id">
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
            <asp:ControlParameter ControlID="DDL1_vydani" DefaultValue="*" Name="Name" PropertyName="SelectedValue" />
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
        Počet přidělených recenzentů:
        <asp:Label ID="Lbl_pocPridRecenzentu" runat="server"></asp:Label>
    <br />
        <strong>
        <br />
        RECENZENTI</strong><br />

        <br />
        <table class="auto-style7">
            <tr>
 
                <td class="auto-style9">
                    <div class="auto-style5">
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" EmptyDataText="Žádné datové záznamy k zobrazení." AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="423px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
            <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:CommandField ShowSelectButton="True" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [id] = @id" InsertCommand="INSERT INTO [Users] ([role], [email], [jmeno], [prijmeni], [hesloHash]) VALUES (@role, @email, @jmeno, @prijmeni, @hesloHash)" SelectCommand="SELECT id, role, email, jmeno, prijmeni, hesloHash FROM Users WHERE (role = 'recenzent')" UpdateCommand="UPDATE [Users] SET [role] = @role, [email] = @email, [jmeno] = @jmeno, [prijmeni] = @prijmeni, [hesloHash] = @hesloHash WHERE [id] = @id">
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
                </td>
                <td class="auto-style11">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="Calendar1_SelectionChanged" ShowGridLines="True" Width="220px">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    </asp:Calendar>
                </td>
            </tr>
            <tr>
               
                <td class="auto-style10"><strong>Datum vypracování posudku:</strong></td>
                <td class="auto-style11">
                    <asp:Label ID="Lbl_datum" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                
                <td class="auto-style10">
                    <asp:Label ID="Lbl_zprava" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:Button ID="Btn_priradRecenzenta" runat="server" Text="Přiřaď recenzenta" OnClick="Btn_priradRecenzenta_Click" />
                </td>
            </tr>
        </table>
    <br />
    <br />
</div>

</asp:Content>

