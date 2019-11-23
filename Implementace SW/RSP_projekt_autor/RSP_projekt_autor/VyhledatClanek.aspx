<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VyhledatClanek.aspx.cs" Inherits="VyhledatClanek" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Vyhledat článek
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            margin-left: 7px;
            margin-right: 7px;
        }
        .auto-style6 {
            width: 4px;
        }
        .auto-style7 {
            width: 333px;
            height: 26px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style9 {
            width: 4px;
            height: 26px;
        }
    .auto-style10 {
        margin-left: 7px;
        margin-right: 7px;
        text-align: center;
    }
    .auto-style11 {
        width: 333px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">


    <p class="auto-style5"></p>
    <h4 class="auto-style10">Vyhledání článku</h4>
<p class="auto-style10">&nbsp;</p>
    <p class="auto-style10">
        <asp:Label ID="lbl_zadejID" runat="server" Text="Zadejte ID článku:"></asp:Label>
</p>

    <table>
        <tr><td class="auto-style7"></td><td class="auto-style8"></td><td class="auto-style9"></td>
            <td class="auto-style8"><asp:TextBox ID="tb_IDclanek" runat="server" Width="213px"></asp:TextBox></td>
            <tr><td class="auto-style11"></td><td></td><td class="auto-style6"></td>
                <td>
                    <asp:Button ID="btn_vyhledat" runat="server" Text="Vyhledat" Width="213px" OnClick="btn_vyhledat_Click" /></td>
            </tr>
        </tr>

    </table>
   
    <p class="auto-style5"></p>
<p class="auto-style5"></p>
<p class="auto-style10">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="VyhledatClanekdleID" EmptyDataText="Článek nenalezen." ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Visible="False">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Datum" HeaderText="Datum vložení" SortExpression="Datum" />
            <asp:BoundField DataField="autor_id" HeaderText="ID autora" SortExpression="autor_id" />
            <asp:BoundField DataField="prijmeni" HeaderText="Příjmení autora" SortExpression="prijmeni" />
            <asp:BoundField DataField="jmeno" HeaderText="Jméno autora" SortExpression="jmeno" />
            <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" Visible="False" />
            <asp:BoundField DataField="datum_zah_rec_riz" HeaderText="Datum zahájení RR" SortExpression="datum_zah_rec_riz" />
            <asp:BoundField DataField="datum_uk_rec_riz" HeaderText="Datum ukončení RR" SortExpression="datum_uk_rec_riz" />
            <asp:BoundField DataField="vydani_id" HeaderText="ID vydání" SortExpression="vydani_id" />
            <asp:BoundField DataField="Expr1" HeaderText="Status článku" SortExpression="Expr1" />
            <asp:HyperLinkField DataNavigateUrlFields="filePath" DataTextField="filePath" DataTextFormatString="Otevřít" HeaderText="Odkaz" NavigateUrl="filePath" Target="_blank" />
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
    <asp:SqlDataSource ID="VyhledatClanekdleID" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Clanky.Datum, Users.jmeno, 
Users.prijmeni, Clanky.filePath, 
Clanky.datum_zah_rec_riz, Clanky.datum_uk_rec_riz, Clanky.Id, Clanky.autor_id, Clanky.vydani_id,
Clanky_Status.nazev AS Expr1 
FROM Clanky INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status 
INNER JOIN Users ON Clanky.autor_id = Users.id 
WHERE (Clanky.Id = @Id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="tb_IDclanek" Name="Id" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
<p class="auto-style10">
    <asp:Label ID="lbl_chyba" runat="server" ForeColor="Red" Text="Nastala chyba. Kontaktujte helpdesk." Visible="False"></asp:Label>
</p>

   

   

</asp:Content>

