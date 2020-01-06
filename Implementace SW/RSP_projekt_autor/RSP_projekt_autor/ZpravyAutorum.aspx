<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeFile="ZpravyAutorum.aspx.cs" Inherits="ZpravyAutorum" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">Zprávy autorům</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            width: 55%;
            margin: auto;
        }
        .auto-style3 {
            text-align: left;
        }
        .auto-style4 {
            width: 123px;
        }
        .auto-style5 {
            width: 47%;
            margin: auto;
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
    <br /><h2 class="auto-style1">Zprávy autorům</h2><br/>
    <div class="auto-style11">
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID autora" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="jmeno" HeaderText="Jméno autora" SortExpression="jmeno" />
                <asp:BoundField DataField="prijmeni" HeaderText="Příjmení" SortExpression="prijmeni" />
                <asp:BoundField DataField="email" HeaderText="E-mail" SortExpression="email" />
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [id], [jmeno], [prijmeni], [email] FROM [Users] WHERE ([role] = @role)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="autor" Name="role" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
    <br />
    <table class="auto-style2">
        <tr>
            <td class="auto-style4"><strong>Text zprávy:</strong></td>
            <td><asp:TextBox ID="Tb_zpravaRedaktora" runat="server" TextMode="MultiLine" Width="362px"></asp:TextBox></td>
        </tr>
        <tr>
            <td class="auto-style9"><strong>Autor:</strong><asp:Label ID="Lbl_autor" runat="server" Visible="False"></asp:Label></td>
            <td class="auto-style10"><asp:Label ID="Lbl_prijmeni" runat="server"></asp:Label>&nbsp;<asp:Label ID="Lbl_jmeno" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align:center" colspan="2"><asp:Label ID="Lbl_status" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td style="text-align:center" colspan="2"><asp:Button ID="Btn_posliZpravu" runat="server" OnClick="Btn_posliZpravu_Click" Text="Pošli zprávu" /></td>
        </tr>
    </table>
    <br /><h2 class="auto-style1">Předchozí zprávy s autorem</h2>
    <table style="margin:auto">
            <tr>
                <td>
                    <div>
                        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" HorizontalAlign="Center" EmptyDataText="žádné zprávy k zobrazení">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                                <asp:BoundField DataField="ZpravaRedaktoraDatum" HeaderText="Datum zprávy" SortExpression="ZpravaRedaktoraDatum" />
                                <asp:BoundField DataField="ZpravaAutoraDatum" HeaderText="Datum odpovědi" SortExpression="ZpravaAutoraDatum" />
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
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [ZpravaRedaktora], [ZpravaAutora], [ZpravaRedaktoraDatum], 
[ZpravaAutoraDatum], [Autor_id] FROM [ZpravyAutorum] 
WHERE ([Autor_id] = @Autor_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="GridView1" Name="Autor_id" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    <br />
                    </div>
                </td>
            </tr>
    </table>
               <br />
    <table style="margin:auto">
               <tr>
                   <td class="auto-style8"><strong>Zpráva redaktora</strong></td>
                   <td><strong>Odpověď autora</strong></td>
               </tr>
               <tr>
                   <td class="auto-style8">
                       <asp:TextBox ID="TB_textRedaktora" runat="server" Height="68px" TextMode="MultiLine" style = "resize:none" Width="333px" ReadOnly="True"></asp:TextBox>
                   </td>
                   <td>
                       <asp:TextBox ID="TB_textRecenzenta" runat="server" Height="68px" TextMode="MultiLine" style = "resize:none" Width="333px" ReadOnly="True"></asp:TextBox>
                   </td>
               </tr>
    </table><br /><br />
   </div>
</asp:Content>