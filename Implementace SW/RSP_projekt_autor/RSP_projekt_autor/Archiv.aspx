<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Archiv.aspx.cs" Inherits="Archiv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Archiv
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 7px;
            margin-right: 7px;
            text-align: center;
        }
        .auto-style10 {
            width: 50px;
            height: 25px;
        }
        .auto-style11 {
            width: 70px;
            height: 25px;
        }
        .auto-style12 {
            width: 80px;
            height: 25px;
        }
         .tabulka_archiv{
            margin:auto;
        }
    </style>
    </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server" EnableViewState="True">
    <br />
        <h2 class="auto-style1">Archiv aktuálního roku časopisu</h2>
    <br />
    
    <div>
        <!-- tabulka nastavena tak, že hlavička zarovnána na střed a ostatní řádky vlevo -->
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="Žádné datové záznamy k zobrazení." ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True" HorizontalAlign="Center">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Název vydání" SortExpression="Name" />
                <asp:BoundField DataField="Popis" HeaderText="Popis" SortExpression="Popis" />
                <asp:HyperLinkField DataNavigateUrlFields="filePath" DataTextField="filePath" DataTextFormatString="Otevřít" HeaderText="Vydání" NavigateUrl="filePath" Target="_blank" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>           
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />            
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" />  
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Vydani] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Vydani] ([Name], [Archiv], [Popis], [filePath]) VALUES (@Name, @Archiv, @Popis, @filePath)" SelectCommand="SELECT [Id], [Name], [Archiv], [Popis], [filePath] FROM [Vydani] WHERE Archiv = 1" UpdateCommand="UPDATE [Vydani] SET [Name] = @Name, [Archiv] = @Archiv, [Popis] = @Popis, [filePath] = @filePath WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Archiv" Type="Boolean" />
                <asp:Parameter Name="Popis" Type="String" />
                <asp:Parameter Name="filePath" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Archiv" Type="Boolean" />
                <asp:Parameter Name="Popis" Type="String" />
                <asp:Parameter Name="filePath" Type="String" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
        <br />
        <div >
                <table class="tabulka_archiv"> <!-- umístění tabulky na střed -->
                        <caption>
                            <h2>Archiv dalších ročníků</h2>
                        </caption>
                    <tr>
                        <td class="auto-style10"><strong>2018</strong></td>
                        <td class="auto-style11"><strong>Ročník 9</strong></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/6942">Číslo 1</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/6914">Číslo 2</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/7192">Číslo 3</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/7408">Číslo 4</a></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"><strong>2017</strong></td>
                        <td class="auto-style11"><strong>Ročník 8</strong></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5966">Číslo 1</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/6130">Číslo 2</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/6282">Číslo 3</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/6564">Číslo 4</a></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"><strong>2016</strong></td>
                        <td class="auto-style11"><strong>Ročník 7</strong></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5087">Číslo 1</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5303">Číslo 2</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/6027">Číslo 3</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5711">Číslo 4</a></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"><strong>2015</strong></td>
                        <td class="auto-style11"><strong>Ročník 6</strong></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5083">Číslo 1</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5084">Číslo 2</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5085">Číslo 3</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5086">Číslo 4</a></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"><strong>2014</strong></td>
                        <td class="auto-style11"><strong>Ročník 5</strong></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5079">Číslo 1</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5080">Číslo 2</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5081">Číslo 3</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5082">Číslo 4</a></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"><strong>2013</strong></td>
                        <td class="auto-style11"><strong>Ročník 4</strong></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5075">Číslo 1</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5076">Číslo 2</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5077">Číslo 3</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5078">Číslo 4</a></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"><strong>2012</strong></td>
                        <td class="auto-style11"><strong>Ročník 3</strong></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5071">Číslo 1</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5072">Číslo 2</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5121">Číslo 3</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5074">Číslo 4</a></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"><strong>2011</strong></td>
                        <td class="auto-style11"><strong>Ročník 2</strong></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5067">Číslo 1</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5068">Číslo 2</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5069">Číslo 3</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5070">Číslo 4</a></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"><strong>2010</strong></td>
                        <td class="auto-style11"><strong>Ročník 1</strong></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5063">Číslo 1</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5064">Číslo 2</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5065">Číslo 3</a></td>
                        <td class="auto-style12"><a href="https://www.vspj.cz/soubory/download/id/5066">Číslo 4</a></td>                   
                    </tr>
                </table>
        </div>   
    <br /><br />
</asp:Content>
