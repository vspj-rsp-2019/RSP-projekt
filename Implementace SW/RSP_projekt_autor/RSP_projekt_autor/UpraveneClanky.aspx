<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpraveneClanky.aspx.cs" Inherits="UpraveneClanky" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            width: 100%;
        }
        .auto-style7 {
            width: 61%;
        }
        .auto-style9 {
            width: 344px;
            text-align: left;
        }
        .auto-style11 {
            font-size: large;
        }
        .auto-style12 {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h2 class="auto-style5">Nahrání upraveného článku</h2>
    <br /><br />
        <div align="center">    <strong><span class="auto-style6"><span class="auto-style11">Nahrát upravený článek</span><br />
            </span></strong>
            <table align="center" border="1" class="auto-style7">
                <tr>
                    <td class="auto-style9">Název článku:<strong>
                        <asp:Label ID="Lb_nazevClanku" runat="server"></asp:Label>
&nbsp;</td>
                    </strong>
                    <td class="auto-style12">Verze:<strong>
                        <asp:Label ID="Lb_verze" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">    <strong>
        <asp:FileUpload ID="FileUpload" runat="server" />
                        </strong></td>
                    <td class="auto-style5">
        <asp:Button ID="BTN_uploadFile" runat="server" Text="Potvrdit" OnClick="Upload" Width="119px" />
                    </td>
                </tr>
            </table>
            </strong>
            <asp:Label ID="Lb_status" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:Label ID="Lb_datum" runat="server" Visible="False"></asp:Label>
            <br /><strong><span class="auto-style11">Články k upravení</span><span class="auto-style6"><br />
            </span></strong>
            <asp:GridView ID="GV_clanky" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id,Id_cl_status" DataSourceID="SqlDataSource1" EmptyDataText="Žádné datové záznamy k zobrazení." ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GV_clanky_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Id článku" ReadOnly="True" SortExpression="Id" InsertVisible="False" />
                    <asp:BoundField DataField="vydani_id" HeaderText="vydani_id" SortExpression="vydani_id" />
                    <asp:BoundField DataField="Expr1" HeaderText="Název článku" SortExpression="Expr1" />
                    <asp:BoundField DataField="Datum" HeaderText="Datum vložení" SortExpression="Datum" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="nazev" HeaderText="Stav článku" SortExpression="nazev" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Clanky] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Clanky] ([autor_id], [vydani_id], [nazev], [filePath], [Datum], [status_clanek], [datum_zah_rec_riz], [datum_uk_rec_riz]) VALUES (@autor_id, @vydani_id, @nazev, @filePath, @Datum, @status_clanek, @datum_zah_rec_riz, @datum_uk_rec_riz)" SelectCommand="SELECT Clanky.Id, Clanky.autor_id, Clanky.vydani_id, Clanky.nazev AS Expr1, Clanky.filePath, Clanky.Datum, Clanky.status_clanek, Clanky.datum_zah_rec_riz, Clanky.datum_uk_rec_riz, Clanky_Status.Id_cl_status, Clanky_Status.nazev FROM Clanky INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status WHERE (Clanky.autor_id = @autor_id) AND (Clanky.status_clanek = 1 OR Clanky.status_clanek = 7 OR Clanky.status_clanek = 9)" UpdateCommand="UPDATE [Clanky] SET [autor_id] = @autor_id, [vydani_id] = @vydani_id, [nazev] = @nazev, [filePath] = @filePath, [Datum] = @Datum, [status_clanek] = @status_clanek, [datum_zah_rec_riz] = @datum_zah_rec_riz, [datum_uk_rec_riz] = @datum_uk_rec_riz WHERE [Id] = @Id">
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
                    <asp:Parameter DbType="Date" Name="datum_zah_rec_riz" />
                    <asp:Parameter DbType="Date" Name="datum_uk_rec_riz" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="autor_id" Type="Int32" />
                    <asp:Parameter Name="vydani_id" Type="Int32" />
                    <asp:Parameter Name="nazev" Type="String" />
                    <asp:Parameter Name="filePath" Type="String" />
                    <asp:Parameter DbType="Date" Name="Datum" />
                    <asp:Parameter Name="status_clanek" Type="Int32" />
                    <asp:Parameter DbType="Date" Name="datum_zah_rec_riz" />
                    <asp:Parameter DbType="Date" Name="datum_uk_rec_riz" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="-1" Name="autor_id" SessionField="UserID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />



</asp:Content>

