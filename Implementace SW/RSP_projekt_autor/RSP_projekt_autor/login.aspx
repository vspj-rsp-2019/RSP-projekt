<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" Runat="Server">
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
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" Runat="Server">
    <div align="center">
            <br />   
            <br />
            <br />
            <br />
            <table class="auto-style3">
                
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

