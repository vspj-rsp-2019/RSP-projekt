<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ZpravyOdRedaktora.aspx.cs" Inherits="ZpravyOdRedaktora" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Zprávy od redaktora
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
        <asp:GridView ID="GV_zpravyRedaktora" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Žádné datové záznamy k zobrazení." CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GV_zpravyRedaktora_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" InsertVisible="False" />
                <asp:BoundField DataField="ZpravaRedaktoraDatum" HeaderText="Datum zprávy" SortExpression="ZpravaRedaktoraDatum" DataFormatString="{0:d}" />
                <asp:BoundField DataField="ZpravaRecenzentaDatum" HeaderText="Datum odpovědi" SortExpression="ZpravaRecenzentaDatum" DataFormatString="{0:d}" />
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
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ZpravyRecenzentum] WHERE [Id] = @Id" InsertCommand="INSERT INTO [ZpravyRecenzentum] ([ZpravaRedaktora], [ZpravaRecenzenta], [ZpravaRedaktoraDatum], [ZpravaRecenzentaDatum], [Recenzent_id]) VALUES (@ZpravaRedaktora, @ZpravaRecenzenta, @ZpravaRedaktoraDatum, @ZpravaRecenzentaDatum, @Recenzent_id)" SelectCommand="SELECT [Id], [ZpravaRedaktora], [ZpravaRecenzenta], [ZpravaRedaktoraDatum], [ZpravaRecenzentaDatum], [Recenzent_id], [Odpovezeno] FROM [ZpravyRecenzentum] WHERE ([Recenzent_id] = @Recenzent_id)" UpdateCommand="UPDATE [ZpravyRecenzentum] SET [ZpravaRedaktora] = @ZpravaRedaktora, [ZpravaRecenzenta] = @ZpravaRecenzenta, [ZpravaRedaktoraDatum] = @ZpravaRedaktoraDatum, [ZpravaRecenzentaDatum] = @ZpravaRecenzentaDatum, [Recenzent_id] = @Recenzent_id WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ZpravaRedaktora" Type="String" />
            <asp:Parameter Name="ZpravaRecenzenta" Type="String" />
            <asp:Parameter DbType="Date" Name="ZpravaRedaktoraDatum" />
            <asp:Parameter DbType="Date" Name="ZpravaRecenzentaDatum" />
            <asp:Parameter Name="Recenzent_id" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Recenzent_id" SessionField="UserID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="ZpravaRedaktora" Type="String" />
            <asp:Parameter Name="ZpravaRecenzenta" Type="String" />
            <asp:Parameter DbType="Date" Name="ZpravaRedaktoraDatum" />
            <asp:Parameter DbType="Date" Name="ZpravaRecenzentaDatum" />
            <asp:Parameter Name="Recenzent_id" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

            </td>
        </tr>
    </table>
    <br /><br />
           <table align="center" class="auto-style7">
               <tr>
                   <td class="auto-style8"><strong>Zpráva redaktora</strong></td>
                   <td><strong>Odpověď recenzenta </strong>
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

