<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
    Přihlášení
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 411px;
        }
        .auto-style2 {
            width: 203px;
        }
        .auto-style3 {
            width: 61%;
        }
        .auto-style4 {
            text-align: center;
        }
    .auto-style5 {
        width: 481px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <div align="center">
            <p class="auto-style4">
                <asp:Label ID="Ibl_User" runat="server" ForeColor="#3333CC"></asp:Label>  </p>
            <br />   
            <br />
            <br />
            <asp:Label ID="LB_error" runat="server" ForeColor="Red"></asp:Label>
            <br />
            
            <table ID="tb_prihlaseni" class="auto-style5">
                
                <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right" class="auto-style2">E-mailová adresa&nbsp;</td>
                    <td align="left" class="auto-style1">
            <asp:TextBox ID="TB_email" runat="server" Width="153px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_email" ErrorMessage="! Zadej e-mail" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr >
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td align="right" class="auto-style2" >Heslo&nbsp;</td>
                    <td align="left" class="auto-style1">
                        <asp:TextBox ID="TB_heslo" runat="server" TextMode="Password" Width="151px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_heslo" ErrorMessage="! Zadej heslo" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td class="auto-style2"></td>
                    <td class="auto-style1"><asp:Button ID="BT_login" runat="server" OnClick="BT_login_Click" Text="Login" Width="97px" /></td>
                </tr>
            </table>
            <br />
        
            <br />
            
        </div>
</asp:Content>

