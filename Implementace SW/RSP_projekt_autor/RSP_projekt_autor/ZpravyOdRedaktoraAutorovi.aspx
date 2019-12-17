<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ZpravyOdRedaktoraAutorovi.aspx.cs" Inherits="ZpravyOdRedaktoraAutorovi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Zprávy od Redaktora
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style7 {
            width: 73%;
            height: 107px;
        }
        .auto-style8 {
            width: 347px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">

    <h1 class="auto-style1">Zprávy od redaktora</h1>
   
    <br />
    <table align="center" class="auto-style2">
        <tr>
            <td>

        <div align="center">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" EmptyDataText="Neevidujeme žádné záznamy." OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="ZpravaRedaktoraDatum" HeaderText="Datum zprávy" SortExpression="ZpravaRedaktoraDatum" />
                    <asp:BoundField DataField="ZpravaAutoraDatum" HeaderText="Datum odpovědi" SortExpression="ZpravaAutoraDatum" />
                    <asp:CheckBoxField DataField="Odpovezeno" HeaderText="Odpovězeno" SortExpression="Odpovezeno" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [ZpravaRedaktora], [ZpravaAutora], [ZpravaRedaktoraDatum], [ZpravaAutoraDatum], 
[Autor_id], [Odpovezeno] FROM [ZpravyAutorum] WHERE ([Autor_id] = @Autor_id)">
                <SelectParameters>
                    <asp:SessionParameter Name="Autor_id" SessionField="UserID" />
                </SelectParameters>
            </asp:SqlDataSource>
            </div>
                 </td>
        </tr>
    </table>
    <br /><br />
    <table align="center" class="auto-style7">
               <tr>
                   <td class="auto-style8"><strong>Zpráva redaktora</strong></td>
                   <td><strong>Odpověď autora </strong>
                       <asp:Button ID="Btn_poslatOdpoved" runat="server" Text="Poslat odpověď" OnClick="Btn_poslatOdpoved_Click" />
                   </td>
               </tr>
               <tr>
                   <td class="auto-style8">
                       <asp:TextBox ID="TB_textRedaktora" runat="server" Height="68px" TextMode="MultiLine" style = "resize:none" Width="333px" ReadOnly="True"></asp:TextBox>
                   </td>
                   <td>
                       <asp:TextBox ID="TB_textRecenzenta" runat="server" Height="68px" TextMode="MultiLine" style = "resize:none" Width="333px"></asp:TextBox>
                   </td>
               </tr>
               <tr>
                   <td class="auto-style8">
                       <asp:Label ID="Lbl_status" runat="server" ForeColor="Red"></asp:Label>
                   </td>
                   <td>
                       <asp:Label ID="Lbl_zpravaOdpovezena" runat="server" Visible="False"></asp:Label>
                   </td>
               </tr>
           </table>
    <br />

</asp:Content>

