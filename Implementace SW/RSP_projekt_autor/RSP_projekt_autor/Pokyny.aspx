<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Pokyny.aspx.cs" Inherits="Pokyny" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Pokyny pro autory
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
                        
        .auto-style2 {
            margin-left: 7px;
            margin-right: 7px;
        }
   
        .auto-style3 {
            margin-left: 20px;
            margin-right: 20px;
            text-align: left;
            table-layout:auto
        }
   
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h3 class="auto-style2"> Pokyny pro autory</h3>
    <p> &nbsp;</p>
    <p class="auto-style2"> 
        <asp:LinkButton ID="liB_pokynyAutor" runat="server" OnClick="liB_pokynyAutor_Click">Pokyny pro přispěvatele</asp:LinkButton>
    </p>
    <p class="auto-style2"> 
        <asp:LinkButton ID="liB_sablona" runat="server" OnClick="liB_sablona_Click">Šablona</asp:LinkButton>
    </p>
    <p class="auto-style2"> 
        <asp:LinkButton ID="liB_recenRizeni" runat="server" OnClick="liB_recenRizeni_Click">Recenzní řízení</asp:LinkButton>
    </p>
    <p class="auto-style2"> 
        &nbsp;</p>
    <p class="auto-style3"> 
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SQL_temataZamereni" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Název" SortExpression="Name" />
                <asp:BoundField DataField="Popis" HeaderText="Tématické zaměření" SortExpression="Popis" />
                <asp:BoundField DataField="Termin_uzaverky" HeaderText="Termín uzávěrky" SortExpression="Termin_uzaverky" />
                <asp:BoundField DataField="Vychazi" HeaderText="Vychází" SortExpression="Vychazi" />
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
        <asp:SqlDataSource ID="SQL_temataZamereni" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Vydani.Name, Vydani.Popis, Uzaverka.Termin_uzaverky, Uzaverka.Vychazi FROM Uzaverka INNER JOIN Vydani ON Uzaverka.ID_vydani = Vydani.Id"></asp:SqlDataSource>
    </p> 


</asp:Content>

