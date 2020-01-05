<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="RecenzniRizeni2.aspx.cs" Inherits="RecenzniRizeni2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">Recenzní řízení</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 7px;
            margin-right: 7px;
        }
    .auto-style5 {
        margin-right: 0px;
        }
        .auto-style6 {
            margin-left: 7px;
            margin-right: 7px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server"><br />
     <h4 class="auto-style1">Články odeslané do RŘ, čekající na zahájení RŘ:</h4><br />
     <p>
         <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Aktuálně nejsou žádné data k zobrazení." ForeColor="#333333" GridLines="None" Width="925px" HorizontalAlign="Center">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                 <asp:CommandField ShowSelectButton="True" />
                 <asp:BoundField DataField="Id" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                 <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                 <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" />
                 <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
                 <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" Visible="False" />
                 <asp:BoundField DataField="nazev" HeaderText="Název článku" SortExpression="nazev" />
                 <asp:BoundField DataField="datum_zah_rec_riz" HeaderText="Datum zahájení RŘ" SortExpression="datum_zah_rec_riz" />
                 <asp:BoundField DataField="Expr1" HeaderText="Status článku" SortExpression="Expr1" />
                 <asp:HyperLinkField DataNavigateUrlFields="filePath" DataTextField="filePath" DataTextFormatString="Otevřít" NavigateUrl="filePath" Target="_blank" />
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
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Clanky.Datum, Users.jmeno, Users.prijmeni, 
Clanky.filePath, Clanky.nazev, Clanky.datum_zah_rec_riz, Clanky.Id, 
Clanky_Status.nazev AS Expr1 FROM Clanky 
INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status 
INNER JOIN Users ON Clanky.autor_id = Users.id 
WHERE (Clanky_Status.Id_cl_status = 2)"></asp:SqlDataSource>
     </p>
     <p class="auto-style1"><strong><br />Zvolte prosím datum zahájení RŘ:</strong></p><br />
     <p class="auto-style1">
         <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" OnSelectionChanged="Calendar1_SelectionChanged">
             <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
             <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
             <OtherMonthDayStyle ForeColor="#CC9966" />
             <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
             <SelectorStyle BackColor="#FFCC66" />
             <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
             <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
         </asp:Calendar>
     </p>
     <p class="auto-style1"><asp:Label ID="lbl_zahRR" runat="server" ForeColor="Blue" Text="Vyberte datum!"></asp:Label></p><br />
     <p class="auto-style1">
         <asp:Button ID="btn_odeslatDoZahajeni" runat="server" BackColor="#33CC33" Text="Odeslat a zahájit RR" OnClick="btn_odeslatDoZahajeni_Click" />
     </p>
     <p class="auto-style1"><asp:Label ID="lbl_potvrzeni" runat="server"></asp:Label></p><br />
     <h4 class="auto-style1">Články u kterých je již zahájené RŘ, ale nejsou přiřazeni recenzenti:</h4>
     <br />
     <p>
         <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" EmptyDataText="Aktuálně nejsou žádné data k zobrazení." ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                 <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                 <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                 <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" />
                 <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
                 <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" Visible="False" />
                 <asp:BoundField DataField="nazev" HeaderText="Název čl." SortExpression="nazev" />
                 <asp:BoundField DataField="datum_zah_rec_riz" HeaderText="Datum zahájení RŘ" SortExpression="datum_zah_rec_riz" />
                 <asp:BoundField DataField="datum_uk_rec_riz" HeaderText="Datum ukončení RŘ" SortExpression="datum_uk_rec_riz" />
                 <asp:BoundField DataField="Expr1" HeaderText="Status článku" SortExpression="Expr1" />
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
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Clanky.Datum, Users.jmeno, Users.prijmeni, 
Clanky.filePath, Clanky.datum_zah_rec_riz, Clanky.datum_uk_rec_riz, Clanky.Id, Clanky.nazev,
Clanky_Status.nazev AS Expr1 FROM Clanky 
INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status 
INNER JOIN Users ON Clanky.autor_id = Users.id 
WHERE (Clanky_Status.Id_cl_status = 3)"></asp:SqlDataSource>
     </p><br />
     <h4 class="auto-style1">Články, u kterých probíhá RŘ:</h4><br />
    <p>
         <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource3" EmptyDataText="Aktuálně nejsou žádné data k zobrazení." ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                 <asp:CommandField ShowSelectButton="True" />
                 <asp:BoundField DataField="Id" HeaderText="ID článku" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                 <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                 <asp:BoundField DataField="jmeno" HeaderText="Jméno" SortExpression="jmeno" />
                 <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
                 <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" Visible="False" />
                 <asp:BoundField DataField="nazev" HeaderText="Název čl." SortExpression="nazev" />
                 <asp:BoundField DataField="datum_zah_rec_riz" HeaderText="Datum zahájení RŘ" SortExpression="datum_zah_rec_riz" />
                 <asp:BoundField DataField="datum_uk_rec_riz" HeaderText="Datum ukončení RŘ" SortExpression="datum_uk_rec_riz" />
                 <asp:BoundField DataField="Expr1" HeaderText="Status článku" SortExpression="Expr1" />
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
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Clanky.Datum, Users.jmeno, Users.prijmeni, 
Clanky.filePath, Clanky.datum_zah_rec_riz, Clanky.datum_uk_rec_riz, Clanky.Id, Clanky.nazev,
Clanky_Status.nazev AS Expr1 FROM Clanky 
INNER JOIN Clanky_Status ON Clanky.status_clanek = Clanky_Status.Id_cl_status 
INNER JOIN Users ON Clanky.autor_id = Users.id 
WHERE (Clanky_Status.Id_cl_status = 4)"></asp:SqlDataSource>
     </p><br />
     <p class="auto-style1">
         <asp:GridView ID="GridView4" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource4" EmptyDataText="Aktuálně nejsou žádné data k zobrazení." ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                 <asp:BoundField DataField="Id" HeaderText="ID recenze" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                 <asp:BoundField DataField="Clanek_id" HeaderText="ID článku" SortExpression="Clanek_id" />
                 <asp:BoundField DataField="Recenzent_id" HeaderText="ID recenzenta" SortExpression="Recenzent_id" />
                 <asp:BoundField DataField="Zaver" HeaderText="Závěr" SortExpression="Zaver" />
                 <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
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
         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Clanek_id], [Recenzent_id], [Zaver], [Datum] FROM [Recenze] WHERE ([Clanek_id] = @Id)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="GridView3" Name="Id" PropertyName="SelectedValue" />
             </SelectParameters>
         </asp:SqlDataSource>
     </p><br />
     <p class="auto-style1" style="text-align:center">
         <asp:Button ID="btn_schvalit" runat="server" BackColor="#33CC33" OnClick="btn_schvalit_Click" Text="Schválit článek" Width="373px" />
         <asp:Button ID="btn_zamitnout" runat="server" BackColor="#CC0000" Text="Zamítnout článek" OnClick="btn_zamitnout_Click" Width="355px" />
     </p>
     <p class="auto-style6"><asp:Label ID="lbl_zprava3" runat="server"></asp:Label></p>
     <br /><br />
  </asp:Content>