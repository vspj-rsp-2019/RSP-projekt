<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="VypracovaniRecenze.aspx.cs" Inherits="VypracovaniRecenze" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">Vypracování recenze</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .auto-style5 {
            margin-left: 7px;
            margin-right: 7px;
             font-family: Calibri;
             color: red;
         }
        .auto-style6 {
            margin-left: 7px;
            margin-right: 7px;
            text-align: right;
        }
         .auto-style7 {
             text-align: justify;
             margin-left: 7px;
         }
         .auto-style8 {
             text-align: left;
         }
         .auto-style9 {
             text-align: left;
             height: 438px;
             width: 618px;
         }
         .auto-style10 {
             margin-left: 7px;
             margin-right: 7px;
             text-align: left;
         }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h3 class="auto-style5">Ke zpracování:</h3>
    <p class="auto-style6">
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Aktualizovat</asp:LinkButton></p>
     <div class="auto-style10"><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="Id_Clanku,Id_Recenzenta" EmptyDataText="Aktuálně neevidujeme žádné záznamy.">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id_Clanku" HeaderText="ID Článku" SortExpression="Id_Clanku" ReadOnly="True" />
                <asp:BoundField DataField="Datum_vypracovani" HeaderText="Datum vypracováni" SortExpression="Datum_vypracovani" />
                <asp:BoundField DataField="Id_Recenzenta" HeaderText="ID Recenzenta" ReadOnly="True" SortExpression="Id_Recenzenta" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id_Clanku], [Datum_vypracovani], [Id_Recenzenta] 
FROM [PrideleneClanky] 
WHERE ([Id_Recenzenta] = @Id_Recenzenta AND Zpracovano = 0)">
            <SelectParameters>
                <asp:SessionParameter Name="Id_Recenzenta" SessionField="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
  
 
         <div class="auto-style8">
             <br />
             <strong>Vyberte článek a zvolte hodnocení:</strong></div>
         <asp:Panel ID="Panel1" runat="server" CssClass="auto-style7" Height="418px" Width="619px">
             <div class="auto-style9">
                 <br />
                 Aktuálnost:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="ddl_aktualnost" runat="server">
                     <asp:ListItem>1</asp:ListItem>
                     <asp:ListItem>2</asp:ListItem>
                     <asp:ListItem>3</asp:ListItem>
                     <asp:ListItem>4</asp:ListItem>
                     <asp:ListItem>5</asp:ListItem>
                 </asp:DropDownList>
                 <br />
                 Originalita:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="ddl_originalita" runat="server">
                     <asp:ListItem>1</asp:ListItem>
                     <asp:ListItem>2</asp:ListItem>
                     <asp:ListItem>3</asp:ListItem>
                     <asp:ListItem>4</asp:ListItem>
                     <asp:ListItem>5</asp:ListItem>
                 </asp:DropDownList>
                 <br />
                 Odborná úroveň:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="ddl_odburoven" runat="server">
                     <asp:ListItem Value="1"></asp:ListItem>
                     <asp:ListItem Value="2"></asp:ListItem>
                     <asp:ListItem Value="3"></asp:ListItem>
                     <asp:ListItem Value="4"></asp:ListItem>
                     <asp:ListItem Value="5"></asp:ListItem>
                 </asp:DropDownList>
                 <br />
                 Jazyková úroveň:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:DropDownList ID="ddl_jazykuroven" runat="server">
                     <asp:ListItem Value="1"></asp:ListItem>
                     <asp:ListItem Value="2"></asp:ListItem>
                     <asp:ListItem Value="3"></asp:ListItem>
                     <asp:ListItem Value="4"></asp:ListItem>
                     <asp:ListItem Value="5"></asp:ListItem>
                 </asp:DropDownList>
                 <br />
                 <br />
                 <em>Komentář recenze:</em><br />
                 <asp:TextBox ID="tbx_komentarRecenze" runat="server" Height="82px" Width="576px"></asp:TextBox>
                 <br />
                 Datum vypracování:
                 <asp:Label ID="lbl_aktDatum" runat="server"></asp:Label>
                 <br />
                 <asp:Label ID="lbl_recenzentID" runat="server" Visible="False"></asp:Label>
                 <br />
                 <strong>Závěřečné rozhodnutí:</strong><br />
                 <asp:DropDownList ID="ddl_zaver" runat="server">
                     <asp:ListItem>doporučeno</asp:ListItem>
                     <asp:ListItem>nedoporučeno</asp:ListItem>
                     <asp:ListItem>přepracovat</asp:ListItem>
                 </asp:DropDownList>
                 <br />
                 <br />
                 <asp:Button ID="btn_odeslatRecenzi" runat="server" OnClick="btn_odeslatRecenzi_Click" Text="Odeslat recenzi" Width="288px" />
                 <br />
                 <asp:Label ID="lbl_potvrzeni" runat="server"></asp:Label>
                 <br />
             </div>
         </asp:Panel>
         <div class="auto-style8">
            <h3>Zpracované recenze:</h3>
             <br />
             <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" HorizontalAlign="Center">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:CommandField ShowSelectButton="True" />
                     <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                     <asp:BoundField DataField="Clanek_id" HeaderText="Článek ID" SortExpression="Clanek_id" />
                     <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                     <asp:CheckBoxField DataField="Zverejneno" HeaderText="Zveřejněno" SortExpression="Zverejneno" />
                     <asp:BoundField DataField="Aktualnost" HeaderText="Aktuálnost" SortExpression="Aktualnost" />
                     <asp:BoundField DataField="Originalita" HeaderText="Originalita" SortExpression="Originalita" />
                     <asp:BoundField DataField="OdbornaUroven" HeaderText="OdbornáÚroveň" SortExpression="OdbornaUroven" />
                     <asp:BoundField DataField="JazykovaUroven" HeaderText="JazykováÚroveň" SortExpression="JazykovaUroven" />
                     <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" />
                     <asp:BoundField DataField="Zaver" HeaderText="Závěr" SortExpression="Zaver" />
                 </Columns>
                 <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                 <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Center" />
                 <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                 <SortedAscendingCellStyle BackColor="#FDF5AC" />
                 <SortedAscendingHeaderStyle BackColor="#4D0000" />
                 <SortedDescendingCellStyle BackColor="#FCF6C0" />
                 <SortedDescendingHeaderStyle BackColor="#820000" />
             </asp:GridView>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Clanek_id], [Datum], [Zverejneno], [Aktualnost], [Originalita], [OdbornaUroven], [JazykovaUroven], [filePath], [Zaver] FROM [Recenze] WHERE ([Recenzent_id] = @Recenzent_id)">
                 <SelectParameters>
                     <asp:SessionParameter Name="Recenzent_id" SessionField="UserID" Type="Int32" />
                 </SelectParameters>
             </asp:SqlDataSource>
             <br />
             <h3 style="text-align:center">Text recenze <br />
        (Vyberte recenzi pro zobrazení textu)<br /></h3>
        <div style="text-align:center"><asp:TextBox ID="TB_textRecenze" runat="server" Height="111px" TextMode="MultiLine" Width="500px"></asp:TextBox>
        </div><br />
         </div>
        </div>
</asp:Content>

