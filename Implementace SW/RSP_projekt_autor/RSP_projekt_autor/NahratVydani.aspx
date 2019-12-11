<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NahratVydani.aspx.cs" Inherits="NahratVydani" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style5 {
        text-align: center;
    }
        .auto-style6 {
            width: 100%;
        }
        .auto-style7 {
            width: 510px;
        }
        .auto-style9 {
            width: 379px;
        }
        .auto-style10 {
            width: 142px;
        }
        .auto-style11 {
            width: 53%;
        }
        .auto-style12 {
            width: 314px;
        }
        .auto-style13 {
            width: 202px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <h2 class="auto-style5">Nahrání vydání časopisu do archivu</h2>
    <br /><br />

    <h4 class="auto-style5">Seznam nearchivovaných vydání bez PDF</h4>
            <table align="center" border="1" class="auto-style7">
            <tr>
                <td class="auto-style6">Vydání:</td>
                <td>
                    <div class="auto-style5">
                    <asp:DropDownList ID="DDL1_vydani" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Name" DataValueField="Id" Height="20px" Width="189px" OnSelectedIndexChanged="DDL1_vydani_SelectedIndexChanged">
                    </asp:DropDownList>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Vydani] WHERE Archiv = 0 AND filePath IS NULL"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
        <h3 class="auto-style5">Nahrát vydání v PDF</h3>
                <table align="center" border="1" class="auto-style7">
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="Lb_status" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                    </strong>
                    <td class="auto-style12">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">    <strong>
                    <asp:FileUpload ID="FileUpload" runat="server" />
                                    </strong></td>
                                <td class="auto-style5">
                    <asp:Button ID="BTN_uploadFile" runat="server" Text="Potvrdit" OnClick="Upload" Width="119px" />
                                </td>
                </tr>
            </table>

    <br />
    <div align="center">
            <asp:Label ID="Lb_upravaVydani" runat="server" ForeColor="Red"></asp:Label>
    </div>

    <br />
    <table align="center" class="auto-style11">
        <tr>
            <td class="auto-style13">Nearchivovaná vydání s PDF:</td>
            <td class="auto-style10">
                <asp:DropDownList ID="DDL_nearchivovane" runat="server" DataSourceID="SqlDataSource4" DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="DDL_nearchivovane_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Vydani] WHERE Archiv = 0 AND filePath IS NOT NULL"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="Btn_archivujVydani" runat="server" OnClick="Btn_archivujVydani_Click" Text="Archivuj vydání" />
            </td>
        </tr>
        <tr>
            <td class="auto-style13">Archivovaná vydání s PDF:</td>
            <td class="auto-style10">
                <asp:DropDownList ID="DDL_archivovane" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Id" OnSelectedIndexChanged="DDL_archivovane_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Vydani] WHERE Archiv = 1 AND filePath IS NOT NULL"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="Btn_odarchivujVydani" runat="server" OnClick="Btn_odarchivujVydani_Click" Text="Odarchivuj vydání" />
            </td>
        </tr>
    </table>

</asp:Content>

