<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VypracovaniRecenze.aspx.cs" Inherits="VypracovaniRecenze" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Vypracování recenze
</asp:Content>
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
            text-align: center;
        }
         .auto-style7 {
             text-align: justify;
             margin-left: 125;
         }
         .auto-style8 {
             text-align: left;
         }
         .auto-style9 {
             text-align: left;
             height: 365px;
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
    <h4 class="auto-style5">Ke zpracování:</h4>
    <p class="auto-style6">
     <div class="auto-style10"><asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" DataKeyNames="Id_Clanku,Id_Recenzenta" EmptyDataText="Aktuálně neevidujeme žádné záznamy.">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="Id_Clanku" HeaderText="Id_Clanku" SortExpression="Id_Clanku" ReadOnly="True" />
                <asp:BoundField DataField="Datum_vypracovani" HeaderText="Datum_vypracovani" SortExpression="Datum_vypracovani" />
                <asp:BoundField DataField="Id_Recenzenta" HeaderText="Id_Recenzenta" ReadOnly="True" SortExpression="Id_Recenzenta" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id_Clanku], [Datum_vypracovani], [Id_Recenzenta] 
FROM [PrideleneClanky] 
WHERE ([Id_Recenzenta] = @Id_Recenzenta)">
            <SelectParameters>
                <asp:SessionParameter Name="Id_Recenzenta" SessionField="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
  
 
         <div class="auto-style8">
             <br />
             <strong>Vyberte článek a zvolte hodnocení:</strong></div>
         <asp:Panel ID="Panel1" runat="server" CssClass="auto-style7" Height="374px" Width="619px">
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
                 <br />
                 <asp:Button ID="btn_odeslatRecenzi" runat="server" OnClick="btn_odeslatRecenzi_Click" Text="Odeslat recenzi" Width="288px" />
                 <br />
                 <asp:Label ID="lbl_potvrzeni" runat="server"></asp:Label>
                 <br />
             </div>
         </asp:Panel>
         <div class="auto-style8">
             <br />
            <h4>Zpracované recenze:</h4>
             <br />
             <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                 <AlternatingRowStyle BackColor="White" />
                 <Columns>
                     <asp:CommandField ShowSelectButton="True" />
                     <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                     <asp:BoundField DataField="Clanek_id" HeaderText="Clanek_id" SortExpression="Clanek_id" />
                     <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                     <asp:CheckBoxField DataField="Zverejneno" HeaderText="Zverejneno" SortExpression="Zverejneno" />
                     <asp:BoundField DataField="Aktualnost" HeaderText="Aktualnost" SortExpression="Aktualnost" />
                     <asp:BoundField DataField="Originalita" HeaderText="Originalita" SortExpression="Originalita" />
                     <asp:BoundField DataField="OdbornaUroven" HeaderText="OdbornaUroven" SortExpression="OdbornaUroven" />
                     <asp:BoundField DataField="JazykovaUroven" HeaderText="JazykovaUroven" SortExpression="JazykovaUroven" />
                     <asp:BoundField DataField="filePath" HeaderText="filePath" SortExpression="filePath" />
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
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Clanek_id], [Datum], [Zverejneno], [Aktualnost], [Originalita], [OdbornaUroven], [JazykovaUroven], [filePath] FROM [Recenze] WHERE ([Recenzent_id] = @Recenzent_id)">
                 <SelectParameters>
                     <asp:SessionParameter Name="Recenzent_id" SessionField="UserID" Type="Int32" />
                 </SelectParameters>
             </asp:SqlDataSource>
             <br />
             <br />
             <h4>Text recenze </h4>
        (Vyberte recenzi pro zobrazení textu)<br />
        <asp:TextBox ID="TB_textRecenze" runat="server" Height="111px" TextMode="MultiLine" Width="500px"></asp:TextBox>
             <br />
        <br />
         </div>
  
 
        </div>
</asp:Content>

