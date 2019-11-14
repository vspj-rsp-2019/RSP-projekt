<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ZpravyRecenzentum.aspx.cs" Inherits="Recenze_ZpravyRecenzentum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 55%;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            width: 123px;
        }
        .auto-style5 {
            width: 47%;
        }
        .auto-style7 {
            width: 73%;
            height: 107px;
        }
        .auto-style8 {
            width: 347px;
        }
        .auto-style9 {
            width: 123px;
            height: 39px;
        }
        .auto-style10 {
            height: 39px;
        }
    .auto-style11 {
        text-align: left;
        width: 947px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h2 class="auto-style1">Zprávy recenzentům</h2>
    <br />

       <div class="auto-style11">


        <br />
    <table class="auto-style5" align="center">
            <tr>
                <td>

                    <div class="auto-style1">

        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource2" EmptyDataText="Žádné datové záznamy k zobrazení." AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" Width="423px" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
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
            </tr>
    </table>
  
    <br />
    <table align="center" class="auto-style2">
        <tr>
            <td class="auto-style4"><strong>Text zprávy:</strong></td>
            <td>
                <asp:TextBox ID="Tb_zpravaRedaktora" runat="server" TextMode="MultiLine" Width="362px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style9"><strong>Recenzent:</strong><asp:Label ID="Lbl_recenzent" runat="server" Visible="False"></asp:Label>
            </td>
            <td class="auto-style10">
                <asp:Label ID="Lbl_prijmeni" runat="server"></asp:Label>
&nbsp;<asp:Label ID="Lbl_jmeno" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Label ID="Lbl_status" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Button ID="Btn_posliZpravu" runat="server" OnClick="Btn_posliZpravu_Click" Text="Pošli zprávu" />
            </td>
        </tr>
    </table>
    <br />

    <h2 class="auto-style1">Předchozí zprávy s recenzentem</h2>


        <table align="center">
            <tr>
                <td>
                    <div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Ž&#225;dn&#233; datov&#233; z&#225;znamy k zobrazen&#237;." AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="ZpravaRedaktoraDatum" HeaderText="Datum zprávy" SortExpression="ZpravaRedaktoraDatum" DataFormatString="{0:d}" />
            <asp:BoundField DataField="ZpravaRecenzentaDatum" HeaderText="Datum odpovědi" SortExpression="ZpravaRecenzentaDatum" DataFormatString="{0:d}" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [ZpravyRecenzentum] WHERE [Id] = @Id" InsertCommand="INSERT INTO [ZpravyRecenzentum] ([ZpravaRedaktora], [ZpravaRecenzenta], [ZpravaRedaktoraDatum], [ZpravaRecenzentaDatum], [Recenzent_id]) VALUES (@ZpravaRedaktora, @ZpravaRecenzenta, @ZpravaRedaktoraDatum, @ZpravaRecenzentaDatum, @Recenzent_id)" SelectCommand="SELECT [Id], [ZpravaRedaktora], [ZpravaRecenzenta], [ZpravaRedaktoraDatum], [ZpravaRecenzentaDatum], [Recenzent_id] FROM [ZpravyRecenzentum] WHERE ([Recenzent_id] = @Recenzent_id)" UpdateCommand="UPDATE [ZpravyRecenzentum] SET [ZpravaRedaktora] = @ZpravaRedaktora, [ZpravaRecenzenta] = @ZpravaRecenzenta, [ZpravaRedaktoraDatum] = @ZpravaRedaktoraDatum, [ZpravaRecenzentaDatum] = @ZpravaRecenzentaDatum, [Recenzent_id] = @Recenzent_id WHERE [Id] = @Id">
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
            <asp:ControlParameter ControlID="Lbl_recenzent" Name="Recenzent_id" PropertyName="Text" Type="Int32" />
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

           <table align="center" class="auto-style7">
               <tr>
                   <td class="auto-style8"><strong>Zpráva redaktora</strong></td>
                   <td><strong>Odpověď recenzenta</strong></td>
               </tr>
               <tr>
                   <td class="auto-style8">
                       <asp:TextBox ID="TB_textRedaktora" runat="server" Height="68px" TextMode="MultiLine" style = "resize:none" Width="333px" ReadOnly="True"></asp:TextBox>
                   </td>
                   <td>
                       <asp:TextBox ID="TB_textRecenzenta" runat="server" Height="68px" TextMode="MultiLine" style = "resize:none" Width="333px" ReadOnly="True"></asp:TextBox>
                   </td>
               </tr>
           </table>
            <br /><br />


</asp:Content>

